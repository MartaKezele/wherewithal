import 'package:flutter/material.dart';
import 'package:wherewithal/components/wrappers/screen.dart';
import 'package:wherewithal/extensions/build_context.dart';
import 'package:wherewithal/extensions/button/button_style_button.dart';
import 'package:wherewithal/extensions/button/filled_button.dart';

import '../../../change_notifiers/auth.dart';
import '../../../components/form/custom_form.dart';
import '../../../components/form/form_fields/password_form_field.dart';
import '../../../constants/spacers.dart';
import '../../../constants/styles/filled_button.dart';
import '../../../dal/repo_factory.dart';
import '../../../app_models/action_result.dart';
import '../../../utils/form.dart';
import '../../../utils/overlay_banner.dart';

class ConfigurePasswordAuth extends StatefulWidget {
  const ConfigurePasswordAuth({super.key});

  @override
  State<ConfigurePasswordAuth> createState() => _ConfigurePasswordAuthState();
}

class _ConfigurePasswordAuthState extends State<ConfigurePasswordAuth> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  bool _linkingAuth = false;
  OverlayEntry? _resultBanner;

  Future<void> _linkPasswordAuth() async {
    setState(() {
      _linkingAuth = true;
    });

    if (AuthChangeNotifier.instance.email == null) {
      setState(() {
        _linkingAuth = false;
        _resultBanner = showActionResultOverlayBanner(
          context,
          ActionResult(
            success: false,
            messageTitle: 'You\'re not signed in.',
          ),
        );
      });
      return;
    }

    await RepoFactory.authRepo()
        .linkWithPasswordCredential(
      AuthChangeNotifier.instance.email!,
      _passwordController.text,
    )
        .then((result) {
      setState(() {
        _linkingAuth = false;
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
            'Configure password',
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
                  fn: _linkPasswordAuth,
                ),
                child: const Text('Confirm'),
              )
                  .addColorStyle(
                      colorStyle: FilledButtonStyles.primary(context))
                  .loadingBtn(
                    constructor: FilledButton.new,
                    isLoading: _linkingAuth,
                    colorStyle: FilledButtonStyles.primary(context),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
