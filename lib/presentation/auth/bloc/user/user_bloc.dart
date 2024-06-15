


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/data/datasources/auth_remote_datasource.dart';
import 'package:medical_checkup/data/models/user_response_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<GetUser>((event, emit) async {
      emit(UserLoading());
      final user = FirebaseAuth.instance.currentUser;
      final result = await AuthRemoteDatasource().getUser(user!.uid);
      result.fold(
        (error) => emit(UserError(message: error)),
        (data) => emit(UserLoaded(user: data)),
      );
    });
  }
}
