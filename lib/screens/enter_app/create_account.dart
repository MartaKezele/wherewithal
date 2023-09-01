import 'package:flutter/material.dart';
import 'package:wherewithal/components/form/custom_form.dart';
import 'package:wherewithal/components/wrappers/enter_app_screen.dart';
import 'package:wherewithal/constants/spacers.dart';
import 'package:wherewithal/extensions/build_context.dart';
import 'package:wherewithal/extensions/button/button_style_button.dart';
import 'package:wherewithal/extensions/button/filled_button.dart';

import '../../components/form/form_fields/email_form_field.dart';
import '../../components/form/form_fields/password_form_field.dart';
import '../../components/social_auth.dart';
import '../../constants/hero_tags.dart';
import '../../constants/styles/filled_button.dart';
import '../../dal/repo_factory.dart';
import '../../utils/form.dart';
import '../../utils/overlay_banner.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _creatingAccount = false;
  OverlayEntry? _resultBanner;

  Future<void> _createAccount() async {
    setState(() {
      _creatingAccount = true;
    });

    await RepoFactory.authRepo()
        .createAccountWithEmailAndPassword(
      _emailController.text,
      _passwordController.text,
    )
        .then((result) async {
      if (!result.success) {
        _resultBanner = showActionResultOverlayBanner(context, result);
        setState(() {
          _creatingAccount = false;
        });
      }
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
    hideOverlayBanner(_resultBanner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EnterAppScreen(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      icon: Icons.wallet_rounded,
      title: Text(
        'Create account',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      content: Expanded(
        flex: 3,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomForm(
                formKey: _formKey,
                contents: [
                  EmailFormField(controller: _emailController),
                  PasswordFormField(controller: _passwordController),
                  Hero(
                    tag: signInBtnHeroTag,
                    child: FilledButton(
                      onPressed: () => executeFnIfFormValid(
                        formKey: _formKey,
                        fn: _createAccount,
                      ),
                      child: const Text('Create account'),
                    )
                        .addColorStyle(
                          colorStyle: FilledButtonStyles.secondary(context),
                        )
                        .addBigStyle(
                          constructor: FilledButton.new,
                        )
                        .loadingBtn(
                          constructor: FilledButton.new,
                          colorStyle: FilledButtonStyles.secondary(context),
                          isLoading: _creatingAccount,
                        ),
                  ),
                ],
              ),
              HeightSpacer.xs,
              const SocialAuth(),
              HeightSpacer.xxl,
              const Text('Already have an account?'),
              TextButton(
                onPressed: () => context.goToSignIn(),
                child: const Text('Sign in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
