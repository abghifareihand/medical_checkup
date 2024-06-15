import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/data/datasources/pasien_remote_datasource.dart';
import 'package:medical_checkup/data/models/checkup_model.dart';

part 'get_checkup_pasien_event.dart';
part 'get_checkup_pasien_state.dart';

class GetCheckupPasienBloc
    extends Bloc<GetCheckupPasienEvent, GetCheckupPasienState> {
  GetCheckupPasienBloc() : super(GetCheckupPasienInitial()) {
    on<GetCheckupPasien>((event, emit) async {
      emit(GetCheckupPasienLoading());
      try {
        final pasienId = FirebaseAuth.instance.currentUser!.uid;
        final result = PasienRemoteDatasource().getCheckupByIdPasien(pasienId);
        await emit.forEach<List<CheckupModel>>(
          result,
          onData: (data) => GetCheckupPasienLoaded(checkup: data),
          onError: (_, error) =>
              GetCheckupPasienError(message: 'Error Get Data Pasien'),
        );
      } catch (e) {
        emit(GetCheckupPasienError(message: e.toString()));
      }
    });
  }
}
