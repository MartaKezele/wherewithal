import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    return await pushNamed<T>(
      NamedChildRoutes.settings.nonNullableName,
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
