import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../change_notifiers/auth.dart';
import 'routes.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final initialLocation = TopLevelRoutes.analytics.path;

final router = GoRouter(
  initialLocation: initialLocation,
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
  redirect: (context, state) async {
    final auth = GetIt.I<AuthChangeNotifier>();

    if (!auth.signedIn &&
        !state.location.startsWith(TopLevelRoutes.welcome.path)) {
      return TopLevelRoutes.welcome.path;
    }

    if (auth.signedIn) {
      if (!auth.emailVerified &&
          !state.location.startsWith(TopLevelRoutes.verifyEmail.path)) {
        return TopLevelRoutes.verifyEmail.path;
      }

      if (auth.emailVerified &&
          auth.shouldSetUpUserData &&
          (state.location.startsWith(TopLevelRoutes.welcome.path) ||
              state.location.startsWith(TopLevelRoutes.verifyEmail.path))) {
        return TopLevelRoutes.dataSetup.path;
      }

      if (auth.emailVerified &&
          !auth.shouldSetUpUserData &&
          (state.location.startsWith(TopLevelRoutes.dataSetup.path) ||
              state.location.startsWith(TopLevelRoutes.welcome.path))) {
        return initialLocation;
      }
    }

    return null;
  },
  refreshListenable: GetIt.I<AuthChangeNotifier>(),
  navigatorKey: navigatorKey,
);
