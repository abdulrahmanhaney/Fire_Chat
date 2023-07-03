import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fire_chat/Featured/Auth/data/repositories/auth_repo_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit(this.authRepoImpl) : super(CreateUserInitial());
  AuthRepoImpl authRepoImpl;

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
}
