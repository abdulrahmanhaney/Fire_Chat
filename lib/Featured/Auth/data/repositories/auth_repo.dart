import 'package:dartz/dartz.dart';
import 'package:fire_chat/Core/errors/failuer.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<Either<Failuer, UserCredential>> firebaseRegester({
    required String name,
    required String email,
    required String passWord,
  });

  Future<Either<Failuer, UserCredential>> firebaseLogin({
    required String email,
    required String passWord,
  });

  void resetPassword();
}
