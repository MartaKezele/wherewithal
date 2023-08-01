import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/action_result_message.dart';
import '../../components/buttons/loading_label_button.dart';
import '../../components/form_fields/email_form_field.dart';
import '../../dal/repo_factory.dart';
import '../../models/action_result.dart';
import '../../utils/form.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({
    super.key,
    this.email,
  });

  final String? email;

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  ActionResult? _result;
  bool _sendingPasswordResetEmail = false;

  Future<void> _resetPassword() async {
    setState(() {
      _result = null;
      _sendingPasswordResetEmail = true;
    });

    final result = await RepoFactory.authRepo().sendPasswordResetEmail(_emailController.text);

    setState(() {
      _result = result;
      _sendingPasswordResetEmail = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    _emailController.text = _emailController.text.isNotEmpty
        ? _emailController.text
        : widget.email ?? '';

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('Forgot password'),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                EmailFormField(controller: _emailController),
                LoadingLabelButton(
                  label: 'Send',
                  onPressed: () => executeFnIfFormValid(
                    formKey: _formKey,
                    fn: _resetPassword,
                  ),
                  isLoading: _sendingPasswordResetEmail,
                  constructor: ElevatedButton.new,
                ),
                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text('Go back'),
                ),
                ActionResultMessage(result: _result),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
