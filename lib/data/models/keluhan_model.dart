import 'package:cloud_firestore/cloud_firestore.dart';

class KeluhanModel {
  final String id;
  final String pasienId;
  final String namaPasien;
  final String keluhanPasien;
  final String? catatanPetugas;
  final DateTime tanggalDatang;
  final DateTime? tanggalKembali;
  final String status;

  KeluhanModel({
    required this.pasienId,
    required this.namaPasien,
    required this.keluhanPasien,
    this.catatanPetugas,
    required this.tanggalDatang,
    this.tanggalKembali,
    required this.status,
    required this.id,
  });

  factory KeluhanModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return KeluhanModel(
      id: snapshot.id,
      pasienId: snapshot['pasienId'],
      namaPasien: snapshot['namaPasien'],
      keluhanPasien: snapshot['keluhanPasien'],
      catatanPetugas: snapshot['catatanPetugas'],
      tanggalDatang: (snapshot['tanggalDatang'] as Timestamp).toDate(),
      tanggalKembali: snapshot['tanggalKembali'] != null
          ? (snapshot['tanggalKembali'] as Timestamp).toDate()
          : null,
      status: snapshot['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pasienId': pasienId,
      'namaPasien': namaPasien,
      'keluhanPasien': keluhanPasien,
      'catatanPetugas': catatanPetugas,
      'tanggalDatang': tanggalDatang,
      'tanggalKembali': tanggalKembali,
      'status': status,
    };
  }
}
