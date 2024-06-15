import 'package:cloud_firestore/cloud_firestore.dart';

class CheckupModel {
  String pasienId;
  String nama;
  String alamat;
  double tinggiBadan;
  double beratBadan;
  String statusKawin;
  String jenisKelamin;
  DateTime tanggalDatang;
  int tahapPengobatan;
  String jenisObat;
  DateTime tanggalKembali;
  String catatan;

  CheckupModel({
    required this.pasienId,
    required this.nama,
    required this.alamat,
    required this.tinggiBadan,
    required this.beratBadan,
    required this.statusKawin,
    required this.jenisKelamin,
    required this.tanggalDatang,
    required this.tahapPengobatan,
    required this.jenisObat,
    required this.tanggalKembali,
    required this.catatan,
  });

  factory CheckupModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return CheckupModel(
      pasienId: snapshot['pasienId'],
      nama: snapshot['nama'],
      alamat: snapshot['alamat'],
      tinggiBadan: snapshot['tinggiBadan'],
      beratBadan: snapshot['beratBadan'],
      statusKawin: snapshot['statusKawin'],
      jenisKelamin: snapshot['jenisKelamin'],
      tanggalDatang: (snapshot['tanggalDatang'] as Timestamp).toDate(),
      tahapPengobatan: snapshot['tahapPengobatan'],
      jenisObat: snapshot['jenisObat'],
      tanggalKembali: (snapshot['tanggalKembali'] as Timestamp).toDate(),
      catatan: snapshot['catatan'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pasienId': pasienId,
      'nama': nama,
      'alamat': alamat,
      'tinggiBadan': tinggiBadan,
      'beratBadan': beratBadan,
      'statusKawin': statusKawin,
      'jenisKelamin': jenisKelamin,
      'tanggalDatang': tanggalDatang,
      'tahapPengobatan': tahapPengobatan,
      'jenisObat': jenisObat,
      'tanggalKembali': tanggalKembali,
      'catatan': catatan,
    };
  }
}
