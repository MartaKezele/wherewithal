import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../change_notifiers/auth.dart';
import '../../../components/form/custom_form.dart';
import '../../../components/form/form_fields/password_form_field.dart';
import '../../../components/wrappers/screen.dart';
import '../../../constants/spacers.dart';
import '../../../constants/styles/filled_button.dart';
import '../../../dal/repo_factory.dart';
import '../../../app_models/action_result.dart';
import '../../../utils/app_localizations.dart';
import '../../../utils/form.dart';
import '../../../utils/overlay_banner.dart';
import '../../../extensions/build_context.dart';
import '../../../extensions/button/filled_button.dart';
import '../../../extensions/button/button_style_button.dart';

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
    final authChangeNotifier = GetIt.I<AuthChangeNotifier>();

    setState(() {
      _linkingAuth = true;
    });

    if (authChangeNotifier.email == null) {
      setState(() {
        _linkingAuth = false;
        _resultBanner = showActionResultOverlayBanner(
          context,
          ActionResult(
            success: false,
            messageTitle: AppLocalizations.of(context).notSignedIn,
          ),
        );
      });
      return;
    }

    await RepoFactory.authRepo()
        .linkWithPasswordCredential(
      authChangeNotifier.email!,
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
    final localizations = AppLocalizations.of(context);

    return Screen(
      appBar: AppBar(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.configurePassword,
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
                child: Text(localizations.confirm),
              )
                  .addColorStyle(
                    FilledButtonStyles.primary,
                  )
                  .loadingBtn(
                    constructor: FilledButton.new,
                    isLoading: _linkingAuth,
                    colorStyle: FilledButtonStyles.primary,
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
