part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginErrorEvent extends LoginEvent {
  final String message;

  const LoginErrorEvent({required this.message});

  @override
  List<Object> get props => [message];
}

class LoginValidateEvent extends LoginEvent {
  final String userName;
  final String password;

  const LoginValidateEvent({required this.userName, required this.password});

  @override
  List<Object> get props => [userName, password];
}
