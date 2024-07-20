import 'package:cloud_firestore/cloud_firestore.dart';

class CheckupModel {
  String pasienId;
  String rekamMedis;
  String nama;
  String alamat;
  double umur;
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
    required this.rekamMedis,
    required this.nama,
    required this.alamat,
    required this.umur,
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
      rekamMedis: snapshot['rekamMedis'],
      nama: snapshot['nama'],
      alamat: snapshot['alamat'],
      umur: snapshot['umur'],
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
      'rekamMedis': rekamMedis,
      'nama': nama,
      'alamat': alamat,
      'umur': umur,
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
