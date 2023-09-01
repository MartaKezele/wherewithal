import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wherewithal/components/form/custom_form.dart';
import 'package:wherewithal/components/wrappers/screen.dart';
import 'package:wherewithal/constants/spacers.dart';
import 'package:wherewithal/constants/styles/filled_button.dart';
import 'package:wherewithal/extensions/button/button_style_button.dart';
import 'package:wherewithal/extensions/button/filled_button.dart';

import '../../change_notifiers/auth.dart';
import '../../components/form/form_fields/password_form_field.dart';
import '../../constants/query_param_keys.dart';
import '../../dal/repo_factory.dart';
import '../../app_models/action_result.dart';
import '../../utils/form.dart';
import '../../utils/overlay_banner.dart';

class PasswordReauth extends StatefulWidget {
  const PasswordReauth({
    super.key,
    required this.nextRouteName,
  });

  final String nextRouteName;

  @override
  State<PasswordReauth> createState() => _PasswordReauthState();
}

class _PasswordReauthState extends State<PasswordReauth> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  bool _reauthenticating = false;
  OverlayEntry? _resultBanner;

  Future<void> _reauthenticate() async {
    setState(() {
      _reauthenticating = true;
    });

    if (AuthChangeNotifier.instance.email == null) {
      setState(() {
        _resultBanner = showActionResultOverlayBanner(
          context,
          ActionResult(
            success: false,
            messageTitle: 'You\'re not signed in',
          ),
        );

        _reauthenticating = false;
      });
      return;
    }

    await RepoFactory.authRepo()
        .reauthWithPassword(
      AuthChangeNotifier.instance.email!,
      _passwordController.text,
    )
        .then((result) {
      setState(() {
        if (!result.success) {
          _resultBanner = showActionResultOverlayBanner(
            context,
            result,
          );
        }
        _reauthenticating = false;
      });

      if (result.success) {
        context.pushReplacementNamed(
          widget.nextRouteName,
          queryParameters: {
            QueryParamKeys.hasReauthenticated: true.toString(),
          },
        );
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Reauthenticate with password',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.start,
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
                  fn: _reauthenticate,
                ),
                child: const Text('Confirm'),
              )
                  .addColorStyle(
                      colorStyle: FilledButtonStyles.primary(context))
                  .loadingBtn(
                    constructor: FilledButton.new,
                    isLoading: _reauthenticating,
                    colorStyle: FilledButtonStyles.primary(context),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
