import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../change_notifiers/auth.dart';
import '../../components/animated_branch_container.dart';
import '../../components/bottom_sheets/add_bottom_sheet.dart';
import '../../components/dialogs/scrollable_form_dialog.dart';
import '../../components/form/budget_form.dart';
import '../../components/form/category_form.dart';
import '../../components/form/value_transaction_form.dart';
import '../../config/keys/shared_prefs.dart';
import '../../config/routes.dart';
import '../../constants/styles/container.dart';
import '../../l10n/app_localizations.dart';
import '../../models/enums/transaction_types.dart';
import '../../models/models.dart' as models;
import '../../utils/firebase_messages.dart';
import '../../utils/overlay_banner.dart';
import '../../utils/prefs.dart';

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

  final _addBudgetFormKey = GlobalKey<BudgetFormState>();
  final _addBudgetFormStateKey = GlobalKey<FormState>();

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  OverlayEntry? _resultBanner;

  void _onFabPressed() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      builder: (BuildContext context) => AddBottomSheet(
        addExpenseCategory: () => _addCategory(
          transactionType: TransactionTypes.expense,
        ),
        addIncomeCategory: () => _addCategory(
          transactionType: TransactionTypes.income,
        ),
        addExpenseTransaction: () => _addValueTransaction(
          transactionType: TransactionTypes.expense,
        ),
        addIncomeTransaction: () => _addValueTransaction(
          transactionType: TransactionTypes.income,
        ),
        addBudget: _addBudget,
      ),
    );
  }

  void _addCategory({
    TransactionTypes? transactionType,
  }) async {
    await showScrollableFormDialog(
      context: context,
      title: AppLocalizations.of(context).addCategory,
      form: CategoryForm(
        key: _addCategoryFormKey,
        formKey: _addCategoryFormStateKey,
        transactionType: transactionType,
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

  void _addValueTransaction({
    TransactionTypes? transactionType,
    models.ValueTransaction? valueTransaction,
    bool allowRecurring = true,
  }) async {
    await showScrollableFormDialog(
      context: context,
      title: AppLocalizations.of(context).addTransaction,
      form: ValueTransactionForm(
        key: _addTransactionFormKey,
        formKey: _addTransactionFormStateKey,
        transactionType: transactionType,
        valueTransaction: valueTransaction,
        allowRecurring: allowRecurring,
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

  void _addBudget() async {
    await showScrollableFormDialog(
      context: context,
      title: AppLocalizations.of(context).addBudget,
      form: BudgetForm(
        key: _addBudgetFormKey,
        formKey: _addBudgetFormStateKey,
      ),
      formKey: _addBudgetFormStateKey,
      onSubmit: () {
        assert(_addBudgetFormKey.currentState != null);
        return _addBudgetFormKey.currentState!.addBudget();
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

  void _onTap(BuildContext context, int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  Future<void> setupInteractedMessage() async {
    FirebaseMessaging.instance.getInitialMessage().then((initialMessage) {
      if (initialMessage != null) {
        _handleNotification(initialMessage.data);
      }

      // Also handle any interaction when the app is in the background via a
      // Stream listener
      FirebaseMessaging.onMessageOpenedApp.listen(
        (message) => _handleNotification(message.data),
      );
    });
  }

  Future<void> _handleNotification(
    Map<String, dynamic> messageData,
  ) async {
    assert(messageData['type'] != null);

    switch (messageData['type']) {
      case 'addRecurringTransaction':
        assert(messageData['valueTransactionId'] != null);

        final valueTransaction = (await models.usersRef
                .doc(GetIt.I<AuthChangeNotifier>().id)
                .valueTransactions
                .doc(messageData['valueTransactionId'])
                .get())
            .data;

        final nonRecurringTransaction = valueTransaction != null
            ? models.ValueTransaction(
                id: '',
                title: valueTransaction.title,
                dateTime: DateTime.now(),
                value: valueTransaction.value,
                categoryId: valueTransaction.categoryId,
                categoryTitle: valueTransaction.categoryTitle,
                categoryTransactionType:
                    valueTransaction.categoryTransactionType,
                categoryReason: valueTransaction.categoryReason,
                parentCategoryId: valueTransaction.parentCategoryId,
                cronExpression: valueTransaction.cronExpression,
              )
            : null;

        _addValueTransaction(
          valueTransaction: nonRecurringTransaction,
          allowRecurring: false,
        );
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final notificationsPermissionPref =
          await fetchStringPref(SharedPrefsKeys.notificationsPermission);
      if (notificationsPermissionPref == null) {
        final permissionStatus = await Permission.notification.request();
        writeStringPref(
          SharedPrefsKeys.notificationsPermission,
          permissionStatus.isGranted ? true.toString() : false.toString(),
        );
      }
    });

    setupInteractedMessage();

    const initializationSettingsAndroid =
        AndroidInitializationSettings('notification_icon');

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (notificationResponse) {
        switch (notificationResponse.notificationResponseType) {
          case NotificationResponseType.selectedNotification:
            if (notificationResponse.payload != null) {
              _handleNotification(jsonDecode(notificationResponse.payload!));
            }
            break;
          default:
        }
      },
      onDidReceiveBackgroundNotificationResponse: firebaseMessagingHandler,
    );

    const channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.max,
    );

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel)
        .then((_) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        final notification = message.notification;
        final android = message.notification?.android;

        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            payload: jsonEncode(message.data),
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
              ),
            ),
          );
        }
      });
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
