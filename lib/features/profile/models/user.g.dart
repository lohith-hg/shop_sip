// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      imageUrl: json['imageUrl'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      customData: json['customData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'imageUrl': instance.imageUrl,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'customData': instance.customData,
    };
