part of 'get_checkup_bloc.dart';


sealed class GetCheckupState {}

final class GetCheckupInitial extends GetCheckupState {}

final class GetCheckupLoading extends GetCheckupState {}

final class GetCheckupLoaded extends GetCheckupState {
  final List<CheckupModel> checkup;
  GetCheckupLoaded({required this.checkup});
}

final class GetCheckupError extends GetCheckupState {
  final String message;
  GetCheckupError({required this.message});
}