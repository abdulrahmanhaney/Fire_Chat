import 'package:dartz/dartz.dart';
import 'package:fire_chat/Core/errors/failuer.dart';
import 'package:fire_chat/Featured/Auth/data/repositories/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failuer, UserCredential>> firebaseLogin(
      {required String email, required String passWord}) {
    // TODO: implement firebaseLogin
    throw UnimplementedError();
  }

  @override
  Future<Either<Failuer, UserCredential>> firebaseRegester(
      {required String name, required String email, required String passWord}) {
    // TODO: implement firebaseRegester
    throw UnimplementedError();
  }

  @override
  void resetPassword() {
    // TODO: implement resetPassword
  }
}
