import 'package:flutter/material.dart';

import '../../../components/action_result_message.dart';
import '../../../components/buttons/loading_label_button.dart';
import '../../../dal/repo_factory.dart';
import '../../../models/action_result.dart';

class ConfigureGoogleAuth extends StatefulWidget {
  const ConfigureGoogleAuth({super.key});

  @override
  State<ConfigureGoogleAuth> createState() => _ConfigureGoogleAuthState();
}

class _ConfigureGoogleAuthState extends State<ConfigureGoogleAuth> {
  bool _linkingAuth = false;
  ActionResult? _linkAuthResult;

  Future<void> _linkGoogleAccount() async {
    setState(() {
      _linkAuthResult = null;
      _linkingAuth = true;
    });

    final result = await RepoFactory.authRepo().linkWithGoogleCredential();

    setState(() {
      _linkAuthResult = result;
      _linkingAuth = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
            'Link google account',
          ),
          Visibility(
            visible:
                _linkAuthResult == null || _linkAuthResult?.success == false
                    ? true
                    : false,
            child: LoadingLabelButton(
              label: 'Confirm'.toUpperCase(),
              onPressed: _linkGoogleAccount,
              isLoading: _linkingAuth,
              constructor: TextButton.new,
            ),
          ),
          ActionResultMessage(
            result: _linkAuthResult,
          ),
        ],
      ),
    );
  }
}
