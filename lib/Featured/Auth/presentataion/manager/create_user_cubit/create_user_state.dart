part of 'create_user_cubit.dart';

abstract class CreateUserState extends Equatable {
  const CreateUserState();

  @override
  List<Object> get props => [];
}

class CreateUserInitial extends CreateUserState {}

class CreateUserLoading extends CreateUserState {}

class CreateUserSuccess extends CreateUserState {
  final UserCredential user;
  const CreateUserSuccess(this.user);
}

class CreateUserFailuer extends CreateUserState {
  final String errorMessage;
  const CreateUserFailuer(this.errorMessage);
}
