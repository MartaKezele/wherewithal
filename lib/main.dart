import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:wherewithal/utils/prefs.dart';

import 'app_models/currency.dart';
import 'app_models/language.dart';
import 'change_notifiers/currency.dart';
import 'change_notifiers/date_format.dart';
import 'change_notifiers/language.dart';
import 'config/countries.dart';
import 'config/date_format_patterns.dart';
import 'config/router.dart';
import 'config/shared_prefs_keys.dart';
import 'constants/themes/themes.dart';
import 'firebase_options.dart';
import 'utils/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final adaptiveThemeMode = await AdaptiveTheme.getThemeMode();
  final languageCode = await fetchStringPref(SharedPrefsKeys.languageCode);
  final countryCode = await fetchStringPref(SharedPrefsKeys.countryCode);
  final dateFormatPattern =
      await fetchStringPref(SharedPrefsKeys.dateFormatPattern) ??
          dateFormatPatterns[0];
  final currencyCode = await fetchStringPref(SharedPrefsKeys.currency);

  final currency = countries
      .firstWhere(
        (country) => country.currency.code == currencyCode,
        orElse: () => defaultCountry,
      )
      .currency;

  final locale = languageCode != null && languageCode != ''
      ? Locale(languageCode, countryCode)
      : null;

  final language = countries
      .firstWhere(
        (country) => country.language.locale == locale,
        orElse: () => defaultCountry,
      )
      .language;

  runApp(
    WherewithalApp(
      adaptiveThemeMode: adaptiveThemeMode,
      language: language,
      dateFormatPattern: dateFormatPattern,
      currency: currency,
    ),
  );
}

class WherewithalApp extends StatelessWidget {
  const WherewithalApp({
    super.key,
    this.adaptiveThemeMode,
    this.language,
    this.dateFormatPattern,
    this.currency,
  });

  final AdaptiveThemeMode? adaptiveThemeMode;
  final Language? language;
  final String? dateFormatPattern;
  final Currency? currency;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightColorTheme(context),
      dark: darkColorTheme(context),
      initial: adaptiveThemeMode ?? AdaptiveThemeMode.system,
      builder: (ThemeData theme, ThemeData darkTheme) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => LanguageChangeNotifier(language),
            ),
            ChangeNotifierProvider(
              create: (_) => DateFormatChangeNotifier(dateFormatPattern),
            ),
            ChangeNotifierProvider(
              create: (_) => CurrencyChangeNotifier(currency),
            ),
          ],
          child: Consumer3<LanguageChangeNotifier, DateFormatChangeNotifier,
              CurrencyChangeNotifier>(
            builder: (
              context,
              appLocaleChangeNotifier,
              dateFormatChangeNotifier,
              currencyChangeNotifier,
              _,
            ) {
              return ValueListenableBuilder(
                valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
                builder: (context, mode, _) {
                  return MaterialApp.router(
                    routerConfig: router,
                    locale: appLocaleChangeNotifier.language?.locale,
                    title: 'Wherewithal',
                    theme: lightColorTheme(context),
                    darkTheme: darkColorTheme(context),
                    themeMode: themeMode[mode],
                    localizationsDelegates: const [
                      AppLocalizationsDelegate(),
                      ...GlobalMaterialLocalizations.delegates,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    supportedLocales:
                        countries.map((country) => country.language.locale),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
