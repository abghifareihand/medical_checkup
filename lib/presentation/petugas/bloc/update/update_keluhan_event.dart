part of 'update_keluhan_bloc.dart';


sealed class UpdateKeluhanEvent {}

class UpdateKeluhan extends UpdateKeluhanEvent {
  final String keluhanId;
  final String catatan;
  final DateTime tanggalKembali;

  UpdateKeluhan({
    required this.keluhanId,
    required this.catatan,
    required this.tanggalKembali,
  });
}