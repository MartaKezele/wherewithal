import 'package:flutter/material.dart';

import '../../components/form/custom_form.dart';
import '../../components/form/form_fields/email_form_field.dart';
import '../../components/form/form_fields/password_form_field.dart';
import '../../components/social_auth.dart';
import '../../components/wrappers/enter_app_screen.dart';
import '../../constants/hero_tags.dart';
import '../../constants/spacers.dart';
import '../../constants/styles/filled_button.dart';
import '../../dal/repo_factory.dart';
import '../../utils/app_localizations.dart';
import '../../utils/form.dart';
import '../../utils/overlay_banner.dart';
import '../../extensions/build_context.dart';
import '../../extensions/button/filled_button.dart';
import '../../extensions/button/button_style_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _signingIn = false;
  OverlayEntry? _resultBanner;

  Future<void> _signIn() async {
    setState(() {
      _signingIn = true;
    });

    await RepoFactory.authRepo()
        .signInWithEmailAndPassword(
      _emailController.text,
      _passwordController.text,
    )
        .then((result) async {
      if (!result.success) {
        _resultBanner = showActionResultOverlayBanner(context, result);
        setState(() {
          _signingIn = false;
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
    final localizations = AppLocalizations.of(context);

    return EnterAppScreen(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      icon: Icons.wallet_rounded,
      title: Text(
        localizations.signIn,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => context.pushForgotPassword(
                          _emailController.text,
                        ),
                        child: Text('${localizations.forgotPassword}?'),
                      ),
                    ],
                  ),
                  Hero(
                    tag: signInBtnHeroTag,
                    child: FilledButton(
                      onPressed: () => executeFnIfFormValid(
                        formKey: _formKey,
                        fn: _signIn,
                      ),
                      child: Text(localizations.signIn),
                    )
                        .addColorStyle(FilledButtonStyles.primary)
                        .addBigStyle(constructor: FilledButton.new)
                        .loadingBtn(
                          constructor: FilledButton.new,
                          colorStyle: FilledButtonStyles.primary,
                          isLoading: _signingIn,
                        ),
                  ),
                ],
              ),
              HeightSpacer.xs,
              const SocialAuth(),
              HeightSpacer.xxl,
              Text(localizations.dontHaveAccount),
              TextButton(
                onPressed: () => context.goToCreateAccount(),
                child: Text(localizations.createAccount),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
