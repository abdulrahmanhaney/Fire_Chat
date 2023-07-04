import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fire_chat/Featured/Auth/data/models/user_model.dart';
import 'package:fire_chat/Featured/Auth/data/repositories/auth_repo_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit(this.authRepoImpl, this.sharedPreferences)
      : super(LoginUserInitial());

  final AuthRepoImpl authRepoImpl;
  final SharedPreferences sharedPreferences;

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

  Future<void> storeUserToSharedPrefrence(UserModel user) async {
    Map<String, dynamic> userInfo = {
      "username": user.username,
      "email": user.email,
      "uid": user.uid,
      "pic": null,
      "blackList": [],
      "whiteList": [],
      "isPicShow": true,
      "isPioShow": true,
      "pio": "Fire Chat User",
      "isBanned": false,
    };

    sharedPreferences.setString('userInfo', jsonEncode(userInfo));
    emit(StoreUserSuccess());
  }
}
