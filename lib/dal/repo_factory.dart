import 'package:wherewithal/l10n/app_localizations.dart';

import 'auth_repo.dart';
import 'firebase/firebase_auth_repo.dart';
import 'firebase/firebase_user_repo.dart';
import 'user_repo.dart';

class RepoFactory {
  static AuthRepo authRepo(String locale) {
    return FirebaseAuthRepo(AppLocalizations.fromLocale(locale));
  }

  static UserRepo userRepo(String locale) {
    return FirebaseUserRepo(AppLocalizations.fromLocale(locale));
  }
}
