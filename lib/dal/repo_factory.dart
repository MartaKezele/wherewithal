import '../l10n/app_localizations.dart';
import 'auth_repo.dart';
import 'firebase/firebase_auth_repo.dart';
import 'firebase/firebase_user_repo_1.dart';
import 'firestore/firestore_user_repo_2.dart';
import 'user_repo_1.dart';
import 'user_repo_2.dart';

class RepoFactory {
  RepoFactory.fromFullLocaleString({
    required String fullLocaleString,
  })  : authRepo = FirebaseAuthRepo(
          AppLocalizations.fromLocale(fullLocaleString),
        ),
        userRepo1 = FirebaseUserRepo1(
          AppLocalizations.fromLocale(fullLocaleString),
        ),
        userRepo2 = FirestoreUserRepo2(
          AppLocalizations.fromLocale(fullLocaleString),
        );

  final AuthRepo authRepo;
  final UserRepo1 userRepo1;
  final UserRepo2 userRepo2;

  set localizations(AppLocalizations localizations) {
    authRepo.localizations = localizations;
    userRepo1.localizations = localizations;
    userRepo2.localizations = localizations;
  }
}
