import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:medical_checkup/data/models/keluhan_model.dart';
import 'package:medical_checkup/data/models/checkup_model.dart';

class PasienRemoteDatasource {
  final checkupCollection = FirebaseFirestore.instance.collection('checkup');
  final keluhanCollection = FirebaseFirestore.instance.collection('keluhan');

  /// Pasien
  Stream<List<CheckupModel>> getCheckupByIdPasien(String pasienId) {
    try {
      return checkupCollection
          .where('pasienId', isEqualTo: pasienId)
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map((doc) => CheckupModel.fromDocumentSnapshot(doc))
                .toList(),
          );
    } catch (e) {
      throw Exception('Gagal mengambil data chekcup pasien: $e');
    }
  }

  /// Pasien
  Future<Either<String, String>> addKeluhan(KeluhanModel keluhan) async {
    try {
      DocumentReference docRef = await keluhanCollection.add(keluhan.toMap());
      String documentId = docRef.id;
      await keluhanCollection.doc(documentId).update({
        'id': documentId,
      });
      return const Right('Add keluhan berhasil');
    } catch (e) {
       return Left('Gagal add keluhan: $e');
    }
  }

  /// Pasien
  Stream<List<KeluhanModel>> getKeluhanByIdPasien(String pasienId) {
    try {
      return keluhanCollection
          .where('pasienId', isEqualTo: pasienId)
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map((doc) => KeluhanModel.fromDocumentSnapshot(doc))
                .toList(),
          );
    } catch (e) {
      throw Exception('Gagal mengambil data keluhan pasien: $e');
    }
  }
}
