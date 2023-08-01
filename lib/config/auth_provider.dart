import '../config/routes.dart';

enum AuthProvider {
  google(id: 'google.com'),
  password(id: 'password');

  const AuthProvider({
    required this.id,
  });

  final String id;
}

final authProviderRedirectRoutes = {
  AuthProvider.google: TopLevelRoutes.googleReauth,
  AuthProvider.password: TopLevelRoutes.passwordReauth,
};