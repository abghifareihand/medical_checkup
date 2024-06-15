part of 'register_bloc.dart';


sealed class RegisterEvent {}

class Register extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String role;

  Register({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });
}