part of 'login_user_cubit.dart';

abstract class LoginUserState extends Equatable {
  const LoginUserState();

  @override
  List<Object> get props => [];
}

class LoginUserInitial extends LoginUserState {}

class LoginUserLoading extends LoginUserState {}

class StoreUserSuccess extends LoginUserState {}

class LoginUserSuccess extends LoginUserState {
  final UserCredential user;
  const LoginUserSuccess(this.user);
}

class LoginUserFailuer extends LoginUserState {
  final String erroeMessage;
  const LoginUserFailuer(this.erroeMessage);
}
