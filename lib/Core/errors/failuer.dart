import 'package:firebase_auth/firebase_auth.dart';

abstract class Failuer {
  final String errorMessage;
  Failuer(this.errorMessage);
}

class FirebaseFailuer extends Failuer {
  FirebaseFailuer(super.errorMessage);

  factory FirebaseFailuer.fromFirebaseExebtion(
      FirebaseAuthException firebaseAuthException) {
    switch (firebaseAuthException.code) {
      case "weak-password":
        return FirebaseFailuer('The password provided is too weak.');

      case "email-already-in-use":
        return FirebaseFailuer('The account already exists for that email.');

      case "user-not-found":
        return FirebaseFailuer('No user found for that email.');
      case "wrong-password":
        return FirebaseFailuer('Wrong password provided for that user.');

      default:
        return FirebaseFailuer(
          firebaseAuthException.message ??
              'Oops There is an error, Please try again later',
        );
    }
  }
}
