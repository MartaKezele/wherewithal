import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../change_notifiers/repo_factory.dart';
import '../../components/form/custom_form.dart';
import '../../components/form/form_fields/email_form_field.dart';
import '../../components/form/form_fields/password_form_field.dart';
import '../../components/social_auth.dart';
import '../../components/value_listenable_builder/value_listenable_builder2.dart';
import '../../components/wrappers/enter_app_screen.dart';
import '../../constants/hero_tags.dart';
import '../../constants/spacers.dart';
import '../../constants/styles/filled_button.dart';
import '../../l10n/app_localizations.dart';
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
  late final ValueNotifier<String> _emailValueNotifier;
  late final ValueNotifier<String> _passwordValueNotifier;

  bool _signingIn = false;
  OverlayEntry? _resultBanner;

  void _emailListener() {
    _emailValueNotifier.value = _emailController.text;
  }

  void _passwordListener() {
    _passwordValueNotifier.value = _passwordController.text;
  }

  Future<void> _signIn() async {
    setState(() {
      _signingIn = true;
    });

    await GetIt.I<RepoFactoryChangeNotifier>()
        .repoFactory
        .authRepo
        .signInWithEmailAndPassword(
          _emailController.text.trim(),
          _passwordController.text.trim(),
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
  void initState() {
    _emailController.addListener(_emailListener);
    _passwordController.addListener(_passwordListener);
    _emailValueNotifier = ValueNotifier<String>(_emailController.text);
    _passwordValueNotifier = ValueNotifier<String>(_passwordController.text);
    super.initState();
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
                    child: ValueListenableBuilder2(
                      first: _emailValueNotifier,
                      second: _passwordValueNotifier,
                      builder: (context, email, password, child) {
                        return FilledButton(
                          onPressed: () => executeFnIfFormValid(
                            formKey: _formKey,
                            fn: _signIn,
                          ),
                          child: Text(localizations.signIn),
                        )
                            .colorStyle(FilledButtonStyles.enterAppPrimary)
                            .bigHeight(constructor: FilledButton.new)
                            .loadingBtn(
                              constructor: FilledButton.new,
                              colorStyle: FilledButtonStyles.enterAppPrimary,
                              isLoading: _signingIn,
                            );
                      },
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
