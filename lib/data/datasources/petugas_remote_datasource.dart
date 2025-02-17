import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:medical_checkup/data/models/checkup_model.dart';
import 'package:medical_checkup/data/models/keluhan_model.dart';
import 'package:medical_checkup/data/models/user_response_model.dart';

class PetugasRemoteDatasource {
  final usersCollection = FirebaseFirestore.instance.collection('users');
  final checkupCollection = FirebaseFirestore.instance.collection('checkup');
  final keluhanCollection = FirebaseFirestore.instance.collection('keluhan');

  /// Petugas
  Stream<List<UserResponseModel>> getPasien() {
    try {
      return usersCollection.where('role', isEqualTo: 'pasien').snapshots().map(
            (snapshot) => snapshot.docs
                .map((doc) => UserResponseModel.fromDocumentSnapshot(doc))
                .toList(),
          );
    } catch (e) {
      throw Exception('Gagal mengambil data pasien: $e');
    }
  }

  /// Petugas
  Future<Either<String, String>> addCheckup(CheckupModel checkup) async {
    try {
      await checkupCollection.doc(checkup.pasienId).set(checkup.toMap());
      return const Right('Add checkup pasien berhasil');
    } catch (e) {
      return Left('Gagal add checkup pasien: $e');
    }
  }

  /// Petugas
  Stream<List<KeluhanModel>> getKeluhan() {
    try {
      return keluhanCollection.snapshots().map(
            (snapshot) => snapshot.docs
                .map((doc) => KeluhanModel.fromDocumentSnapshot(doc))
                .toList(),
          );
    } catch (e) {
      throw Exception('Gagal mengambil data keluhan pasien: $e');
    }
  }

  /// Petugas
  Stream<List<CheckupModel>> getCheckup() {
    try {
      return checkupCollection.snapshots().map(
            (snapshot) => snapshot.docs
                .map((doc) => CheckupModel.fromDocumentSnapshot(doc))
                .toList(),
          );
    } catch (e) {
      throw Exception('Gagal mengambil data checkup pasien: $e');
    }
  }

  /// Petugas
  Future<Either<String, String>> updateKeluhan(
    String keluhanId,
    String catatan,
    DateTime tanggalKembali,
  ) async {
    try {
      await keluhanCollection.doc(keluhanId).update({
        'status': 'dijawab',
        'catatanPetugas': catatan,
        'tanggalKembali': Timestamp.fromDate(tanggalKembali),
      });
      return const Right('Update keluhan berhasil');
    } catch (e) {
      return Left('Gagal update keluhan pasien: $e');
    }
  }
}
