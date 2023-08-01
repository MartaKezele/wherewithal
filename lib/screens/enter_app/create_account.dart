import 'package:flutter/material.dart';

import '../../change_notifiers/auth.dart';
import '../../components/action_result_message.dart';
import '../../components/buttons/loading_label_button.dart';
import '../../components/form_fields/email_form_field.dart';
import '../../components/form_fields/password_form_field.dart';
import '../../components/social_auth.dart';
import '../../dal/repo_factory.dart';
import '../../models/action_result.dart';
import '../../utils/form.dart';
import '../../extensions/build_context.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  ActionResult? _result;
  bool _creatingAccount = false;

  Future<void> _createAccount() async {
    setState(() {
      _result = null;
      _creatingAccount = true;
    });

    final result =
        await RepoFactory.authRepo().createAccountWithEmailAndPassword(
      _emailController.text,
      _passwordController.text,
    );

    if (result.success && !Auth.instance.emailVerified) {
      await RepoFactory.authRepo().sendVerificationEmail();
    }

    setState(() {
      _result = result;
      _creatingAccount = false;
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('Create account'),
          const SocialAuth(),
          Form(
            key: _formKey,
            child: Column(
              children: [
                EmailFormField(controller: _emailController),
                PasswordFormField(controller: _passwordController),
                LoadingLabelButton(
                  label: 'Create account',
                  onPressed: () => executeFnIfFormValid(
                    formKey: _formKey,
                    fn: _createAccount,
                  ),
                  isLoading: _creatingAccount,
                  constructor: ElevatedButton.new,
                ),
                ActionResultMessage(result: _result),
              ],
            ),
          ),
          const Text('Already have an account?'),
          TextButton(
            onPressed: () => context.navigateToSignIn(),
            child: const Text('Sign in'),
          ),
        ],
      ),
    );
  }
}
