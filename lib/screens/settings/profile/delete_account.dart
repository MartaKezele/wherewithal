import 'package:flutter/material.dart';

import '../../../components/action_result_message.dart';
import '../../../components/buttons/loading_label_button.dart';
import '../../../dal/repo_factory.dart';
import '../../../models/action_result.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  bool _deletingAccount = false;
  ActionResult? _result;

  Future<void> _deleteAccount() async {
    setState(() {
      _deletingAccount = true;
      _result = null;
    });

    final result = await RepoFactory.userRepo().deleteAccount();

    setState(() {
      _deletingAccount = false;
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('Delete account'),
          LoadingLabelButton(
            label: 'Delete',
            onPressed: _deleteAccount,
            isLoading: _deletingAccount,
            constructor: ElevatedButton.new,
          ),
          ActionResultMessage(
            result: _result,
          ),
        ],
      ),
    );
  }
}
