import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/keys/path_param.dart';
import '../config/routes.dart';
import '../config/keys/query_param.dart';

extension Navigation on BuildContext {
  Future<T?> pushForgotPassword<T extends Object?>(
    String? email,
  ) async {
    return await pushNamed<T>(
      NamedChildRoutes.forgotPassword.nonNullableName,
      queryParameters: {
        QueryParamKeys.email: email,
      },
    );
  }

  Future<T?> pushProfile<T extends Object?>() async {
    return await pushNamed<T>(
      NamedChildRoutes.profile.nonNullableName,
    );
  }

  Future<T?> pushNotifications<T extends Object?>() async {
    return await pushNamed<T>(
      NamedChildRoutes.notifications.nonNullableName,
    );
  }

  Future<T?> pushSettings<T extends Object?>() async {
    return await push<T>(TopLevelRoutes.settings.path);
  }

  Future<T?> pushChangePassword<T extends Object?>() async {
    return await pushNamed<T>(
      NamedChildRoutes.changePassword.nonNullableName,
      queryParameters: {
        QueryParamKeys.shouldRedirect: true.toString(),
      },
    );
  }

  Future<T?> pushCreateReceipt<T extends Object?>() async {
    return await push<T>(TopLevelRoutes.createReceipt.path);
  }

  Future<T?> pushConfigurePasswordAuth<T extends Object?>() async {
    return await pushNamed<T>(
      NamedChildRoutes.configurePasswordAuth.nonNullableName,
      queryParameters: {
        QueryParamKeys.shouldRedirect: true.toString(),
      },
    );
  }

  Future<T?> pushConfigureGoogleAuth<T extends Object?>() async {
    return await pushNamed<T>(
      NamedChildRoutes.configureGoogleAuth.nonNullableName,
      queryParameters: {
        QueryParamKeys.shouldRedirect: true.toString(),
      },
    );
  }

  Future<T?> pushDeleteAccount<T extends Object?>() async {
    return await pushNamed<T>(
      NamedChildRoutes.deleteAccount.nonNullableName,
      queryParameters: {
        QueryParamKeys.shouldRedirect: true.toString(),
      },
    );
  }

  Future<T?> pushCategory<T extends Object?>(String categoryId) async {
    return await push<T>(
      TopLevelRoutes.category.path,
      extra: categoryId,
    );
  }

  Future<T?> pushTransaction<T extends Object?>(String transactionId) async {
    return await pushNamed<T>(
      NamedChildRoutes.valueTransaction.nonNullableName,
      pathParameters: {
        PathParamKeys.valueTransactionId: transactionId,
      },
    );
  }

  Future<T?> pushBudgetView<T extends Object?>(String budgetId) async {
    return await pushNamed<T>(
      NamedChildRoutes.budgetView.nonNullableName,
      pathParameters: {
        PathParamKeys.budgetId: budgetId,
      },
    );
  }

  void goToCreateAccount() {
    goNamed(
      NamedChildRoutes.createAccount.nonNullableName,
    );
  }

  void goToSignIn() {
    goNamed(
      NamedChildRoutes.signIn.nonNullableName,
    );
  }
}
