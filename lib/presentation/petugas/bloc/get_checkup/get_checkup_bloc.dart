import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/data/datasources/petugas_remote_datasource.dart';
import 'package:medical_checkup/data/models/checkup_model.dart';

part 'get_checkup_event.dart';
part 'get_checkup_state.dart';

class GetCheckupBloc extends Bloc<GetCheckupEvent, GetCheckupState> {
  GetCheckupBloc() : super(GetCheckupInitial()) {
    on<GetCheckup>((event, emit) async {
      emit(GetCheckupLoading());
      try {
        final keluhanStream = PetugasRemoteDatasource().getCheckup();
        await emit.forEach<List<CheckupModel>>(
          keluhanStream,
          onData: (data) => GetCheckupLoaded(checkup: data),
          onError: (_, error) => GetCheckupError(message: 'Error Get Laporan'),
        );
      } catch (e) {
        emit(GetCheckupError(message: e.toString()));
      }
    });
  }
}
