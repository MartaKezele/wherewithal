import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../change_notifiers/auth.dart';
import '../dal/repo_factory.dart';
import 'routes.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final initialLocation = NamedChildRoutes.insights.path;

final router = GoRouter(
  initialLocation: initialLocation,
  routes: [
    TopLevelRoutes.homeShellRoute,
    TopLevelRoutes.settings,
    TopLevelRoutes.welcome,
    TopLevelRoutes.verifyEmail,
    TopLevelRoutes.passwordReauth,
    TopLevelRoutes.googleReauth,
  ],
  redirect: (context, state) async {
    final auth = GetIt.I<AuthChangeNotifier>();

    if (auth.signedIn &&
        auth.emailVerified &&
        (state.location.startsWith(TopLevelRoutes.welcome.path) ||
            state.location.startsWith(TopLevelRoutes.verifyEmail.path))) {
      return initialLocation;
    }

    if (auth.signedIn &&
        !auth.emailVerified &&
        !state.location.startsWith(TopLevelRoutes.verifyEmail.path)) {
      await RepoFactory.authRepo().sendVerificationEmail();
      return TopLevelRoutes.verifyEmail.path;
    }

    if (!auth.signedIn &&
        !state.location.startsWith(TopLevelRoutes.welcome.path)) {
      return TopLevelRoutes.welcome.path;
    }

    return null;
  },
  refreshListenable: GetIt.I<AuthChangeNotifier>(),
  navigatorKey: navigatorKey,
);
