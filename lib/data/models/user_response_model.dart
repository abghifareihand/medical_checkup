import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class UserResponseModel {
  final String id;
  final String name;
  final String email;
  final String role;

  UserResponseModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });

  factory UserResponseModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return UserResponseModel(
      id: snapshot.id,
      name: snapshot['name'],
      email: snapshot['email'],
      role: snapshot['role'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
    };
  }

  // Mengubah UserResponseModel menjadi String JSON
  factory UserResponseModel.fromJson(String source) => UserResponseModel.fromMap(json.decode(source));
  String toJson() => json.encode(toMap());

  factory UserResponseModel.fromMap(Map<String, dynamic> map) {
    return UserResponseModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      role: map['role'],
    );
  }
}
