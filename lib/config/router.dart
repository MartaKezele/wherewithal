import 'package:go_router/go_router.dart';

import '../change_notifiers/auth.dart';
import 'routes.dart';

final router = GoRouter(
  initialLocation: TopLevelRoutes.home.path,
  routes: [
    TopLevelRoutes.welcome,
    TopLevelRoutes.home,
    TopLevelRoutes.verifyEmail,
    TopLevelRoutes.passwordReauth,
    TopLevelRoutes.googleReauth,
  ],
  redirect: (context, state) async {
    final auth = Auth.instance;

    if (auth.signedIn &&
        auth.emailVerified &&
        (state.location.startsWith(TopLevelRoutes.welcome.path) ||
            state.location.startsWith(TopLevelRoutes.verifyEmail.path))) {
      return TopLevelRoutes.home.path;
    }

    if (auth.signedIn &&
        !auth.emailVerified &&
        !state.location.startsWith(TopLevelRoutes.verifyEmail.path)) {
      return TopLevelRoutes.verifyEmail.path;
    }

    if (!auth.signedIn &&
        !state.location.startsWith(TopLevelRoutes.welcome.path)) {
      return TopLevelRoutes.welcome.path;
    }

    return null;
  },
  refreshListenable: Auth.instance,
);
