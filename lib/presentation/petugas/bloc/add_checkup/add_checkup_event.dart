part of 'add_checkup_bloc.dart';


sealed class AddCheckupEvent {}

class AddCheckup extends AddCheckupEvent {
  final CheckupModel checkup;
  AddCheckup({required this.checkup});
}
