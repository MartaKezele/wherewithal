import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../config/auth_provider.dart';
import '../models/models.dart' as models;
import 'repo_factory.dart';

class AuthChangeNotifier extends ChangeNotifier {
  AuthChangeNotifier._privateConstructor() {
    registerListeners();
  }

  static final AuthChangeNotifier instance =
      AuthChangeNotifier._privateConstructor();

  User? _firebaseAuthUser;
  models.User? _user;
  List<AuthProvider> _authProviders = [];

  bool get signedIn => _firebaseAuthUser != null;
  bool get emailVerified =>
      _firebaseAuthUser != null && _firebaseAuthUser!.emailVerified;
  String? get email => _firebaseAuthUser?.email;
  String? get displayName => _firebaseAuthUser?.displayName;
  String? get uid => _firebaseAuthUser?.uid;
  String? get id => _user?.id;

  List<AuthProvider> get authProviders => _authProviders;

  void _updateAuthProviders() {
    final providerData = _firebaseAuthUser?.providerData;
    if (providerData == null) {
      _authProviders = [];
    } else {
      _authProviders = providerData
          .map(
            (userInfo) => AuthProvider.values.firstWhere(
              (authProvider) => authProvider.id == userInfo.providerId,
            ),
          )
          .toList();
    }
  }

  void registerListeners() {
    FirebaseAuth.instance.userChanges().listen((user) async {
      _firebaseAuthUser = user;
      if (user == null) {
        _user = null;
      } else {
        models.usersRef
            .whereUid(isEqualTo: user.uid)
            .snapshots()
            .listen((userDocumentSnapshot) {
          if (userDocumentSnapshot.docs.isEmpty) {
            _user = null;
          } else {
            _user = userDocumentSnapshot.docs.first.data;
          }
          notifyListeners();
        });

        final userResult = await GetIt.I<RepoFactoryChangeNotifier>()
            .repoFactory
            .userRepo2
            .retrieveByUid(user.uid);

        if (userResult.success) {
          _user = userResult.data;
        }
      }
      _updateAuthProviders();
      notifyListeners();
    });
  }
}
