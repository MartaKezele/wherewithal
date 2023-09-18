import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wherewithal/constants/path_param_keys.dart';

import '../config/routes.dart';
import '../constants/query_param_keys.dart';

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
    return await push<T>(
      TopLevelRoutes.settings.path,
    );
  }

  Future<T?> pushChangePassword<T extends Object?>() async {
    return await pushNamed<T>(
      NamedChildRoutes.changePassword.nonNullableName,
      queryParameters: {
        QueryParamKeys.shouldRedirect: true.toString(),
      },
    );
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

  Future<T?> pushCategoryView<T extends Object?>({
    required int categoryId,
  }) async {
    return await pushNamed<T>(
      NamedChildRoutes.category.nonNullableName,
      pathParameters: {
        PathParamKeys.categoryId: categoryId.toString(),
      },
    );
  }

  Future<T?> pushSub1CategoryView<T extends Object?>({
    required int categoryId,
    required int sub1categoryId,
  }) async {
    return await pushNamed<T>(
      NamedChildRoutes.sub1category.nonNullableName,
      pathParameters: {
        PathParamKeys.categoryId: categoryId.toString(),
        PathParamKeys.sub1categoryId: sub1categoryId.toString(),
      },
    );
  }

  Future<T?> pushSub2CategoryView<T extends Object?>({
    required int categoryId,
    required int sub1categoryId,
    required int sub2categoryId,
  }) async {
    return await pushNamed<T>(
      NamedChildRoutes.sub2category.nonNullableName,
      pathParameters: {
        PathParamKeys.categoryId: categoryId.toString(),
        PathParamKeys.sub1categoryId: sub1categoryId.toString(),
        PathParamKeys.sub2categoryId: sub2categoryId.toString(),
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

  void goToProfile() async {
    return goNamed(
      NamedChildRoutes.profile.nonNullableName,
    );
  }
}
