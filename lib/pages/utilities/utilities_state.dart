part of 'utilities_bloc.dart';

sealed class UtilitiesState extends Equatable {
  const UtilitiesState();
}

final class UtilitiesInitial extends UtilitiesState {
  @override
  List<Object> get props => [];
}
