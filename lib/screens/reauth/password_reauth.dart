import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../change_notifiers/auth.dart';
import '../../components/action_result_message.dart';
import '../../components/buttons/loading_label_button.dart';
import '../../components/form_fields/password_form_field.dart';
import '../../constants/query_param_keys.dart';
import '../../dal/repo_factory.dart';
import '../../models/action_result.dart';
import '../../utils/form.dart';

class PasswordReauth extends StatefulWidget {
  const PasswordReauth({
    super.key,
    required this.nextRouteName,
  });

  final String nextRouteName;

  @override
  State<PasswordReauth> createState() => _PasswordReauthState();
}

class _PasswordReauthState extends State<PasswordReauth> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  bool _reauthenticating = false;
  ActionResult? _result;

  Future<void> _reauthenticate() async {
    setState(() {
      _result = null;
      _reauthenticating = true;
    });

    if (Auth.instance.email == null) {
      setState(() {
        _result = ActionResult(
          success: false,
          message: 'You\'re not signed in',
        );
        _reauthenticating = false;
      });
      return;
    }

    RepoFactory.authRepo()
        .reauthWithPassword(
      Auth.instance.email!,
      _passwordController.text,
    )
        .then((result) {
      setState(() {
        _result = result;
        _reauthenticating = false;
      });

      if (result.success) {
        context.pushReplacementNamed(
          widget.nextRouteName,
          queryParameters: {
            QueryParamKeys.hasReauthenticated: true.toString(),
          },
        );
      }
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
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text('Reauthenticate with password'),
            PasswordFormField(
              controller: _passwordController,
            ),
            LoadingLabelButton(
              label: 'Confirm'.toUpperCase(),
              onPressed: () => executeFnIfFormValid(
                formKey: _formKey,
                fn: _reauthenticate,
              ),
              isLoading: _reauthenticating,
              constructor: TextButton.new,
            ),
            ActionResultMessage(
              result: _result,
            ),
          ],
        ),
      ),
    );
  }
}
