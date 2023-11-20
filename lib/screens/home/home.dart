import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app_models/action_result.dart';
import '../../components/animated_branch_container.dart';
import '../../components/bottom_sheets/add_bottom_sheet.dart';
import '../../components/dialogs/scrollable_form_dialog.dart';
import '../../components/form/category_form.dart';
import '../../components/form/value_transaction_form.dart';
import '../../config/routes.dart';
import '../../constants/styles/container.dart';
import '../../l10n/app_localizations.dart';
import '../../models/enums/transaction_types.dart';
import '../../utils/overlay_banner.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.navigationShell,
    required this.children,
  });

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _addCategoryFormKey = GlobalKey<CategoryFormState>();
  final _addCategoryFormStateKey = GlobalKey<FormState>();

  final _addTransactionFormKey = GlobalKey<ValueTransactionFormState>();
  final _addTransactionFormStateKey = GlobalKey<FormState>();

  OverlayEntry? _resultBanner;

  void _onFabPressed() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      builder: (BuildContext context) => AddBottomSheet(
        addCategory: _addCategory,
        addExpense: () => _addTransaction(TransactionTypes.expense),
        addIncome: () => _addTransaction(TransactionTypes.income),
      ),
    );
  }

  void _addCategory() async {
    await showScrollableFormDialog<ActionResult>(
      context: context,
      title: AppLocalizations.of(context).addCategory,
      form: CategoryForm(
        key: _addCategoryFormKey,
        formKey: _addCategoryFormStateKey,
      ),
      formKey: _addCategoryFormStateKey,
      onSubmit: () {
        assert(_addCategoryFormKey.currentState != null);
        return _addCategoryFormKey.currentState!.addCategory();
      },
      submitBtnText: AppLocalizations.of(context).save,
    ).then((result) {
      if (result != null) {
        _resultBanner = showActionResultOverlayBanner(
          context,
          result,
        );
      }
    });
  }

  void _addTransaction(TransactionTypes transactionType) async {
    await showScrollableFormDialog<ActionResult>(
      context: context,
      title: AppLocalizations.of(context).addTransaction,
      form: ValueTransactionForm(
        key: _addTransactionFormKey,
        formKey: _addTransactionFormStateKey,
        transactionType: transactionType,
      ),
      onSubmit: () {
        assert(_addTransactionFormKey.currentState != null);
        return _addTransactionFormKey.currentState!.addValueTransaction();
      },
      submitBtnText: AppLocalizations.of(context).save,
      formKey: _addTransactionFormStateKey,
    ).then((result) {
      if (result != null) {
        _resultBanner = showActionResultOverlayBanner(
          context,
          result,
        );
      }
    });
  }

  void _onTap(BuildContext context, int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  void dispose() {
    hideOverlayBanner(_resultBanner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      body: AnimatedBranchContainer(
        currentIndex: widget.navigationShell.currentIndex,
        children: widget.children,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.navigationShell.currentIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: homeShellRoute.tabBranches.map((branch) {
          return BottomNavigationBarItem(
            icon: Icon(branch.icon),
            label: branch.label(context),
            tooltip: branch.label(context),
          );
        }).toList(),
        onTap: (int index) => _onTap(context, index),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPressed,
        shape: containerShape,
        tooltip: localizations.add,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
