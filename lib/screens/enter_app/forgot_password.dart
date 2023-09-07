import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/form/custom_form.dart';
import '../../components/form/form_fields/email_form_field.dart';
import '../../components/wrappers/enter_app_screen.dart';
import '../../constants/spacers.dart';
import '../../constants/styles/filled_button.dart';
import '../../dal/repo_factory.dart';
import '../../utils/app_localizations.dart';
import '../../utils/form.dart';
import '../../utils/form_field_validators.dart';
import '../../utils/overlay_banner.dart';
import '../../extensions/button/button_style_button.dart';

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
  late final ValueNotifier<String> _emailValueNotifier;

  bool _sendingPasswordResetEmail = false;
  OverlayEntry? _resultBanner;

  void _emailListener() {
    _emailValueNotifier.value = _emailController.text;
  }

  Future<void> _resetPassword() async {
    setState(() {
      _sendingPasswordResetEmail = true;
    });

    await RepoFactory.authRepo()
        .sendPasswordResetEmail(_emailController.text)
        .then((result) {
      setState(() {
        _sendingPasswordResetEmail = false;
      });
      _resultBanner = showActionResultOverlayBanner(context, result);
    });
  }

  @override
  void initState() {
    _emailController.text = widget.email ?? '';
    _emailController.addListener(_emailListener);
    _emailValueNotifier = ValueNotifier<String>(_emailController.text);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
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
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          localizations.forgotPassword,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      description: Text(
        localizations.forgotPasswordInstructions,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      content: Column(
        children: [
          CustomForm(
            formKey: _formKey,
            contents: [
              EmailFormField(controller: _emailController),
              ValueListenableBuilder(
                valueListenable: _emailValueNotifier,
                builder: (context, email, child) {
                  return FilledButton(
                    onPressed: !emailValid(email).success
                        ? null
                        : () => executeFnIfFormValid(
                              formKey: _formKey,
                              fn: _resetPassword,
                            ),
                    child: Text(localizations.send),
                  )
                      .addMediumStyle(
                        constructor: FilledButton.new,
                      )
                      .loadingBtn(
                        constructor: FilledButton.new,
                        isLoading: _sendingPasswordResetEmail,
                        colorStyle: FilledButtonStyles.primary,
                      );
                },
              ),
            ],
          ),
          HeightSpacer.xs,
          TextButton(
            onPressed: () => context.pop(),
            child: Text(localizations.goBack),
          ).addMediumStyle(
            constructor: TextButton.new,
          ),
        ],
      ),
    );
  }
}
