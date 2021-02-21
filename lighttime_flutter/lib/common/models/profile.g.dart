// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile()
    ..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>)
    ..theme = json['theme'] as num
    ..lastLogin = json['lastLogin'] as String
    ..locale = json['locale'] as String
    ..lastDate = json['lastDate'] as String
    ..token = json['token'] as String;
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'user': instance.user,
      'theme': instance.theme,
      'lastLogin': instance.lastLogin,
      'locale': instance.locale,
      'lastDate': instance.lastDate,
      'token': instance.token
    };
