import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../app_models/action_result.dart';
import '../../../change_notifiers/auth.dart';
import '../../../components/dialogs/confirm_dialog.dart';
import '../../../components/error_content.dart';
import '../../../components/form/budget_form.dart';
import '../../../components/loading_content.dart';
import '../../../components/no_data_content.dart';
import '../../../constants/icon_size.dart';
import '../../../constants/padding_size.dart';
import '../../../constants/spacers.dart';
import '../../../constants/styles/filled_button.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/models.dart' as models;
import '../../../utils/form.dart';
import '../../../utils/overlay_banner.dart';
import '../../../extensions/button/filled_button.dart';
import '../../../extensions/button/button_style_button.dart';

class BudgetView extends StatefulWidget {
  const BudgetView({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<BudgetView> createState() => _BudgetViewState();
}

class _BudgetViewState extends State<BudgetView> {
  final _updateBudgetFormKey = GlobalKey<BudgetFormState>();
  final _updateBudgetFormStateKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();

  bool _deleting = false;
  bool _updating = false;
  OverlayEntry? _resultBanner;

  Future<void> _delete(String? budgetTitle) async {
    final localizations = AppLocalizations.of(context);

    setState(() {
      _deleting = true;
    });

    try {
      models.usersRef
          .doc(GetIt.I<AuthChangeNotifier>().id)
          .budgets
          .doc(widget.id)
          .delete()
          .then((_) {
        setState(() {
          _deleting = false;
        });
        showActionResultOverlayBanner(
          context,
          ActionResult(
            success: true,
            messageTitle: budgetTitle != null
                ? localizations.deletedBudgetWithTitle(budgetTitle)
                : localizations.deletedBudget,
          ),
        );
        context.pop();
      });
    } catch (_) {
      setState(() {
        _deleting = false;
      });
      _resultBanner = showActionResultOverlayBanner(
        context,
        ActionResult(
          success: false,
          messageTitle: budgetTitle != null
              ? localizations.couldNotDeleteBudgetWithTitle(budgetTitle)
              : localizations.couldNotCreateBudget,
        ),
      );
    }
  }

  Future<void> _update() async {
    setState(() {
      _updating = true;
    });

    await _updateBudgetFormKey.currentState?.updateBudget().then((result) {
      setState(() {
        _updating = false;
      });
      _resultBanner = showActionResultOverlayBanner(context, result);
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

    final deleteColor = Theme.of(context).colorScheme.error;
    final bgColor = Theme.of(context).colorScheme.surfaceVariant;
    final fgColor = Theme.of(context).colorScheme.onSurfaceVariant;

    return FirestoreBuilder(
      ref: models.usersRef
          .doc(GetIt.I<AuthChangeNotifier>().id)
          .budgets
          .doc(widget.id),
      builder: (
        context,
        snapshot,
        child,
      ) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text(localizations.error),
            ),
            body: const ErrorContent(),
          );
        }

        if (!snapshot.hasData) {
          return LoadingContent(color: fgColor);
        }

        final budget = snapshot.requireData.data;

        if (budget == null) {
          return Scaffold(
            appBar: AppBar(
              title: Text(localizations.noData),
            ),
            body: const NoDataContent(),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(budget.title),
            actions: [
              IconButton(
                color: deleteColor,
                onPressed: () => showConfirmDialog(
                    context: context,
                    title: localizations.areYouSure,
                    description: Text(localizations
                        .deleteBudgetConfirmationMsg(budget.title)),
                    onOkPressed: () {
                      context.pop();
                      _delete(budget.title);
                    }),
                icon: _deleting
                    ? SizedBox(
                        width: IconSize.md,
                        height: IconSize.md,
                        child: CircularProgressIndicator(
                          color: deleteColor,
                        ),
                      )
                    : const Icon(
                        Icons.delete_forever_rounded,
                      ),
              ),
            ],
          ),
          backgroundColor: bgColor,
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: PaddingSize.md,
                        right: PaddingSize.md,
                        bottom: PaddingSize.md,
                        top: PaddingSize.xxs,
                      ),
                      color: Theme.of(context).colorScheme.background,
                      child: Column(
                        children: [
                          BudgetForm(
                            key: _updateBudgetFormKey,
                            formKey: _updateBudgetFormStateKey,
                            budget: budget,
                          ),
                          HeightSpacer.lg,
                          FilledButton(
                            onPressed: () => executeFnIfFormValid(
                              formKey: _updateBudgetFormStateKey,
                              fn: _update,
                            ),
                            child: Text(localizations.save),
                          )
                              .colorStyle(FilledButtonStyles.primaryContainer)
                              .loadingBtn(
                                constructor: FilledButton.new,
                                isLoading: _updating,
                                colorStyle: FilledButtonStyles.primaryContainer,
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
