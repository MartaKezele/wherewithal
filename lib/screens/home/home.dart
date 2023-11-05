import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app_models/action_result.dart';
import '../../app_models/bottom_nav_item.dart';
import '../../components/bottom_sheets/add_bottom_sheet.dart';
import '../../components/dialogs/scrollable_form_dialog.dart';
import '../../components/form/category_form.dart';
import '../../components/form/value_transaction_form.dart';
import '../../constants/styles/container.dart';
import '../../l10n/app_localizations.dart';
import '../../models/enums/transaction_types.dart';
import '../../utils/overlay_banner.dart';
import '../../extensions/build_context.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.body,
    required this.bottomNav,
  });

  final Widget body;
  final List<BottomNavItem> bottomNav;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _addCategoryFormKey = GlobalKey<CategoryFormState>();
  final _addCategoryFormStateKey = GlobalKey<FormState>();

  final _addTransactionFormKey = GlobalKey<ValueTransactionFormState>();
  final _addTransactionFormStateKey = GlobalKey<FormState>();

  int _currentBottomNavIndex = 0;
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

  void _onBottomNavItemTap(index) {
    context.go(widget.bottomNav[index].route.path);
    setState(() {
      _currentBottomNavIndex = index;
    });
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

  @override
  void dispose() {
    hideOverlayBanner(_resultBanner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bottomNav[_currentBottomNavIndex].label(context)),
        actions: [
          IconButton(
            onPressed: () => context.pushSettings(),
            icon: const Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: widget.body,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentBottomNavIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: _onBottomNavItemTap,
        items: widget.bottomNav
            .map(
              (navItem) => BottomNavigationBarItem(
                icon: Icon(
                  navItem.icon,
                ),
                label: navItem.label(context),
                tooltip: navItem.label(context),
              ),
            )
            .toList(),
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
