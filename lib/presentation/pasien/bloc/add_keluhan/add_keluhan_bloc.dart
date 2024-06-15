import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/data/datasources/pasien_remote_datasource.dart';
import 'package:medical_checkup/data/models/keluhan_model.dart';

part 'add_keluhan_event.dart';
part 'add_keluhan_state.dart';

class AddKeluhanBloc extends Bloc<AddKeluhanEvent, AddKeluhanState> {
  AddKeluhanBloc() : super(AddKeluhanInitial()) {
    on<AddKeluhan>((event, emit) async {
      emit(AddKeluhanLoading());
      final result = await PasienRemoteDatasource().addKeluhan(event.keluhan);
      result.fold(
        (error) => emit(AddKeluhanError(message: error)),
        (data) => emit(AddKeluhanLoaded(message: data)),
      );
    });
  }
}
