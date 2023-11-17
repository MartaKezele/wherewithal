import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../config/auth_provider.dart' as config;
import '../models/models.dart' as models;

class AuthChangeNotifier extends ChangeNotifier {
  AuthChangeNotifier._privateConstructor() {
    registerListeners();
  }

  static final AuthChangeNotifier instance =
      AuthChangeNotifier._privateConstructor();

  User? _firebaseAuthUser;
  models.User? _user;
  List<config.AuthProvider> _authProviders = [];
  StreamSubscription<models.UserQuerySnapshot>?
      _firestoreUserStreamSubscription;

  bool get signedIn => _firebaseAuthUser != null;
  bool get emailVerified =>
      _firebaseAuthUser != null && _firebaseAuthUser!.emailVerified;
  String? get email => _firebaseAuthUser?.email;
  String? get displayName => _firebaseAuthUser?.displayName;
  String? get uid => _firebaseAuthUser?.uid;
  String? get id => _user?.id;

  bool get shouldSetUpData =>
      signedIn && (_user == null || (_user != null && _user!.shouldSetUpData));

  List<config.AuthProvider> get authProviders => _authProviders;

  void _updateAuthProviders() {
    final providerData = _firebaseAuthUser?.providerData;
    if (providerData == null) {
      _authProviders = [];
    } else {
      _authProviders = providerData
          .map(
            (userInfo) => config.AuthProvider.values.firstWhere(
              (authProvider) => authProvider.id == userInfo.providerId,
            ),
          )
          .toList();
    }
  }

  void _firestoreUserListener(models.UserQuerySnapshot userQuerySnapshot) {
    if (userQuerySnapshot.docs.isEmpty) {
      _user = null;
    } else {
      _user = userQuerySnapshot.docs.first.data;
    }
  }

  void registerListeners() {
    FirebaseAuth.instance.userChanges().listen((user) async {
      _firebaseAuthUser = user;
      if (user == null) {
        _user = null;
        _firestoreUserStreamSubscription?.cancel();
        _firestoreUserStreamSubscription = null;
      } else {
        _updateAuthProviders();

        final userQuerySnapshot =
            await models.usersRef.whereUid(isEqualTo: user.uid).limit(1).get();
        _firestoreUserListener(userQuerySnapshot);

        _firestoreUserStreamSubscription ??= models.usersRef
            .whereUid(isEqualTo: user.uid)
            .limit(1)
            .snapshots()
            .listen(
          (userQuerySnapshot) {
            _firestoreUserListener(userQuerySnapshot);
            notifyListeners();
          },
        );
      }
      notifyListeners();
    });
  }
}
