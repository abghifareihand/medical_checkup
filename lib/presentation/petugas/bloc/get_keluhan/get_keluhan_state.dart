part of 'get_keluhan_bloc.dart';


sealed class GetKeluhanState {}

final class GetKeluhanInitial extends GetKeluhanState {}

final class GetKeluhanLoading extends GetKeluhanState {}

final class GetKeluhanLoaded extends GetKeluhanState {
  final List<KeluhanModel> keluhan;
  GetKeluhanLoaded({required this.keluhan});
}

final class GetKeluhanError extends GetKeluhanState {
  final String message;
  GetKeluhanError({required this.message});
}