import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wherewithal/components/form/custom_form.dart';
import 'package:wherewithal/components/wrappers/enter_app_screen.dart';
import 'package:wherewithal/constants/spacers.dart';
import 'package:wherewithal/extensions/button/button_style_button.dart';

import '../../components/form/form_fields/email_form_field.dart';
import '../../constants/styles/filled_button.dart';
import '../../dal/repo_factory.dart';
import '../../utils/form.dart';
import '../../utils/overlay_banner.dart';

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

  bool _sendingPasswordResetEmail = false;
  OverlayEntry? _resultBanner;

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
  void dispose() {
    _emailController.dispose();
    hideOverlayBanner(_resultBanner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EnterAppScreen(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Forgot password',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      description: Text(
        'Provide your email address and we will send you an email with instructions to reset your password',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      content: Column(
        children: [
          CustomForm(
            formKey: _formKey,
            contents: [
              EmailFormField(controller: _emailController),
              FilledButton(
                onPressed: () => executeFnIfFormValid(
                  formKey: _formKey,
                  fn: _resetPassword,
                ),
                child: const Text('Send'),
              ).addMediumStyle(constructor: FilledButton.new).loadingBtn(
                    constructor: FilledButton.new,
                    isLoading: _sendingPasswordResetEmail,
                    colorStyle: FilledButtonStyles.primary(context),
                  ),
            ],
          ),
          HeightSpacer.xs,
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Go back'),
          ).addMediumStyle(
            constructor: TextButton.new,
          ),
        ],
      ),
    );
  }
}
