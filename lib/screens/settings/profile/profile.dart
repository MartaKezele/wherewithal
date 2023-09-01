import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wherewithal/components/form/custom_form.dart';
import 'package:wherewithal/components/wrappers/screen.dart';
import 'package:wherewithal/constants/spacers.dart';
import 'package:wherewithal/constants/styles/filled_button.dart';
import 'package:wherewithal/constants/styles/outlined_button.dart';
import 'package:wherewithal/extensions/button/button_style_button.dart'
    as button_style_button_extensions;
import 'package:wherewithal/extensions/button/filled_button.dart';
import 'package:wherewithal/extensions/button/outlined_button.dart';

import '../../../change_notifiers/auth.dart';
import '../../../components/auth_provider_card.dart';
import '../../../components/form/form_fields/email_form_field.dart';
import '../../../config/auth_provider.dart';
import '../../../dal/repo_factory.dart';
import '../../../utils/form.dart';
import '../../../extensions/build_context.dart';
import '../../../utils/overlay_banner.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  final _displayNameController = TextEditingController();
  final _emailController = TextEditingController(
    text: AuthChangeNotifier.instance.email ?? '',
  );

  bool _savingChanges = false;
  OverlayEntry? _resultBanner;

  Future<void> _saveChanges() async {
    setState(() {
      _savingChanges = true;
    });

    await RepoFactory.userRepo()
        .updateUserInfo(_displayNameController.text)
        .then((result) {
      setState(() {
        _resultBanner = showActionResultOverlayBanner(context, result);
        _savingChanges = false;
      });
    });
  }

  @override
  void dispose() {
    hideOverlayBanner(_resultBanner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(),
      child: ChangeNotifierProvider.value(
        value: AuthChangeNotifier.instance,
        child: Consumer<AuthChangeNotifier>(
          builder: (_, auth, __) {
            _displayNameController.text = _displayNameController.text.isNotEmpty
                ? _displayNameController.text
                : auth.displayName ?? '';

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomForm(
                    formKey: _formKey,
                    contents: [
                      EmailFormField(
                        controller: _emailController,
                        enabled: false,
                      ),
                      TextFormField(
                        controller: _displayNameController,
                        decoration: const InputDecoration(
                          label: Text('Name'),
                        ),
                      ),
                      FilledButton(
                        onPressed: () => executeFnIfFormValid(
                          formKey: _formKey,
                          fn: _saveChanges,
                        ),
                        child: const Text('Save'),
                      )
                          .addColorStyle(
                            colorStyle: FilledButtonStyles.primary(context),
                          )
                          .loadingBtn(
                            constructor: FilledButton.new,
                            isLoading: _savingChanges,
                            colorStyle: FilledButtonStyles.primary(context),
                          ),
                    ],
                  ),
                  HeightSpacer.xxl,
                  Text(
                    'Sign in methods',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  HeightSpacer.md,
                  AuthProviderCard(
                    title: 'Google',
                    buttons: [
                      if (!auth.authProviders.contains(AuthProvider.google))
                        OutlinedButton(
                          onPressed: () => context.pushConfigureGoogleAuth(),
                          child: const Text('Configure'),
                        ).addColorStyle(
                          colorStyle: OutlinedButtonStyles.primary(context),
                        )
                    ],
                  ),
                  AuthProviderCard(
                    title: 'Password',
                    buttons: [
                      if (!auth.authProviders.contains(AuthProvider.password))
                        OutlinedButton(
                          onPressed: () => context.pushConfigurePasswordAuth(),
                          child: const Text('Configure'),
                        ).addColorStyle(
                          colorStyle: OutlinedButtonStyles.primary(context),
                        ),
                      if (auth.authProviders.contains(AuthProvider.password))
                        OutlinedButton(
                          onPressed: () => context.pushChangePassword(),
                          child: const Text('Change password'),
                        ).addColorStyle(
                          colorStyle: OutlinedButtonStyles.primary(context),
                        ),
                    ],
                  ),
                  HeightSpacer.md,
                  FilledButton(
                    onPressed: () => context.pushDeleteAccount(),
                    child: const Text('Delete account'),
                  ).addColorStyle(
                    colorStyle: FilledButtonStyles.error(context),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
