import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthService(this.firebaseAuth);

  Future<UserCredential> registerUser(
      {required String name,
      required String email,
      required String passWord}) async {
    UserCredential user = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: passWord);
    return user;
  }

  Future<UserCredential> loginUser(
      {required String email, required String passWord}) async {
    UserCredential user = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: passWord);
    return user;
  }

  Future<void> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
