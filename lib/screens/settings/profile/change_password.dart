import 'package:flutter/material.dart';

import '../../../components/form/custom_form.dart';
import '../../../components/form/form_fields/password_form_field.dart';
import '../../../components/wrappers/screen.dart';
import '../../../constants/spacers.dart';
import '../../../constants/styles/filled_button.dart';
import '../../../dal/repo_factory.dart';
import '../../../l10n/app_localizations.dart';
import '../../../utils/form.dart';
import '../../../utils/form_field_validators.dart';
import '../../../utils/overlay_banner.dart';
import '../../../extensions/build_context.dart';
import '../../../extensions/button/filled_button.dart';
import '../../../extensions/button/button_style_button.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  late final ValueNotifier<String> _passwordValueNotifier;

  bool _changingPassword = false;
  OverlayEntry? _resultBanner;

  void _passwordListener() {
    _passwordValueNotifier.value = _passwordController.text;
  }

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
  void initState() {
    _passwordController.addListener(_passwordListener);
    _passwordValueNotifier = ValueNotifier<String>(_passwordController.text);
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    hideOverlayBanner(_resultBanner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Screen(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.changePassword,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          HeightSpacer.md,
          CustomForm(
            formKey: _formKey,
            contents: [
              PasswordFormField(
                controller: _passwordController,
              ),
              ValueListenableBuilder(
                valueListenable: _passwordValueNotifier,
                builder: (context, password, _) {
                  return FilledButton(
                    onPressed: !passwordValid(password).success
                        ? null
                        : () => executeFnIfFormValid(
                              formKey: _formKey,
                              fn: _changePassword,
                            ),
                    child: Text(localizations.confirm),
                  )
                      .colorStyle(
                        FilledButtonStyles.primaryContainer,
                      )
                      .loadingBtn(
                        constructor: FilledButton.new,
                        isLoading: _changingPassword,
                        colorStyle: FilledButtonStyles.primaryContainer,
                      );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
