import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../change_notifiers/auth.dart';
import '../../../components/action_result_message.dart';
import '../../../components/buttons/loading_label_button.dart';
import '../../../components/form_fields/email_form_field.dart';
import '../../../config/auth_provider.dart';
import '../../../dal/repo_factory.dart';
import '../../../models/action_result.dart';
import '../../../utils/form.dart';
import '../../../extensions/build_context.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  final _displayNameController = TextEditingController();
  final _emailController = TextEditingController(
    text: Auth.instance.email ?? '',
  );

  bool _savingChanges = false;
  ActionResult? _result;

  Future<void> _saveChanges() async {
    setState(() {
      _result = null;
      _savingChanges = true;
    });

    await RepoFactory.userRepo()
        .updateUserInfo(_displayNameController.text)
        .then((result) {
      setState(() {
        _result = result;
        _savingChanges = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider.value(
        value: Auth.instance,
        child: Consumer<Auth>(
          builder: (context, auth, child) {
            _displayNameController.text = _displayNameController.text.isNotEmpty
                ? _displayNameController.text
                : auth.displayName ?? '';

            return Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                      LoadingLabelButton(
                        label: 'Save',
                        onPressed: () => executeFnIfFormValid(
                          formKey: _formKey,
                          fn: _saveChanges,
                        ),
                        isLoading: _savingChanges,
                        constructor: ElevatedButton.new,
                      ),
                      ActionResultMessage(result: _result),
                    ],
                  ),
                ),
                const Text(
                  'Sign in methods',
                ),
                Card(
                  child: Column(
                    children: [
                      const Text('Google'),
                      Visibility(
                        visible:
                            !auth.authProviders.contains(AuthProvider.google),
                        child: TextButton(
                          onPressed: () =>
                              context.navigateToConfigureGoogleAuth(),
                          child: const Text('Configure'),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      const Text('Password'),
                      Visibility(
                        visible:
                            !auth.authProviders.contains(AuthProvider.password),
                        child: TextButton(
                          onPressed: () =>
                              context.navigateToConfigurePasswordAuth(),
                          child: const Text('Configure'),
                        ),
                      ),
                      Visibility(
                        visible:
                            auth.authProviders.contains(AuthProvider.password),
                        child: TextButton(
                          onPressed: () => context.navigateToChangePassword(),
                          child: const Text('Change password'),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => context.navigateToDeleteAccount(),
                  child: const Text('Delete account'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
