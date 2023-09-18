import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:wherewithal/change_notifiers/auth_repo.dart';
import 'package:wherewithal/dal/repo_factory.dart';

import 'change_notifiers/auth.dart';
import 'change_notifiers/currency.dart';
import 'change_notifiers/date_format.dart';
import 'change_notifiers/language.dart';
import 'change_notifiers/user_repo.dart';
import 'config/countries.dart';
import 'config/date_format_patterns.dart';
import 'config/router.dart';
import 'config/keys/shared_prefs.dart';
import 'constants/themes/themes.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';
import 'utils/prefs.dart';

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

  String localeStr = languageCode != null && countryCode != null
      ? '${languageCode}_$countryCode'
      : defaultLocaleStr;

  final getIt = GetIt.instance;

  getIt.registerSingleton<CurrencyChangeNotifier>(
    CurrencyChangeNotifier(currency),
  );
  getIt.registerSingleton<LanguageChangeNotifier>(
    LanguageChangeNotifier(language),
  );
  getIt.registerSingleton<DateFormatChangeNotifier>(
    DateFormatChangeNotifier(dateFormatPattern),
  );
  getIt.registerSingleton<AuthChangeNotifier>(
    AuthChangeNotifier.instance,
  );

  getIt.registerSingleton<AuthRepoChangeNotifier>(
    AuthRepoChangeNotifier(
      RepoFactory.authRepo(localeStr),
    ),
  );
  getIt.registerSingleton<UserRepoChangeNotifier>(
    UserRepoChangeNotifier(
      RepoFactory.userRepo(localeStr),
    ),
  );

  runApp(
    WherewithalApp(
      adaptiveThemeMode: adaptiveThemeMode,
    ),
  );
}

class WherewithalApp extends StatelessWidget {
  const WherewithalApp({
    super.key,
    this.adaptiveThemeMode,
  });

  final AdaptiveThemeMode? adaptiveThemeMode;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightColorTheme(context),
      dark: darkColorTheme(context),
      initial: adaptiveThemeMode ?? AdaptiveThemeMode.system,
      builder: (ThemeData lightTheme, ThemeData darkTheme) {
        return App(
          lightTheme: lightTheme,
          darkTheme: darkTheme,
        );
      },
    );
  }
}

class App extends StatelessWidget with GetItMixin {
  App({
    super.key,
    this.lightTheme,
    this.darkTheme,
  });

  final ThemeData? lightTheme;
  final ThemeData? darkTheme;

  @override
  Widget build(BuildContext context) {
    final locale = watchOnly(
      (LanguageChangeNotifier changeNotifier) =>
          changeNotifier.language?.locale,
    );

    return ValueListenableBuilder(
      valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
      builder: (_, mode, __) {
        return MaterialApp.router(
          routerConfig: router,
          locale: locale,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode[mode],
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            ...GlobalMaterialLocalizations.delegates,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: countries.map((country) => country.language.locale),
        );
      },
    );
  }
}
