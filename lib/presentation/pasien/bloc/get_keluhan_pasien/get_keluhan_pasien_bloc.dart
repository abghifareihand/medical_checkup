import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/data/datasources/pasien_remote_datasource.dart';
import 'package:medical_checkup/data/models/keluhan_model.dart';

part 'get_keluhan_pasien_event.dart';
part 'get_keluhan_pasien_state.dart';

class GetKeluhanPasienBloc
    extends Bloc<GetKeluhanPasienEvent, GetKeluhanPasienState> {
  GetKeluhanPasienBloc() : super(GetKeluhanPasienInitial()) {
    on<GetKeluhanByPasien>((event, emit) async {
      emit(GetKeluhanPasienLoading());
      try {
        final user = FirebaseAuth.instance.currentUser;
        final keluhanStream =
            PasienRemoteDatasource().getKeluhanByIdPasien(user!.uid);
        await emit.forEach<List<KeluhanModel>>(
          keluhanStream,
          onData: (data) => GetKeluhanPasienLoaded(keluhan: data),
          onError: (_, error) =>
              GetKeluhanPasienError(message: 'Error Get Keluhan'),
        );
      } catch (e) {
        emit(GetKeluhanPasienError(message: e.toString()));
      }
    });
  }
}
