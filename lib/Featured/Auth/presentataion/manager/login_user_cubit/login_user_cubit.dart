import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fire_chat/Featured/Auth/data/models/user_model.dart';
import 'package:fire_chat/Featured/Auth/data/repositories/auth_repo_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit(
      this.authRepoImpl, this.sharedPreferences, this.firebaseFirestore)
      : super(LoginUserInitial());

  final AuthRepoImpl authRepoImpl;
  final SharedPreferences sharedPreferences;
  final FirebaseFirestore firebaseFirestore;

  Future<void> loginUser(
      {required String email, required String passWord}) async {
    emit(LoginUserLoading());
    var response =
        await authRepoImpl.firebaseLogin(email: email, passWord: passWord);
    response.fold(
      (l) {
        emit(LoginUserFailuer(l.errorMessage));
      },
      (r) {
        emit(LoginUserSuccess(r));
      },
    );
  }

  Future<void> getUserinfo(String uid) async {
    var userData = await firebaseFirestore.collection('users').doc(uid).get();
    emit(GetUserSuccess(
        UserModel.fromJson(userData.data() as Map<String, dynamic>)));
  }

  Future<void> storeUserToSharedPrefrence(UserModel user) async {
    Map<String, dynamic> userInfo = {
      "username": user.username,
      "email": user.email,
      "uid": user.uid,
      "pic": user.pic,
      "blackList": user.blackList,
      "whiteList": user.whiteList,
      "groups": user.groups,
      "isPicShow": user.isPicShow,
      "isPioShow": user.isPioShow,
      "pio": user.pio,
      "isBanned": user.isBanned,
      "token": user.token,
    };

    sharedPreferences.setString('userInfo', jsonEncode(userInfo));
    emit(StoreUserSuccess());
  }
}
