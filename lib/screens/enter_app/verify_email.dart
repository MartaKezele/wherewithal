import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../app_models/action_result.dart';
import '../../change_notifiers/auth.dart';
import '../../change_notifiers/repo_factory.dart';
import '../../components/wrappers/enter_app_screen.dart';
import '../../constants/spacers.dart';
import '../../constants/styles/filled_button.dart';
import '../../constants/styles/outlined_button.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/overlay_banner.dart';
import '../../extensions/button/filled_button.dart';
import '../../extensions/button/outlined_button.dart';
import '../../extensions/button/button_style_button.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool _reloadingUser = false;
  bool _resendingVerificationEmail = false;
  bool _signingOut = false;
  OverlayEntry? _resultBanner;

  void emailVerifiedChangeListener() {
    GetIt.I<AuthChangeNotifier>().removeListener(emailVerifiedChangeListener);
    final localizations = AppLocalizations.of(context);

    final emailVerified = GetIt.I<AuthChangeNotifier>().emailVerified;
    final emailVerifiedResult = ActionResult(
      success: emailVerified,
      messageTitle: emailVerified
          ? localizations.emailVerified
          : localizations.emailNotVerified,
      messageDescription:
          emailVerified ? null : localizations.verificationScreenInstructions,
    );

    setState(() {
      _reloadingUser = false;
    });

    if (!emailVerifiedResult.success) {
      _resultBanner = showActionResultOverlayBanner(
        context,
        emailVerifiedResult,
      );
    }
  }

  Future<void> _reloadUser() async {
    setState(() {
      _reloadingUser = true;
    });

    GetIt.I<AuthChangeNotifier>().addListener(emailVerifiedChangeListener);

    await GetIt.I<RepoFactoryChangeNotifier>()
        .repoFactory
        .userRepo1
        .reloadUser()
        .then((result) {
      if (!result.success) {
        GetIt.I<AuthChangeNotifier>()
            .removeListener(emailVerifiedChangeListener);
        setState(() {
          _reloadingUser = false;
        });
        _resultBanner = showActionResultOverlayBanner(
          context,
          result,
        );
      }
    });
  }

  Future<void> _resendVerificationEmail() async {
    setState(() {
      _resendingVerificationEmail = true;
    });

    await GetIt.I<RepoFactoryChangeNotifier>()
        .repoFactory
        .authRepo
        .sendVerificationEmail()
        .then((result) {
      setState(() {
        _resultBanner = showActionResultOverlayBanner(context, result);
        _resendingVerificationEmail = false;
      });
    });
  }

  Future<void> _signOut() async {
    setState(() {
      _signingOut = true;
    });

    await GetIt.I<RepoFactoryChangeNotifier>()
        .repoFactory
        .authRepo
        .signOut()
        .then((result) {
      setState(() {
        if (!result.success) {
          _resultBanner = showActionResultOverlayBanner(context, result);
        }
        _signingOut = false;
      });
    });
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    GetIt.I<AuthChangeNotifier>().removeListener(emailVerifiedChangeListener);
    hideOverlayBanner(_resultBanner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return EnterAppScreen(
      icon: Icons.verified_user_rounded,
      title: Text(
        localizations.verifyEmail,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      description: Column(
        children: [
          Text(
            localizations.verificationEmailSentMsg,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          HeightSpacer.xxs,
          Text(
            localizations.dontSeeEmailMsg,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      content: Column(
        children: [
          FilledButton(
            onPressed: _reloadUser,
            child: Text(localizations.continueMsg),
          )
              .colorStyle(FilledButtonStyles.enterAppPrimary)
              .bigHeight(constructor: FilledButton.new)
              .loadingBtn(
                constructor: FilledButton.new,
                isLoading: _reloadingUser,
                colorStyle: FilledButtonStyles.enterAppPrimary,
              ),
          HeightSpacer.xs,
          FilledButton(
            onPressed: _resendVerificationEmail,
            child: Text(localizations.resendVerificationEmail),
          )
              .colorStyle(FilledButtonStyles.enterAppSecondary)
              .bigHeight(constructor: FilledButton.new)
              .loadingBtn(
                constructor: FilledButton.new,
                isLoading: _resendingVerificationEmail,
                colorStyle: FilledButtonStyles.enterAppSecondary,
              ),
          HeightSpacer.xs,
          OutlinedButton(
            onPressed: _signOut,
            child: Text(localizations.cancel),
          )
              .colorStyle(FilledButtonStyles.inverseSurface)
              .bigHeight(constructor: FilledButton.new)
              .loadingBtn(
                constructor: OutlinedButton.new,
                isLoading: _signingOut,
                colorStyle: OutlinedButtonStyles.inverseSurface,
              ),
        ],
      ),
    );
  }
}
