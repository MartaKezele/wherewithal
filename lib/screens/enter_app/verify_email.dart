import 'package:flutter/material.dart';

import '../../change_notifiers/auth.dart';
import '../../components/action_result_message.dart';
import '../../components/buttons/loading_label_button.dart';
import '../../dal/repo_factory.dart';
import '../../models/action_result.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({
    super.key,
  });

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  ActionResult? _result;
  bool _reloadingUser = false;
  bool _resendingVerificationEmail = false;
  bool _signingOut = false;

  Future<void> _reloadUser() async {
    setState(() {
      _result = null;
      _reloadingUser = true;
    });

    final result = await RepoFactory.userRepo().reloadUser();

    setState(() {
      if (result.success) {
        final emailVerified = Auth.instance.emailVerified;
        _result = ActionResult(
          success: emailVerified,
          message: emailVerified ? 'Email verified' : 'Email not verified',
        );
      } else {
        _result = result;
      }
      _reloadingUser = false;
    });
  }

  Future<void> _resendVerificationEmail() async {
    setState(() {
      _result = null;
      _resendingVerificationEmail = true;
    });

    final result = await RepoFactory.authRepo().sendVerificationEmail();

    setState(() {
      _result = result;
      _resendingVerificationEmail = false;
    });
  }

  Future<void> _signOut() async {
    setState(() {
      _result = null;
      _signingOut = true;
    });

    final result = await RepoFactory.authRepo().signOut();

    setState(() {
      _result = result;
      _signingOut = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('Verify email'),
          LoadingLabelButton(
            label: 'Continue',
            onPressed: _reloadUser,
            isLoading: _reloadingUser,
            constructor: ElevatedButton.new,
          ),
          LoadingLabelButton(
            label: 'Resend verification email',
            onPressed: _resendVerificationEmail,
            isLoading: _resendingVerificationEmail,
            constructor: ElevatedButton.new,
          ),
          LoadingLabelButton(
            label: 'Cancel',
            onPressed: _signOut,
            isLoading: _signingOut,
            constructor: ElevatedButton.new,
          ),
          ActionResultMessage(result: _result),
        ],
      ),
    );
  }
}
