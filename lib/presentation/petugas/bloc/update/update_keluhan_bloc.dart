

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/data/datasources/petugas_remote_datasource.dart';

part 'update_keluhan_event.dart';
part 'update_keluhan_state.dart';

class UpdateKeluhanBloc extends Bloc<UpdateKeluhanEvent, UpdateKeluhanState> {
  UpdateKeluhanBloc() : super(UpdateKeluhanInitial()) {
   on<UpdateKeluhan>((event, emit) async {
      emit(UpdateKeluhanLoading());
      final result = await PetugasRemoteDatasource().updateKeluhan(
       event.keluhanId,
       event.catatan,
       event.tanggalKembali,
      );
      result.fold(
        (error) => emit(UpdateKeluhanError(message: error)),
        (data) => emit(UpdateKeluhanLoaded(message: data)),
      );
    });
  }
}
