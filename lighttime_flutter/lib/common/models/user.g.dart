// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as num
    ..username = json['username'] as String
    ..password = json['password'] as String
    ..email = json['email'] as String
    ..phone = json['phone'] as String
    ..avatar = json['avatar'] as String
    ..token = json['token'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'token': instance.token
    };
