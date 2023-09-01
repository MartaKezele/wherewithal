import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:wherewithal/change_notifiers/currency.dart';
import 'package:wherewithal/change_notifiers/date_format.dart';
import 'package:wherewithal/change_notifiers/language.dart';
import 'package:wherewithal/components/dialogs/currency_dialog.dart';
import 'package:wherewithal/components/dialogs/date_format_dialog.dart';
import 'package:wherewithal/components/dialogs/language_dialog.dart';
import 'package:wherewithal/components/dialogs/theme_mode_dialog.dart';
import 'package:wherewithal/constants/themes/list_tile.dart';
import 'package:wherewithal/utils/app_localizations.dart';

import '../../constants/padding_size.dart';
import '../../dal/repo_factory.dart';
import '../../extensions/build_context.dart';
import '../../utils/theme_mode.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final Future<String> appVersion =
      PackageInfo.fromPlatform().then((packageInfo) => packageInfo.version);

  bool _signingOut = false;

  Future<void> _signOut() async {
    setState(() {
      _signingOut = true;
    });

    await RepoFactory.authRepo().signOut();

    setState(() {
      _signingOut = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final languageChangeNotifier = context.watch<LanguageChangeNotifier>();
    final dateFormatChangeNotifier = context.watch<DateFormatChangeNotifier>();
    final currencyChangeNotifier = context.watch<CurrencyChangeNotifier>();

    final String? language = languageChangeNotifier.language?.nativeName;

    final String? date =
        dateFormatChangeNotifier.dateFormat(context)?.format(DateTime.now());

    final String? currency = currencyChangeNotifier.currency != null
        ? '${currencyChangeNotifier.currency?.code} (${currencyChangeNotifier.currency?.symbol})'
        : null;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person_outline_rounded),
            title: const Text('Profile'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.pushProfile(),
          ),
          ListTile(
            leading: const Icon(Icons.language_outlined),
            title: Text(AppLocalizations.of(context).language),
            subtitle: language != null ? Text(language) : null,
            onTap: () => languageDialog(context),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month_outlined),
            title: const Text('Date format'),
            subtitle: date != null ? Text(date) : null,
            onTap: () => dateFormatDialog(context),
          ),
          ListTile(
            leading: const Icon(Icons.currency_pound_outlined),
            title: const Text('Currency'),
            subtitle: currency != null ? Text(currency) : null,
            onTap: () => currencyDialog(context),
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode_outlined),
            title: const Text('Theme mode'),
            subtitle: Text(themeModeName(context: context)),
            onTap: () => themeModeDialog(context),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active_outlined),
            title: const Text('Notifications'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => print('notifications'),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: const Text('Version'),
            subtitle: FutureBuilder(
              future: appVersion,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!);
                } else if (snapshot.hasError) {
                  return Text(
                    'Error fetching data',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  );
                } else {
                  return const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: PaddingSize.xxs,
                        ),
                        child: SizedBox(
                          height: PaddingSize.sm,
                          width: PaddingSize.sm,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          ListTile(
            leading: _signingOut
                ? SizedBox(
                    width: leadingIconSize,
                    height: leadingIconSize,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.error,
                      strokeWidth: 3,
                    ),
                  )
                : const Icon(Icons.logout_outlined),
            title: const Text(
              'Sign out',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: _signOut,
            textColor: Theme.of(context).colorScheme.error,
            iconColor: Theme.of(context).colorScheme.error,
          ),
        ],
      ),
    );
  }
}
