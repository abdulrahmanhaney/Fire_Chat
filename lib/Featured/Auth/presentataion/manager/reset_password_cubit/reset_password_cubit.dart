import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fire_chat/Featured/Auth/data/repositories/auth_repo_impl.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.authRepoImpl) : super(ResetPasswordInitial());
  AuthRepoImpl authRepoImpl;

  Future<void> resetPassword({required String email}) async {
    var response = await authRepoImpl.resetPassword(email: email);
    response.fold(
      (fail) => emit(ResetPasswordFailuer(fail.errorMessage)),
      (success) => emit(ResetPasswordSuccess()),
    );
  }
}
