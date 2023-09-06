import 'package:flutter/material.dart';

import '../../../components/wrappers/screen.dart';
import '../../../constants/spacers.dart';
import '../../../constants/styles/filled_button.dart';
import '../../../dal/repo_factory.dart';
import '../../../utils/app_localizations.dart';
import '../../../utils/overlay_banner.dart';
import '../../../extensions/button/button_style_button.dart';
import '../../../extensions/button/filled_button.dart';

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
    final localizations = AppLocalizations.of(context);
    return Screen(
      appBar: AppBar(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.deleteAccount,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          HeightSpacer.md,
          FilledButton(
            onPressed: _deleteAccount,
            child: Text(localizations.delete),
          )
              .addColorStyle(
                FilledButtonStyles.primary,
              )
              .loadingBtn(
                constructor: FilledButton.new,
                isLoading: _deletingAccount,
                colorStyle: FilledButtonStyles.primary,
              ),
        ],
      ),
    );
  }
}
