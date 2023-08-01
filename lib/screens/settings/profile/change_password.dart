import 'package:flutter/material.dart';

import '../../../components/action_result_message.dart';
import '../../../components/buttons/loading_label_button.dart';
import '../../../components/form_fields/password_form_field.dart';
import '../../../dal/repo_factory.dart';
import '../../../models/action_result.dart';
import '../../../utils/form.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  bool _changingPassword = false;
  ActionResult? _result;

  Future<void> _changePassword() async {
    setState(() {
      _result = null;
      _changingPassword = true;
    });

    final result = await RepoFactory.userRepo().updatePassword(
      _passwordController.text,
    );

    setState(() {
      _result = result;
      _changingPassword = false;
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
          const Text('Change password'),
          Form(
            key: _formKey,
            child: Column(
              children: [
                PasswordFormField(
                  controller: _passwordController,
                ),
                Visibility(
                  visible: _result == null || _result?.success == false
                      ? true
                      : false,
                  child: LoadingLabelButton(
                    label: 'Confirm'.toUpperCase(),
                    onPressed: () => executeFnIfFormValid(
                      formKey: _formKey,
                      fn: _changePassword,
                    ),
                    isLoading: _changingPassword,
                    constructor: TextButton.new,
                  ),
                ),
                ActionResultMessage(
                  result: _result,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
