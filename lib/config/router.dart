import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../change_notifiers/auth.dart';
import 'routes.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final initialLocation = TopLevelRoutes.analytics.path;

final router = GoRouter(
  routes: [
    homeShellRoute,
    TopLevelRoutes.settings,
    TopLevelRoutes.welcome,
    TopLevelRoutes.verifyEmail,
    TopLevelRoutes.passwordReauth,
    TopLevelRoutes.googleReauth,
    TopLevelRoutes.createReceipt,
    TopLevelRoutes.error,
    TopLevelRoutes.dataSetup,
    TopLevelRoutes.category,
  ],
  initialLocation: initialLocation,
  redirect: _redirect,
  refreshListenable: GetIt.I<AuthChangeNotifier>(),
  navigatorKey: navigatorKey,
);

FutureOr<String?> _redirect(context, state) async {
  final auth = GetIt.I<AuthChangeNotifier>();
  final path = state.location;
  if (!auth.signedIn &&
      !path.startsWith(TopLevelRoutes.welcome.path)) {
    return TopLevelRoutes.welcome.path;
  }
  if (auth.signedIn) {
    if (!auth.emailVerified &&
        !path.startsWith(TopLevelRoutes.verifyEmail.path)) {
      return TopLevelRoutes.verifyEmail.path;
    }
    if (auth.emailVerified &&
        auth.shouldSetUpUserData &&
        (path.startsWith(TopLevelRoutes.welcome.path) ||
            path.startsWith(TopLevelRoutes.verifyEmail.path))) {
      return TopLevelRoutes.dataSetup.path;
    }
    if (auth.emailVerified &&
        !auth.shouldSetUpUserData &&
        (path.startsWith(TopLevelRoutes.dataSetup.path) ||
            path.startsWith(TopLevelRoutes.welcome.path) ||
            path.startsWith(TopLevelRoutes.verifyEmail.path))) {
      return initialLocation;
    }
  }
  return null;
}
