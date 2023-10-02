import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import 'auth_repo.dart';
import 'firebase/firebase_auth_repo.dart';
import 'firebase/firebase_user_repo_1.dart';
import 'firestore/firestore_user_repo_2.dart';
import 'user_repo_1.dart';
import 'user_repo_2.dart';

class RepoFactory {
  RepoFactory.fromLocalizations({
    required this.localizations,
  });

  RepoFactory.fromFullLocaleString({
    required String fullLocaleString,
  }) : localizations = AppLocalizations.fromLocale(fullLocaleString);

  RepoFactory.fromLocale({
    required Locale locale,
  }) : localizations = AppLocalizations.fromLocale(
            '${locale.languageCode}_${locale.countryCode}');

  AppLocalizations localizations;

  AuthRepo get authRepo => FirebaseAuthRepo(localizations);

  UserRepo1 get userRepo1 => FirebaseUserRepo1(localizations);

  UserRepo2 get userRepo2 => FirestoreUserRepo2(localizations);
}
