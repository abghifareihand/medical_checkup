part of 'add_keluhan_bloc.dart';


sealed class AddKeluhanState {}

final class AddKeluhanInitial extends AddKeluhanState {}

final class AddKeluhanLoading extends AddKeluhanState {}

final class AddKeluhanLoaded extends AddKeluhanState {
  final String message;
  AddKeluhanLoaded({required this.message});
}

final class AddKeluhanError extends AddKeluhanState {
  final String message;
  AddKeluhanError({required this.message});
}
