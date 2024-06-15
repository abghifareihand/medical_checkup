

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/data/datasources/auth_remote_datasource.dart';
import 'package:medical_checkup/data/models/user_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<Login>((event, emit) async {
      emit(LoginLoading());
      final result =
          await AuthRemoteDatasource().login(event.email, event.password);
      result.fold(
        (error) => emit(LoginError(message: error)),
        (data) => emit(LoginLoaded(user: data)),
      );
    });
  }
}
