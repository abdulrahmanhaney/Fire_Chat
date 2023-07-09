import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fire_chat/Featured/Auth/data/models/user_model.dart';
import 'package:fire_chat/Featured/Auth/data/repositories/auth_repo_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit(this.authRepoImpl, this.users) : super(CreateUserInitial());
  AuthRepoImpl authRepoImpl;
  CollectionReference users;

  Future<void> createUser(
      {required String userName,
      required String email,
      required String passWord}) async {
    emit(CreateUserLoading());
    var response = await authRepoImpl.firebaseRegester(
        name: userName, email: email, passWord: passWord);
    response.fold(
      (left) {
        emit(CreateUserFailuer(left.errorMessage));
      },
      (right) {
        emit(CreateUserSuccess(right));
      },
    );
  }

  Future<void> storeUserInfo({required UserModel user}) async {
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
      "token": user.token,
    };
    try {
      users.doc(user.uid).set(userInfo);
      emit(AddInfoSucess());
    } on FirebaseException catch (e) {
      emit(AddInfoFailuer(e.message ?? "Oops There Was An Error"));
    }
  }
}
