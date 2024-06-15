part of 'update_keluhan_bloc.dart';


sealed class UpdateKeluhanState {}

final class UpdateKeluhanInitial extends UpdateKeluhanState {}

final class UpdateKeluhanLoading extends UpdateKeluhanState {}

final class UpdateKeluhanLoaded extends UpdateKeluhanState {
  final String message;
  UpdateKeluhanLoaded({required this.message});
}

final class UpdateKeluhanError extends UpdateKeluhanState {
  final String message;
  UpdateKeluhanError({required this.message});
}