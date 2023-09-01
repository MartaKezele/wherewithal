import 'package:flutter/material.dart';
import 'package:wherewithal/components/wrappers/screen.dart';
import 'package:wherewithal/extensions/button/button_style_button.dart';
import 'package:wherewithal/extensions/button/filled_button.dart';

import '../../../constants/spacers.dart';
import '../../../constants/styles/filled_button.dart';
import '../../../dal/repo_factory.dart';
import '../../../utils/overlay_banner.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  bool _deletingAccount = false;
  OverlayEntry? _resultBanner;

  Future<void> _deleteAccount() async {
    setState(() {
      _deletingAccount = true;
    });

    await RepoFactory.userRepo().deleteAccount().then((result) {
      setState(() {
        _deletingAccount = false;
      });

      if (result.success) {
        showActionResultOverlayBanner(context, result);
      } else {
        _resultBanner = showActionResultOverlayBanner(context, result);
      }
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delete account',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          HeightSpacer.md,
          FilledButton(
            onPressed: _deleteAccount,
            child: const Text('Delete'),
          )
              .addColorStyle(colorStyle: FilledButtonStyles.primary(context))
              .loadingBtn(
                constructor: FilledButton.new,
                isLoading: _deletingAccount,
                colorStyle: FilledButtonStyles.primary(context),
              ),
        ],
      ),
    );
  }
}
