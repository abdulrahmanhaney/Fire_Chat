import 'package:dartz/dartz.dart';
import 'package:fire_chat/Core/errors/failuer.dart';
import 'package:fire_chat/Featured/Auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<Either<Failuer, UserCredential>> firebaseRegester({
    required String name,
    required String email,
    required String passWord,
  });

  Future<void> addUserInfo(UserModel user);

  Future<Either<Failuer, UserCredential>> firebaseLogin({
    required String email,
    required String passWord,
  });

  void resetPassword({required String email});
}
