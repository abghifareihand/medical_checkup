part of 'logout_bloc.dart';


sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class LogoutLoading extends LogoutState {}

final class LogoutLoaded extends LogoutState {
  final String message;
  LogoutLoaded({required this.message});
}

final class LogoutError extends LogoutState {
  final String message;
  LogoutError({required this.message});
}
