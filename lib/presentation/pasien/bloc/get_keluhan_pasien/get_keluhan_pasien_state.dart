part of 'get_keluhan_pasien_bloc.dart';


sealed class GetKeluhanPasienState {}

final class GetKeluhanPasienInitial extends GetKeluhanPasienState {}

final class GetKeluhanPasienLoading extends GetKeluhanPasienState {}

final class GetKeluhanPasienLoaded extends GetKeluhanPasienState {
  final List<KeluhanModel> keluhan;
  GetKeluhanPasienLoaded({required this.keluhan});
}

final class GetKeluhanPasienError extends GetKeluhanPasienState {
  final String message;
  GetKeluhanPasienError({required this.message});
}