part of 'get_checkup_pasien_bloc.dart';


sealed class GetCheckupPasienState {}

final class GetCheckupPasienInitial extends GetCheckupPasienState {}

final class GetCheckupPasienLoading extends GetCheckupPasienState {}

final class GetCheckupPasienLoaded extends GetCheckupPasienState {
  final List<CheckupModel> checkup;
  GetCheckupPasienLoaded({required this.checkup});
}

final class GetCheckupPasienError extends GetCheckupPasienState {
  final String message;
  GetCheckupPasienError({required this.message});
}