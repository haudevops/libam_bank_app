part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
}

final class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginErrorState extends LoginState {
  final String error;

  const LoginErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class LoginLoadingState extends LoginState {
  final bool isLoading;

  const LoginLoadingState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class LoginValidateState extends LoginState {
  final String token;

  const LoginValidateState({required this.token});

  @override
  List<Object> get props => [token];
}