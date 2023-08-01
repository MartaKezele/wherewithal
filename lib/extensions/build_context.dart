import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/routes.dart';
import '../constants/query_param_keys.dart';

extension NavigationContextExtension on BuildContext {
  Future<T?> navigateToForgotPassword<T>(
    String? email,
  ) async {
    return await pushNamed(
      NamedChildRoutes.forgotPassword.nonNullableName,
      queryParameters: {
        QueryParamKeys.email: email,
      },
    );
  }

  Future<T?> navigateToProfile<T>() async {
    return await pushNamed(
      NamedChildRoutes.profile.nonNullableName,
    );
  }

  Future<T?> navigateToSettings<T>() async {
    return await pushNamed(
      NamedChildRoutes.settings.nonNullableName,
    );
  }

  Future<T?> navigateToChangePassword<T>() async {
    return await pushNamed(
      NamedChildRoutes.changePassword.nonNullableName,
      queryParameters: {
        QueryParamKeys.shouldRedirect: true.toString(),
      },
    );
  }

  Future<T?> navigateToConfigurePasswordAuth<T>() async {
    return await pushNamed(
      NamedChildRoutes.configurePasswordAuth.nonNullableName,
      queryParameters: {
        QueryParamKeys.shouldRedirect: true.toString(),
      },
    );
  }

  Future<T?> navigateToConfigureGoogleAuth<T>() async {
    return await pushNamed(
      NamedChildRoutes.configureGoogleAuth.nonNullableName,
      queryParameters: {
        QueryParamKeys.shouldRedirect: true.toString(),
      },
    );
  }

  Future<T?> navigateToDeleteAccount<T>() async {
    return await pushNamed(
      NamedChildRoutes.deleteAccount.nonNullableName,
      queryParameters: {
        QueryParamKeys.shouldRedirect: true.toString(),
      },
    );
  }

  void navigateToCreateAccount() {
    goNamed(
      NamedChildRoutes.createAccount.nonNullableName,
    );
  }

  void navigateToSignIn() {
    goNamed(
      NamedChildRoutes.signIn.nonNullableName,
    );
  }
}
