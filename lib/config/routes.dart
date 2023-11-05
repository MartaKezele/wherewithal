import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../change_notifiers/auth.dart';
import '../screens/home/budget.dart';
import '../screens/home/categories/categories.dart';
import '../screens/home/categories/category_view.dart';
import '../screens/home/home.dart';
import '../screens/home/insights/insights.dart';
import '../screens/home/create_receipt.dart';
import '../screens/home/insights/value_transaction_view.dart';
import '../screens/home/recurring_transactions.dart';
import 'bottom_nav.dart';
import 'keys/path_param.dart';
import 'keys/query_param.dart';
import '../app_models/named_go_route.dart';
import '../screens/enter_app/create_account.dart';
import '../screens/enter_app/forgot_password.dart';
import '../screens/enter_app/sign_in.dart';
import '../screens/enter_app/verify_email.dart';
import '../screens/enter_app/welcome.dart';
import '../screens/error_screen.dart';
import '../screens/reauth/google_reauth.dart';
import '../screens/reauth/password_reauth.dart';
import '../screens/settings/notifications.dart';
import '../screens/settings/profile/change_password.dart';
import '../screens/settings/profile/configure_google_auth.dart';
import '../screens/settings/profile/configure_password_auth.dart';
import '../screens/settings/profile/delete_account.dart';
import '../screens/settings/profile/profile.dart';
import '../screens/settings/settings.dart';
import '../l10n/app_localizations.dart';
import 'auth_provider.dart';
import 'router.dart';

class TopLevelRoutes {
  static final homeShellRoute = ShellRoute(
    parentNavigatorKey: navigatorKey,
    builder: (context, state, child) {
      return Home(
        body: child,
        bottomNav: bottomNavItems,
      );
    },
    routes: bottomNavItems.map((navItem) => navItem.route).toList(),
  );

  static final insights = GoRoute(
    path: '/',
    builder: (context, state) => const Insights(),
    routes: [
      NamedChildRoutes.valueTransaction,
    ],
  );

  static final recurringTransactions = GoRoute(
    path: '/recurring-transactions',
    builder: (context, state) => const RecurringTransactions(),
  );

  static final categories = GoRoute(
    path: '/categories',
    builder: (context, state) => const Categories(),
    routes: [
      NamedChildRoutes.category,
    ],
  );

  static final budget = GoRoute(
    path: '/budget',
    builder: (context, state) => const Budget(),
  );

  static final welcome = GoRoute(
    path: '/welcome',
    builder: (context, state) => const Welcome(),
    routes: [
      NamedChildRoutes.signIn,
      NamedChildRoutes.createAccount,
    ],
  );

  static final verifyEmail = GoRoute(
    path: '/verify-email',
    builder: (context, state) => const VerifyEmail(),
  );

  static final passwordReauth = GoRoute(
    parentNavigatorKey: navigatorKey,
    path: '/password-reauth',
    builder: (context, state) {
      final nextRouteName = state.queryParameters[QueryParamKeys.nextRouteName];
      assert(nextRouteName != null);
      return PasswordReauth(nextRouteName: nextRouteName!);
    },
  );

  static final googleReauth = GoRoute(
    parentNavigatorKey: navigatorKey,
    path: '/google-reauth',
    builder: (context, state) {
      final nextRouteName = state.queryParameters[QueryParamKeys.nextRouteName];
      assert(nextRouteName != null);
      return GoogleReauth(nextRouteName: nextRouteName!);
    },
  );

  static final settings = GoRoute(
    parentNavigatorKey: navigatorKey,
    path: '/settings',
    builder: (context, state) => Settings(),
    routes: [
      NamedChildRoutes.profile,
      NamedChildRoutes.notifications,
    ],
  );

  static final createReceipt = GoRoute(
    parentNavigatorKey: navigatorKey,
    path: '/create-receipt',
    builder: (context, state) => CreateReceipt(),
  );

  static final error = GoRoute(
    path: '/error',
    builder: (context, state) {
      return ErrorScreen(
        title: state.queryParameters[QueryParamKeys.title],
        description: state.queryParameters[QueryParamKeys.description],
      );
    },
  );
}

class NamedChildRoutes {
  static const _changePasswordName = 'changePassword';
  static const _configurePasswordAuthName = 'configurePasswordAuth';
  static const _configureGoogleAuthName = 'configureGoogleAuth';
  static const _deleteAccountName = 'deleteAccount';

  static _redirectToReauth(
    GoRouterState state,
    GoRoute redirectRoute,
    String nextRouteName,
  ) {
    final shouldRedirect = state.queryParameters[QueryParamKeys.shouldRedirect];

    if (shouldRedirect != null && shouldRedirect == true.toString()) {
      final hasReauthenticated =
          state.queryParameters[QueryParamKeys.hasReauthenticated];
      if (hasReauthenticated != null && hasReauthenticated == true.toString()) {
        return null;
      }
      return '${redirectRoute.path}?${QueryParamKeys.nextRouteName}=$nextRouteName';
    }

    return null;
  }

  static final signIn = NamedGoRoute(
    nonNullableName: 'signIn',
    path: 'sign-in',
    builder: (context, state) => const SignIn(),
    routes: [
      forgotPassword,
    ],
  );

  static final createAccount = NamedGoRoute(
    nonNullableName: 'createAccount',
    path: 'create-account',
    builder: (context, state) => const CreateAccount(),
  );

  static final forgotPassword = NamedGoRoute(
    nonNullableName: 'forgotPassword',
    path: 'forgot-password',
    builder: (context, state) => ForgotPassword(
      email: state.queryParameters[QueryParamKeys.email],
    ),
  );

  static final profile = NamedGoRoute(
    parentNavigatorKey: navigatorKey,
    nonNullableName: 'profile',
    path: 'profile',
    builder: (context, state) => Profile(),
    routes: [
      changePassword,
      configurePasswordAuth,
      configureGoogleAuth,
      deleteAccount,
    ],
  );

  static final notifications = NamedGoRoute(
    parentNavigatorKey: navigatorKey,
    nonNullableName: 'notifications',
    path: 'notifications',
    builder: (context, state) => const Notifications(),
  );

  static final changePassword = NamedGoRoute(
    parentNavigatorKey: navigatorKey,
    nonNullableName: _changePasswordName,
    path: 'change-password',
    builder: (context, state) => const ChangePassword(),
    redirect: (context, state) {
      return _redirectToReauth(
        state,
        TopLevelRoutes.passwordReauth,
        _changePasswordName,
      );
    },
  );

  static final configurePasswordAuth = NamedGoRoute(
    parentNavigatorKey: navigatorKey,
    nonNullableName: _configurePasswordAuthName,
    path: 'configure-password-auth',
    builder: (context, state) => const ConfigurePasswordAuth(),
    redirect: (context, state) {
      return _redirectToReauth(
        state,
        TopLevelRoutes.googleReauth,
        _configurePasswordAuthName,
      );
    },
  );

  static final configureGoogleAuth = NamedGoRoute(
    parentNavigatorKey: navigatorKey,
    nonNullableName: _configureGoogleAuthName,
    path: 'configure-google-auth',
    builder: (context, state) => ConfigureGoogleAuth(),
    redirect: (context, state) {
      return _redirectToReauth(
        state,
        TopLevelRoutes.passwordReauth,
        _configureGoogleAuthName,
      );
    },
  );

  static final deleteAccount = NamedGoRoute(
    parentNavigatorKey: navigatorKey,
    nonNullableName: _deleteAccountName,
    path: 'delete-account',
    builder: (context, state) => const DeleteAccount(),
    redirect: (context, state) {
      final localizations = AppLocalizations.of(context);
      final authProviders = GetIt.I<AuthChangeNotifier>().authProviders;

      if (authProviders.isEmpty) {
        return '${TopLevelRoutes.error.path}?${QueryParamKeys.title}=${localizations.noConfiguredAuthProviders}';
      }

      final redirectRoute = authProviderRedirectRoutes[authProviders.first];

      assert(redirectRoute != null);

      return _redirectToReauth(
        state,
        redirectRoute!,
        _deleteAccountName,
      );
    },
  );

  static final category = NamedGoRoute(
    parentNavigatorKey: navigatorKey,
    nonNullableName: 'category',
    path: 'category/:${PathParamKeys.categoryId}',
    builder: (context, state) {
      final categoryId = state.pathParameters[PathParamKeys.categoryId];

      assert(categoryId != null);

      return CategoryView(
        id: categoryId!,
      );
    },
  );

  static final valueTransaction = NamedGoRoute(
    parentNavigatorKey: navigatorKey,
    nonNullableName: 'valueTransaction',
    path: 'value-transaction/:${PathParamKeys.valueTransactionId}',
    builder: (context, state) {
      final valueTransactionId =
          state.pathParameters[PathParamKeys.valueTransactionId];

      assert(valueTransactionId != null);

      return ValueTransactionView(
        id: valueTransactionId!,
      );
    },
  );
}
