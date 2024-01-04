import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../config/auth_provider.dart' as config;
import '../config/keys/shared_prefs.dart';
import '../models/models.dart' as models;
import '../utils/prefs.dart';

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
  StreamSubscription<String>? _fcmTokenStreamSubscription;

  bool get signedIn => _firebaseAuthUser != null;
  bool get emailVerified => signedIn && _firebaseAuthUser!.emailVerified;
  String? get email => _firebaseAuthUser?.email;
  String? get displayName => _firebaseAuthUser?.displayName;
  String? get uid => _firebaseAuthUser?.uid;
  String? get id => _user?.id;

  // whether user should be created in firestore
  bool get shouldSetUpUserData => _user == null;

  bool get shouldSetUpCategories =>
      shouldSetUpUserData || (_user != null && _user!.shouldSetUpCategories);

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

  void _handleFcmToken(
    String? fcmToken,
    models.UserQuerySnapshot userQuerySnapshot,
  ) async {
    final userExists = userQuerySnapshot.docs.isNotEmpty;
    final fcmTokenPref = await fetchStringPref(SharedPrefsKeys.fcmToken);

    if (fcmToken != null) {
      if (fcmToken != fcmTokenPref) {
        await writeStringPref(
          SharedPrefsKeys.fcmToken,
          fcmToken,
        );
      }
      if (userExists) {
        final user = userQuerySnapshot.docs.first.data;
        if (user.fcmToken != fcmToken) {
          await models.usersRef.doc(user.id).update(
                fcmToken: fcmToken,
                fcmTokenTimestamp: DateTime.now().millisecondsSinceEpoch,
              );
        }
      }
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
        _firestoreUserStreamSubscription ??= models.usersRef
            .whereUid(isEqualTo: user.uid)
            .limit(1)
            .snapshots()
            .listen(
          (userQuerySnapshot) async {
            _firestoreUserListener(userQuerySnapshot);
            String? fcmToken = await FirebaseMessaging.instance.getToken();
            _handleFcmToken(fcmToken, userQuerySnapshot);
            _fcmTokenStreamSubscription ??=
                FirebaseMessaging.instance.onTokenRefresh.listen(
              (fcmToken) => _handleFcmToken(fcmToken, userQuerySnapshot),
              onError: (err) => debugPrint(err),
            );
            notifyListeners();
          },
        );
      }
      notifyListeners();
    });
  }
}
