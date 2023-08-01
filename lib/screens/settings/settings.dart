import 'package:flutter/material.dart';

import '../../components/buttons/loading_label_button.dart';
import '../../dal/repo_factory.dart';
import '../../extensions/build_context.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _signingOut = false;

  Future<void> _signOut() async {
    setState(() {
      _signingOut = true;
    });

    await RepoFactory.authRepo().signOut();

    setState(() {
      _signingOut = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () => context.navigateToProfile(),
            child: const Text('Profile'),
          ),
          // TODO: handle unsuccessfull sign out
          LoadingLabelButton(
            label: 'Sign out',
            onPressed: _signOut,
            isLoading: _signingOut,
            constructor: TextButton.new,
          )
        ],
      ),
    );
  }
}
