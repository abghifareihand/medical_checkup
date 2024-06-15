part of 'add_keluhan_bloc.dart';

sealed class AddKeluhanEvent {}

class AddKeluhan extends AddKeluhanEvent {
  final KeluhanModel keluhan;
  AddKeluhan({required this.keluhan});
}