import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wherewithal/components/wrappers/screen.dart';
import 'package:wherewithal/config/auth_provider.dart';
import 'package:wherewithal/constants/spacers.dart';
import 'package:wherewithal/constants/styles/filled_button.dart';
import 'package:wherewithal/extensions/build_context.dart';
import 'package:wherewithal/extensions/button/button_style_button.dart';
import 'package:wherewithal/extensions/button/filled_button.dart';
import 'package:wherewithal/utils/overlay_banner.dart';

import '../../../change_notifiers/auth.dart';
import '../../../dal/repo_factory.dart';

class ConfigureGoogleAuth extends StatefulWidget {
  const ConfigureGoogleAuth({super.key});

  @override
  State<ConfigureGoogleAuth> createState() => _ConfigureGoogleAuthState();
}

class _ConfigureGoogleAuthState extends State<ConfigureGoogleAuth> {
  bool _linkingAuth = false;
  OverlayEntry? _resultBanner;

  Future<void> _linkGoogleAccount() async {
    setState(() {
      _linkingAuth = true;
    });

    await RepoFactory.authRepo().linkWithGoogleCredential().then((result) {
      setState(() {
        _linkingAuth = false;
      });
      if (result.success) {
        showActionResultOverlayBanner(context, result);
        context.goToProfile();
      } else {
        _resultBanner = showActionResultOverlayBanner(context, result);
      }
    });
  }

  @override
  void dispose() {
    hideOverlayBanner(_resultBanner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Link google account',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.start,
          ),
          HeightSpacer.md,
          ChangeNotifierProvider.value(
            value: AuthChangeNotifier.instance,
            child: Consumer<AuthChangeNotifier>(
              builder: (_, auth, __) {
                return FilledButton(
                  onPressed: auth.authProviders.contains(AuthProvider.google)
                      ? null
                      : _linkGoogleAccount,
                  child: const Text('Confirm'),
                )
                    .addColorStyle(
                        colorStyle: FilledButtonStyles.primary(context))
                    .loadingBtn(
                      constructor: FilledButton.new,
                      isLoading: _linkingAuth,
                      colorStyle: FilledButtonStyles.primary(context),
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
