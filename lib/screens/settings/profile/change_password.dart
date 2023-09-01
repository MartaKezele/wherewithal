import 'package:flutter/material.dart';
import 'package:wherewithal/components/wrappers/screen.dart';
import 'package:wherewithal/extensions/build_context.dart';
import 'package:wherewithal/extensions/button/button_style_button.dart';
import 'package:wherewithal/extensions/button/filled_button.dart';

import '../../../components/form/custom_form.dart';
import '../../../components/form/form_fields/password_form_field.dart';
import '../../../constants/spacers.dart';
import '../../../constants/styles/filled_button.dart';
import '../../../dal/repo_factory.dart';
import '../../../utils/form.dart';
import '../../../utils/overlay_banner.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  bool _changingPassword = false;
  OverlayEntry? _resultBanner;

  Future<void> _changePassword() async {
    setState(() {
      _changingPassword = true;
    });

    await RepoFactory.userRepo()
        .updatePassword(
      _passwordController.text,
    )
        .then((result) {
      setState(() {
        _changingPassword = false;
      });

      if (result.success) {
        showActionResultOverlayBanner(context, result);
        context.goToProfile();
      } else {
        _resultBanner = showActionResultOverlayBanner(context, result);
      }
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    hideOverlayBanner(_resultBanner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Change password',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          HeightSpacer.md,
          CustomForm(
            formKey: _formKey,
            contents: [
              PasswordFormField(
                controller: _passwordController,
              ),
              FilledButton(
                onPressed: () => executeFnIfFormValid(
                  formKey: _formKey,
                  fn: _changePassword,
                ),
                child: const Text('Confirm'),
              )
                  .addColorStyle(
                      colorStyle: FilledButtonStyles.primary(context))
                  .loadingBtn(
                    constructor: FilledButton.new,
                    isLoading: _changingPassword,
                    colorStyle: FilledButtonStyles.primary(context),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
