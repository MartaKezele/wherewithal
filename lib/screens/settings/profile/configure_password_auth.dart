import 'package:flutter/material.dart';

import '../../../change_notifiers/auth.dart';
import '../../../components/action_result_message.dart';
import '../../../components/buttons/loading_label_button.dart';
import '../../../components/form_fields/password_form_field.dart';
import '../../../dal/repo_factory.dart';
import '../../../models/action_result.dart';
import '../../../utils/form.dart';

class ConfigurePasswordAuth extends StatefulWidget {
  const ConfigurePasswordAuth({super.key});

  @override
  State<ConfigurePasswordAuth> createState() => _ConfigurePasswordAuthState();
}

class _ConfigurePasswordAuthState extends State<ConfigurePasswordAuth> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  bool _linkingAuth = false;
  ActionResult? _linkAuthResult;

  Future<void> _linkPasswordAuth() async {
    setState(() {
      _linkAuthResult = null;
      _linkingAuth = true;
    });

    if (Auth.instance.email == null) {
      setState(() {
        _linkAuthResult = ActionResult(
          success: false,
          message: 'You\'re not signed in.',
        );
        _linkingAuth = false;
      });
      return;
    }

    final result = await RepoFactory.authRepo().linkWithPasswordCredential(
      Auth.instance.email!,
      _passwordController.text,
    );

    setState(() {
      _linkAuthResult = result;
      _linkingAuth = false;
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('Configure password'),
          Form(
            key: _formKey,
            child: Column(
              children: [
                PasswordFormField(
                  controller: _passwordController,
                ),
                Visibility(
                  visible: _linkAuthResult == null ||
                          _linkAuthResult?.success == false
                      ? true
                      : false,
                  child: LoadingLabelButton(
                    label: 'Confirm'.toUpperCase(),
                    onPressed: () => executeFnIfFormValid(
                      formKey: _formKey,
                      fn: _linkPasswordAuth,
                    ),
                    isLoading: _linkingAuth,
                    constructor: TextButton.new,
                  ),
                ),
                ActionResultMessage(
                  result: _linkAuthResult,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
