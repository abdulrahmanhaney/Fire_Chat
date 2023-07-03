import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fire_chat/Featured/Auth/data/repositories/auth_repo_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit(this.authRepoImpl) : super(LoginUserInitial());

  final AuthRepoImpl authRepoImpl;

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
}
