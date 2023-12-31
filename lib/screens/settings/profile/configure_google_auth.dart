import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../change_notifiers/auth.dart';
import '../../../change_notifiers/repo_factory.dart';
import '../../../components/wrappers/screen.dart';
import '../../../config/auth_provider.dart';
import '../../../constants/spacers.dart';
import '../../../constants/styles/filled_button.dart';
import '../../../l10n/app_localizations.dart';
import '../../../utils/overlay_banner.dart';
import '../../../extensions/button/filled_button.dart';
import '../../../extensions/button/button_style_button.dart';

class ConfigureGoogleAuth extends StatefulWidget with GetItStatefulWidgetMixin {
  ConfigureGoogleAuth({super.key});

  @override
  State<ConfigureGoogleAuth> createState() => _ConfigureGoogleAuthState();
}

class _ConfigureGoogleAuthState extends State<ConfigureGoogleAuth>
    with GetItStateMixin {
  bool _linkingAuth = false;
  OverlayEntry? _resultBanner;

  Future<void> _linkGoogleAccount() async {
    setState(() {
      _linkingAuth = true;
    });

    await GetIt.I<RepoFactoryChangeNotifier>()
        .repoFactory
        .authRepo
        .linkWithGoogleCredential()
        .then((result) {
      setState(() {
        _linkingAuth = false;
      });
      _resultBanner = showActionResultOverlayBanner(context, result);
    });
  }

  @override
  void dispose() {
    hideOverlayBanner(_resultBanner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final authProviders = watchOnly(
      (AuthChangeNotifier changeNotifier) => changeNotifier.authProviders,
    );

    return Screen(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            localizations.linkGoogleAccount,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.start,
          ),
          HeightSpacer.md,
          FilledButton(
            onPressed: authProviders.contains(AuthProvider.google)
                ? null
                : _linkGoogleAccount,
            child: Text(localizations.confirm),
          )
              .colorStyle(
                FilledButtonStyles.primaryContainer,
              )
              .loadingBtn(
                constructor: FilledButton.new,
                isLoading: _linkingAuth,
                colorStyle: FilledButtonStyles.primaryContainer,
              ),
        ],
      ),
    );
  }
}
