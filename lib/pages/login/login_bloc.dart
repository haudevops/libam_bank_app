import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoginValidateEvent>(loginSink);
  }

  Future<void> loginSink(LoginValidateEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState(isLoading: true));
    try {
      await Future.delayed(Duration(seconds: 2));
      emit(LoginValidateState(token: "Ok!"));
    } catch (e) {
      emit(LoginErrorState(error: e.toString()));
    }
    emit(LoginLoadingState(isLoading: false));
  }
}
