import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/data/datasources/petugas_remote_datasource.dart';
import 'package:medical_checkup/data/models/user_response_model.dart';

part 'get_pasien_event.dart';
part 'get_pasien_state.dart';

class GetPasienBloc extends Bloc<GetPasienEvent, GetPasienState> {
  GetPasienBloc() : super(GetPasienInitial()) {
    on<GetPasien>((event, emit) async {
      emit(GetPasienLoading());
      try {
        final result = PetugasRemoteDatasource().getPasien();
        await emit.forEach<List<UserResponseModel>>(
          result,
          onData: (data) => GetPasienLoaded(pasien: data),
          onError: (_, error) => GetPasienError(message: 'Error Get Pasien'),
        );
      } catch (e) {
        emit(GetPasienError(message: e.toString()));
      }
    });
  }
}
