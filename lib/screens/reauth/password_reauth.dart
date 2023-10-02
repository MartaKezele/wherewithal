import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../change_notifiers/auth.dart';
import '../../change_notifiers/repo_factory.dart';
import '../../components/form/custom_form.dart';
import '../../components/form/form_fields/password_form_field.dart';
import '../../components/wrappers/screen.dart';
import '../../config/keys/query_param.dart';
import '../../constants/spacers.dart';
import '../../constants/styles/filled_button.dart';
import '../../app_models/action_result.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/form.dart';
import '../../utils/overlay_banner.dart';
import '../../extensions/button/filled_button.dart';
import '../../extensions/button/button_style_button.dart';

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
  late final ValueNotifier<String> _passwordValueNotifier;

  bool _reauthenticating = false;
  OverlayEntry? _resultBanner;

  void _passwordListener() {
    _passwordValueNotifier.value = _passwordController.text;
  }

  Future<void> _reauthenticate() async {
    final authChangeNotifier = GetIt.I<AuthChangeNotifier>();

    setState(() {
      _reauthenticating = true;
    });

    if (authChangeNotifier.email == null) {
      setState(() {
        _resultBanner = showActionResultOverlayBanner(
          context,
          ActionResult(
            success: false,
            messageTitle: AppLocalizations.of(context).notSignedIn,
          ),
        );

        _reauthenticating = false;
      });
      return;
    }

    await GetIt.I<RepoFactoryChangeNotifier>()
        .repoFactory
        .authRepo
        .reauthWithPassword(
          authChangeNotifier.email!,
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            localizations.reauthenticateWithPassword,
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
              ValueListenableBuilder(
                valueListenable: _passwordValueNotifier,
                builder: (context, password, _) {
                  return FilledButton(
                    onPressed:  () => executeFnIfFormValid(
                              formKey: _formKey,
                              fn: _reauthenticate,
                            ),
                    child: Text(localizations.confirm),
                  )
                      .colorStyle(
                        FilledButtonStyles.primaryContainer,
                      )
                      .loadingBtn(
                        constructor: FilledButton.new,
                        isLoading: _reauthenticating,
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
