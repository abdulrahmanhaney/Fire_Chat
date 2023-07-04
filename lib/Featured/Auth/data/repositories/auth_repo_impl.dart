import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fire_chat/Core/errors/failuer.dart';
import 'package:fire_chat/Core/services/firebase_service.dart';
import 'package:fire_chat/Core/utils/service_lactor.dart';
import 'package:fire_chat/Featured/Auth/data/models/user_model.dart';
import 'package:fire_chat/Featured/Auth/data/repositories/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  AuthRepoImpl(this.firebaseAuthService);

  @override
  Future<Either<Failuer, UserCredential>> firebaseLogin(
      {required String email, required String passWord}) async {
    try {
      var user =
          await firebaseAuthService.loginUser(email: email, passWord: passWord);
      return right(user);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailuer.fromFirebaseExebtion(e));
      }
      return left(
          FirebaseFailuer('Oops There is an error, please try again later'));
    }
  }

  @override
  Future<Either<Failuer, UserCredential>> firebaseRegester(
      {required String name,
      required String email,
      required String passWord}) async {
    try {
      var user = await firebaseAuthService.registerUser(
          name: name, email: email, passWord: passWord);
      return right(user);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailuer.fromFirebaseExebtion(e));
      }
      return left(
          FirebaseFailuer('Oops There is an error, please try again later'));
    }
  }

  @override
  Future<Either<Failuer, bool>> resetPassword({required String email}) async {
    try {
      await firebaseAuthService.resetPassword(email: email);
      return right(true);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailuer.fromFirebaseExebtion(e));
      }
      return left(
          FirebaseFailuer('Oops There is an error, please try again later'));
    }
  }

  @override
  Future<void> addUserInfo(UserModel user) async {
    var userInfo = getIt.get<SharedPreferences>(instanceName: 'userInfo');
    var usersCollection = getIt.get<CollectionReference>(instanceName: 'users');
    Map<String, dynamic> userInfoMap = {
      "username": user.username,
      "email": user.email,
      "pic": user.pic,
      "pio": user.pio,
      "isBanned": user.isBanned,
      "isPicShow": user.isPicShow,
      "isPioShow": user.isPioShow,
      "blackList": user.blackList,
      "whiteList": user.whiteList,
    };
    usersCollection.add(userInfoMap).whenComplete(
      () {
        userInfo.setString('userIno', jsonEncode(userInfoMap));
      },
    );
  }
}
