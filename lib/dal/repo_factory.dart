import 'auth_repo.dart';
import 'firebase/firebase_auth_repo.dart';
import 'firebase/firebase_user_repo.dart';
import 'user_repo.dart';

class RepoFactory {
  static final _firebaseAuthRepo = FirebaseAuthRepo();
  static final _firebaseUserRepo = FirebaseUserRepo();

  static AuthRepo authRepo() => _firebaseAuthRepo;

  static UserRepo userRepo() => _firebaseUserRepo;
}
