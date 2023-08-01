import 'package:flutter/material.dart';

import '../dal/repo_factory.dart';
import '../models/action_result.dart';
import 'action_result_message.dart';
import 'buttons/loading_label_button.dart';

class SocialAuth extends StatefulWidget {
  const SocialAuth({super.key});

  @override
  State<SocialAuth> createState() => _SocialAuthState();
}

class _SocialAuthState extends State<SocialAuth> {
  ActionResult? _result;
  bool _loading = false;

  Future<void> _continueWithGoogle() async {
    setState(() {
      _loading = true;
    });

    final result = await RepoFactory.authRepo().continueWithGoogle();

    setState(() {
      _result = result;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingLabelButton(
          label: 'Continue with Google',
          onPressed: _continueWithGoogle,
          isLoading: _loading,
          constructor: ElevatedButton.new,
        ),
        ActionResultMessage(result: _result),
      ],
    );
  }
}
