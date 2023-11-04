import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../change_notifiers/auth.dart';
import '../../../change_notifiers/repo_factory.dart';
import '../../../components/cards/auth_provider_card.dart';
import '../../../components/form/custom_form.dart';
import '../../../components/form/form_fields/email_form_field.dart';
import '../../../components/wrappers/screen.dart';
import '../../../config/auth_provider.dart';
import '../../../constants/spacers.dart';
import '../../../constants/styles/filled_button.dart';
import '../../../constants/styles/outlined_button.dart';
import '../../../l10n/app_localizations.dart';
import '../../../utils/form.dart';
import '../../../extensions/build_context.dart';
import '../../../utils/overlay_banner.dart';
import '../../../extensions/button/filled_button.dart';
import '../../../extensions/button/outlined_button.dart';
import '../../../extensions/button/button_style_button.dart'
    as button_style_button_extensions;

class Profile extends StatefulWidget with GetItStatefulWidgetMixin {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with GetItStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _displayNameController = TextEditingController();
  final _emailController = TextEditingController(
    text: AuthChangeNotifier.instance.email ?? '',
  );
  late final ValueNotifier<String> _nameValueNotifier;

  bool _nameFieldDirty = false;
  bool _savingChanges = false;
  OverlayEntry? _resultBanner;

  void _nameFieldListener() {
    if (!_nameFieldDirty) {
      _nameFieldDirty = !_nameFieldDirty;
    }
    _nameValueNotifier.value = _displayNameController.text;
  }

  Future<void> _saveChanges() async {
    setState(() {
      _savingChanges = true;
    });

    await GetIt.I<RepoFactoryChangeNotifier>()
        .repoFactory
        .userRepo1
        .updateUserInfo(_displayNameController.text)
        .then((result) {
      setState(() {
        _resultBanner = showActionResultOverlayBanner(context, result);
        _savingChanges = false;
      });
    });
  }

  @override
  void initState() {
    _displayNameController.addListener(_nameFieldListener);
    _nameValueNotifier = ValueNotifier<String>(_displayNameController.text);
    super.initState();
  }

  @override
  void dispose() {
    hideOverlayBanner(_resultBanner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final displayName = watchOnly(
      (AuthChangeNotifier changeNotifier) => changeNotifier.displayName,
    );

    final authProviders = watchOnly(
      (AuthChangeNotifier changeNotifier) => changeNotifier.authProviders,
    );

    _displayNameController.text =
        _nameFieldDirty ? _displayNameController.text : displayName ?? '';

    return Screen(
      appBar: AppBar(
        title: Text(localizations.profile),
      ),
      body: SingleChildScrollView(
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
                  decoration: InputDecoration(
                    label: Text(localizations.name),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: _nameValueNotifier,
                  builder: (context, name, _) {
                    return FilledButton(
                      onPressed: name == displayName ||
                              (name == '' && displayName == null)
                          ? null
                          : () => executeFnIfFormValid(
                                formKey: _formKey,
                                fn: _saveChanges,
                              ),
                      child: Text(localizations.save),
                    )
                        .colorStyle(
                          FilledButtonStyles.primaryContainer,
                        )
                        .loadingBtn(
                          constructor: FilledButton.new,
                          isLoading: _savingChanges,
                          colorStyle: FilledButtonStyles.primaryContainer,
                        );
                  },
                ),
              ],
            ),
            HeightSpacer.xxl,
            Text(
              localizations.signInMethods,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            HeightSpacer.md,
            AuthProviderCard(
              title: localizations.google,
              buttons: [
                if (!authProviders.contains(AuthProvider.google))
                  OutlinedButton(
                    onPressed: () => context.pushConfigureGoogleAuth(),
                    child: Text(localizations.configure),
                  ).colorStyle(OutlinedButtonStyles.primary)
              ],
            ),
            AuthProviderCard(
              title: localizations.password,
              buttons: [
                if (!authProviders.contains(AuthProvider.password))
                  OutlinedButton(
                    onPressed: () => context.pushConfigurePasswordAuth(),
                    child: Text(localizations.configure),
                  ).colorStyle(OutlinedButtonStyles.primary),
                if (authProviders.contains(AuthProvider.password))
                  OutlinedButton(
                    onPressed: () => context.pushChangePassword(),
                    child: Text(localizations.changePassword),
                  ).colorStyle(OutlinedButtonStyles.primary),
              ],
            ),
            HeightSpacer.md,
            FilledButton(
              onPressed: () => context.pushDeleteAccount(),
              child: Text(localizations.deleteAccount),
            ).colorStyle(
              FilledButtonStyles.error,
            ),
          ],
        ),
      ),
    );
  }
}
