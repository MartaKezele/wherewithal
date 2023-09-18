import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../change_notifiers/auth_repo.dart';
import '../../change_notifiers/currency.dart';
import '../../change_notifiers/date_format.dart';
import '../../change_notifiers/language.dart';
import '../../components/dialogs/currency_dialog.dart';
import '../../components/dialogs/date_format_dialog.dart';
import '../../components/dialogs/language_dialog.dart';
import '../../components/dialogs/theme_mode_dialog.dart';
import '../../constants/padding_size.dart';
import '../../constants/themes/list_tile.dart';
import '../../extensions/build_context.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/theme_mode.dart';

class Settings extends StatefulWidget with GetItStatefulWidgetMixin {
  Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with GetItStateMixin {
  final Future<String> appVersion =
      PackageInfo.fromPlatform().then((packageInfo) => packageInfo.version);

  bool _signingOut = false;

  Future<void> _signOut() async {
    setState(() {
      _signingOut = true;
    });

    await GetIt.I<AuthRepoChangeNotifier>().authRepo.signOut();

    setState(() {
      _signingOut = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final String? language = watchOnly(
      (LanguageChangeNotifier changeNotifier) =>
          changeNotifier.language?.nativeName,
    );

    final String? date = watchOnly(
      (DateFormatChangeNotifier changeNotifier) =>
          changeNotifier.dateFormat?.format(DateTime.now()),
    );

    final String? currency = watchOnly(
      (CurrencyChangeNotifier changeNotifier) => changeNotifier.currency != null
          ? '${changeNotifier.currency?.code} (${changeNotifier.currency?.symbol})'
          : null,
    );

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person_outline_rounded),
            title: Text(localizations.profile),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.pushProfile(),
          ),
          ListTile(
            leading: const Icon(Icons.language_outlined),
            title: Text(localizations.language),
            subtitle: language != null ? Text(language) : null,
            onTap: () => languageDialog(context),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month_outlined),
            title: Text(localizations.dateFormat),
            subtitle: date != null ? Text(date) : null,
            onTap: () => dateFormatDialog(context),
          ),
          ListTile(
            leading: const Icon(Icons.currency_pound_outlined),
            title: Text(localizations.currency),
            subtitle: currency != null ? Text(currency) : null,
            onTap: () => currencyDialog(context),
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode_outlined),
            title: Text(localizations.themeMode),
            subtitle: Text(themeModeName(context: context)),
            onTap: () => themeModeDialog(context),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active_outlined),
            title: Text(localizations.notifications),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.pushNotifications(),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: Text(localizations.version),
            subtitle: FutureBuilder(
              future: appVersion,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!);
                } else if (snapshot.hasError) {
                  return Text(
                    localizations.errorFetchingData,
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
            title: Text(
              localizations.signOut,
              style: const TextStyle(
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
