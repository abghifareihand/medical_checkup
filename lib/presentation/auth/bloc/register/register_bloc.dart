

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/data/datasources/auth_remote_datasource.dart';
import 'package:medical_checkup/data/models/user_response_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<Register>((event, emit) async {
      emit(RegisterLoading());
      final result = await AuthRemoteDatasource().register(
        event.name,
        event.email,
        event.password,
        event.role,
        
      );
      result.fold(
        (error) => emit(RegisterError(message: error)),
        (data) => emit(RegisterLoaded(user: data)),
      );
    });
  }
}
