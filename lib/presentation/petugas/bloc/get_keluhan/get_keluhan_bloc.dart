

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/data/datasources/petugas_remote_datasource.dart';
import 'package:medical_checkup/data/models/keluhan_model.dart';

part 'get_keluhan_event.dart';
part 'get_keluhan_state.dart';

class GetKeluhanBloc extends Bloc<GetKeluhanEvent, GetKeluhanState> {
  GetKeluhanBloc() : super(GetKeluhanInitial()) {
    on<GetKeluhan>((event, emit) async {
      emit(GetKeluhanLoading());
      try {
        final keluhanStream = PetugasRemoteDatasource().getKeluhan();
        await emit.forEach<List<KeluhanModel>>(
          keluhanStream,
          onData: (data) => GetKeluhanLoaded(keluhan: data),
          onError: (_, error) => GetKeluhanError(message: 'Error Get Keluhan'),
        );
      } catch (e) {
        emit(GetKeluhanError(message: e.toString()));
      }
    });
  }
}
