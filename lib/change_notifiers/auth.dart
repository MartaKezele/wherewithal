import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../config/auth_provider.dart' as config;
import '../config/keys/shared_prefs.dart';
import '../models/models.dart' as models;
import '../utils/prefs.dart';

class AuthChangeNotifier extends ChangeNotifier {
  AuthChangeNotifier._() {
    _registerListeners();
  }

  static final AuthChangeNotifier instance =
      AuthChangeNotifier._();

  User? _firebaseAuthUser;
  models.User? _user;
  List<config.AuthProvider> _authProviders = [];
  StreamSubscription<models.UserDocumentSnapshot>?
      _firestoreUserStreamSubscription;
  StreamSubscription<String>? _fcmTokenStreamSubscription;

  bool get signedIn => _firebaseAuthUser != null;
  bool get emailVerified => signedIn && _firebaseAuthUser!.emailVerified;
  String? get email => _firebaseAuthUser?.email;
  String? get displayName => _firebaseAuthUser?.displayName;
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

  void _firestoreUserListener(
    models.UserDocumentSnapshot userDocSnapshot,
  ) async {
    _user = userDocSnapshot.data;
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    _handleFcmToken(fcmToken, userDocSnapshot);
    _fcmTokenStreamSubscription ??=
        FirebaseMessaging.instance.onTokenRefresh.listen(
      (fcmToken) => _handleFcmToken(fcmToken, userDocSnapshot),
      onError: (err) => debugPrint(err),
    );
    notifyListeners();
  }

  void _handleFcmToken(
    String? fcmToken,
    models.UserDocumentSnapshot userDocSnapshot,
  ) async {
    final fcmTokenPref = await fetchStringPref(SharedPrefsKeys.fcmToken);

    if (fcmToken != null) {
      if (fcmToken != fcmTokenPref) {
        await writeStringPref(
          SharedPrefsKeys.fcmToken,
          fcmToken,
        );
      }
      if (userDocSnapshot.exists) {
        final user = userDocSnapshot.data!;
        if (user.fcmToken != fcmToken) {
          await models.usersRef.doc(user.id).update(
                fcmToken: fcmToken,
                fcmTokenTimestamp: DateTime.now().millisecondsSinceEpoch,
              );
        }
      }
    }
  }

  void _registerListeners() {
    FirebaseAuth.instance.userChanges().listen((user) async {
      _firebaseAuthUser = user;
      if (user == null) {
        _user = null;
        _firestoreUserStreamSubscription?.cancel();
        _firestoreUserStreamSubscription = null;
        _fcmTokenStreamSubscription?.cancel();
        _fcmTokenStreamSubscription = null;
      } else {
        _updateAuthProviders();
        _firestoreUserStreamSubscription ??= models.usersRef
            .doc(user.uid)
            .snapshots()
            .listen(_firestoreUserListener);
      }
      notifyListeners();
    });
  }
}