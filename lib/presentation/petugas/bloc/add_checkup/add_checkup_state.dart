part of 'add_checkup_bloc.dart';


sealed class AddCheckupState {}

final class AddCheckupInitial extends AddCheckupState {}

final class AddCheckupLoading extends AddCheckupState {}

final class AddCheckupLoaded extends AddCheckupState {
  final String message;
  AddCheckupLoaded({required this.message});
}

final class AddCheckupError extends AddCheckupState {
  final String message;
  AddCheckupError({required this.message});
}