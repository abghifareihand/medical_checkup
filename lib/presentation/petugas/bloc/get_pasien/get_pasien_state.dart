part of 'get_pasien_bloc.dart';


sealed class GetPasienState {}

final class GetPasienInitial extends GetPasienState {}

final class GetPasienLoading extends GetPasienState {}

final class GetPasienLoaded extends GetPasienState {
  final List<UserResponseModel> pasien;
  GetPasienLoaded({required this.pasien});
}

final class GetPasienError extends GetPasienState {
  final String message;
  GetPasienError({required this.message});
}