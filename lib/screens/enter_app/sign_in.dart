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

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  ActionResult? _result;
  bool _signingIn = false;

  Future<void> _signIn() async {
    setState(() {
      _result = null;
      _signingIn = true;
    });

    final result = await RepoFactory.authRepo().signInWithEmailAndPassword(
      _emailController.text,
      _passwordController.text,
    );

    if (result.success && !Auth.instance.emailVerified) {
      await RepoFactory.authRepo().sendVerificationEmail();
    }

    setState(() {
      _result = result;
      _signingIn = false;
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
          const Text('Sign in'),
          const SocialAuth(),
          Form(
            key: _formKey,
            child: Column(
              children: [
                EmailFormField(controller: _emailController),
                PasswordFormField(controller: _passwordController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => context.navigateToForgotPassword(
                        _emailController.text,
                      ),
                      child: const Text('Forgot password?'),
                    ),
                  ],
                ),
                LoadingLabelButton(
                  label: 'Sign in',
                  onPressed: () => executeFnIfFormValid(
                    formKey: _formKey,
                    fn: _signIn,
                  ),
                  isLoading: _signingIn,
                  constructor: ElevatedButton.new,
                ),
                ActionResultMessage(result: _result),
              ],
            ),
          ),
          const Text('Don\'t have an account?'),
          TextButton(
            onPressed: () => context.navigateToCreateAccount(),
            child: const Text('Create account'),
          ),
        ],
      ),
    );
  }
}
