import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../change_notifiers/repo_factory.dart';
import '../../../components/dialogs/confirm_dialog.dart';
import '../../../components/wrappers/screen.dart';
import '../../../constants/spacers.dart';
import '../../../constants/styles/filled_button.dart';
import '../../../l10n/app_localizations.dart';
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

    await GetIt.I<RepoFactoryChangeNotifier>()
        .repoFactory
        .userRepo1
        .deleteAccount()
        .then((result) {
      setState(() {
        _deletingAccount = false;
      });

      if (result.success) {
        if (mounted) {
          showActionResultOverlayBanner(context, result);
        }
      } else {
        _resultBanner = showActionResultOverlayBanner(context, result);
      }
    });
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.deleteAccount,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          HeightSpacer.md,
          Text(
            localizations.dataWillBeDeleted,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          HeightSpacer.md,
          FilledButton(
            onPressed: () => showConfirmDialog(
                context: context,
                title: localizations.areYouSure,
                onOkPressed: () {
                  context.pop();
                  _deleteAccount();
                }),
            child: Text(localizations.delete),
          )
              .colorStyle(
                FilledButtonStyles.error,
              )
              .loadingBtn(
                constructor: FilledButton.new,
                isLoading: _deletingAccount,
                colorStyle: FilledButtonStyles.error,
              ),
        ],
      ),
    );
  }
}
