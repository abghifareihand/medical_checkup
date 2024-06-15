import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:medical_checkup/data/models/user_response_model.dart';


import 'auth_local_datasource.dart';

class AuthRemoteDatasource {
  FirebaseAuth auth = FirebaseAuth.instance;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  // Register
  Future<Either<String, UserResponseModel>> register(
      String name, String email, String password, String role) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserResponseModel user = UserResponseModel(
        id: userCredential.user!.uid,
        email: email,
        name: name,
        role: role,
      );
      await usersCollection.doc(userCredential.user!.uid).set(user.toMap());
      await AuthLocalDatasource().saveAuthData(user);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(e.toString());
    }
  }

  // Login
  Future<Either<String, UserResponseModel>> login(
      String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final response =
          await usersCollection.doc(userCredential.user!.uid).get();
      UserResponseModel user = UserResponseModel.fromDocumentSnapshot(response);
      await AuthLocalDatasource().saveAuthData(user);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, UserResponseModel>> getUser(String userId) async {
    try {
      final response = await usersCollection.doc(userId).get();
      return Right(UserResponseModel.fromDocumentSnapshot(response));
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> logout() async {
    try {
      await auth.signOut();
      await AuthLocalDatasource().removeAuthData();
      return const Right('Logout Successful');
    } catch (e) {
      return Left(e.toString());
    }
  }
}
