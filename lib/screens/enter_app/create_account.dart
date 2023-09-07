import 'package:flutter/material.dart';

import '../../components/form/custom_form.dart';
import '../../components/form/form_fields/email_form_field.dart';
import '../../components/form/form_fields/password_form_field.dart';
import '../../components/social_auth.dart';
import '../../components/value_listenable_builder/value_listenable_builder2.dart';
import '../../components/wrappers/enter_app_screen.dart';
import '../../constants/hero_tags.dart';
import '../../constants/spacers.dart';
import '../../constants/styles/filled_button.dart';
import '../../dal/repo_factory.dart';
import '../../utils/app_localizations.dart';
import '../../utils/form.dart';
import '../../utils/form_field_validators.dart';
import '../../utils/overlay_banner.dart';
import '../../extensions/build_context.dart';
import '../../extensions/button/filled_button.dart';
import '../../extensions/button/button_style_button.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late final ValueNotifier<String> _emailValueNotifier;
  late final ValueNotifier<String> _passwordValueNotifier;

  bool _creatingAccount = false;
  OverlayEntry? _resultBanner;

  void _emailListener() {
    _emailValueNotifier.value = _emailController.text;
  }

  void _passwordListener() {
    _passwordValueNotifier.value = _passwordController.text;
  }

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
  void initState() {
    _emailController.addListener(_emailListener);
    _passwordController.addListener(_passwordListener);
    _emailValueNotifier = ValueNotifier<String>(_emailController.text);
    _passwordValueNotifier = ValueNotifier<String>(_passwordController.text);
    super.initState();
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
        localizations.createAccount,
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
                    child: ValueListenableBuilder2(
                      first: _emailValueNotifier,
                      second: _passwordValueNotifier,
                      builder: (context, email, password, child) {
                        return FilledButton(
                          onPressed: !emailValid(email).success ||
                                  !passwordValid(password).success
                              ? null
                              : () => executeFnIfFormValid(
                                    formKey: _formKey,
                                    fn: _createAccount,
                                  ),
                          child: Text(localizations.createAccount),
                        )
                            .addColorStyle(FilledButtonStyles.secondary)
                            .addBigStyle(constructor: FilledButton.new)
                            .loadingBtn(
                              constructor: FilledButton.new,
                              colorStyle: FilledButtonStyles.secondary,
                              isLoading: _creatingAccount,
                            );
                      },
                    ),
                  ),
                ],
              ),
              HeightSpacer.xs,
              const SocialAuth(),
              HeightSpacer.xxl,
              Text(localizations.alreadyHaveAccount),
              TextButton(
                onPressed: () => context.goToSignIn(),
                child: Text(localizations.signIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
