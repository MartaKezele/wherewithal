import 'package:flutter/material.dart';
import 'package:wherewithal/components/wrappers/enter_app_screen.dart';
import 'package:wherewithal/extensions/button/button_style_button.dart';
import 'package:wherewithal/extensions/button/filled_button.dart';
import 'package:wherewithal/extensions/button/outlined_button.dart';

import '../../app_models/action_result.dart';
import '../../change_notifiers/auth.dart';
import '../../constants/spacers.dart';
import '../../constants/styles/filled_button.dart';
import '../../constants/styles/outlined_button.dart';
import '../../dal/repo_factory.dart';
import '../../utils/overlay_banner.dart';

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
    final emailVerified = AuthChangeNotifier.instance.emailVerified;
    final emailVerifiedResult = ActionResult(
      success: emailVerified,
      messageTitle: emailVerified ? 'Email verified' : 'Email not verified',
      messageDescription: emailVerified
          ? null
          : 'Follow the instructions in the verification email or click on the resend button.',
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

    AuthChangeNotifier.instance.addListener(emailVerifiedChangeListener);

    await RepoFactory.userRepo().reloadUser().then((result) {
      if (!result.success) {
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

    await RepoFactory.authRepo().sendVerificationEmail().then((result) {
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

    await RepoFactory.authRepo().signOut().then((result) {
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
    AuthChangeNotifier.instance.removeListener(emailVerifiedChangeListener);
    hideOverlayBanner(_resultBanner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EnterAppScreen(
      icon: Icons.verified_user_rounded,
      title: Text(
        'Verify email',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      description: Column(
        children: [
          Text(
            'A verification email has been sent to your email address, follow the instructions in the email to verify account.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          HeightSpacer.xxs,
          Text(
            'Don\'t see the email? Check your spam folder.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      content: Column(
        children: [
          FilledButton(
            onPressed: _reloadUser,
            child: const Text('Continue'),
          )
              .addColorStyle(colorStyle: FilledButtonStyles.primary(context))
              .addBigStyle(constructor: FilledButton.new)
              .loadingBtn(
                constructor: FilledButton.new,
                isLoading: _reloadingUser,
                colorStyle: FilledButtonStyles.primary(context),
              ),
          HeightSpacer.xs,
          FilledButton(
            onPressed: _resendVerificationEmail,
            child: const Text('Resend verification email'),
          )
              .addColorStyle(colorStyle: FilledButtonStyles.secondary(context))
              .addBigStyle(constructor: FilledButton.new)
              .loadingBtn(
                constructor: FilledButton.new,
                isLoading: _resendingVerificationEmail,
                colorStyle: FilledButtonStyles.secondary(context),
              ),
          HeightSpacer.xs,
          OutlinedButton(
            onPressed: _signOut,
            child: const Text('Cancel'),
          )
              .addColorStyle(
                  colorStyle: OutlinedButtonStyles.inverseSurface(context))
              .addBigStyle(constructor: FilledButton.new)
              .loadingBtn(
                constructor: OutlinedButton.new,
                isLoading: _signingOut,
                colorStyle: OutlinedButtonStyles.inverseSurface(context),
              ),
        ],
      ),
    );
  }
}
