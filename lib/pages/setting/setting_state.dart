part of 'setting_bloc.dart';

sealed class SettingState extends Equatable {
  const SettingState();
}

final class SettingInitial extends SettingState {
  @override
  List<Object> get props => [];
}
