import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'utilities_event.dart';
part 'utilities_state.dart';

class UtilitiesBloc extends Bloc<UtilitiesEvent, UtilitiesState> {
  UtilitiesBloc() : super(UtilitiesInitial()) {
    on<UtilitiesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
