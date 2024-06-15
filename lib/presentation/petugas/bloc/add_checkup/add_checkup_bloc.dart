import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/data/datasources/petugas_remote_datasource.dart';
import 'package:medical_checkup/data/models/checkup_model.dart';

part 'add_checkup_event.dart';
part 'add_checkup_state.dart';

class AddCheckupBloc extends Bloc<AddCheckupEvent, AddCheckupState> {
  AddCheckupBloc() : super(AddCheckupInitial()) {
    on<AddCheckup>((event, emit) async {
      emit(AddCheckupLoading());
      final result = await PetugasRemoteDatasource().addCheckup(event.checkup);
      result.fold(
        (error) => emit(AddCheckupError(message: error)),
        (data) => emit(AddCheckupLoaded(message: data)),
      );
    });
  }
}
