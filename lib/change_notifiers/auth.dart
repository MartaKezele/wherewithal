import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../config/auth_provider.dart';

class Auth extends ChangeNotifier {
  Auth._privateConstructor() {
    registerListeners();
  }

  static final Auth instance = Auth._privateConstructor();

  User? _user;
  List<AuthProvider> _authProviders = [];

  bool get signedIn => _user != null;
  bool get emailVerified => _user != null && _user!.emailVerified;
  String? get email => _user?.email;
  String? get displayName => _user?.displayName;

  List<AuthProvider> get authProviders => _authProviders;

  void _updateAuthProviders() {
    final providerData = _user?.providerData;
    if (providerData == null) {
      _authProviders = [];
    } else {
      _authProviders = providerData
          .map((userInfo) => AuthProvider.values.firstWhere(
              (authProvider) => authProvider.id == userInfo.providerId))
          .toList();
    }
  }

  void registerListeners() {
    FirebaseAuth.instance.userChanges().listen((user) async {
      _user = user;
      _updateAuthProviders();
      notifyListeners();
    });
  }
}
