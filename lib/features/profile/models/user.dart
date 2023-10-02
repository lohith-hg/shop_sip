import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(nullable: true)
class AppUser {
  String? uid;
  String? name;
  String? email;
  String? imageUrl;
  DateTime? dateOfBirth;
  DateTime? createdAt;
  Map<String, dynamic>? customData;

  @JsonKey(ignore: true)
  DocumentReference? reference;

  AppUser({
    this.uid,
    this.name,
    this.email,
    this.imageUrl,
    this.dateOfBirth,
    this.createdAt,
    this.customData,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  factory AppUser.fromSnapshot(DocumentSnapshot snapshot) {
    final user = AppUser.fromJson(snapshot.data() as Map<String, dynamic>);
    user.reference = snapshot.reference;
    user.uid = snapshot.reference.id;
    return user;
  }

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
