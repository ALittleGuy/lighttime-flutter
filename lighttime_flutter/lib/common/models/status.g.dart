// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) {
  return Status()
    ..id = json['id'] as num
    ..title = json['title'] as String;
}

Map<String, dynamic> _$StatusToJson(Status instance) =>
    <String, dynamic>{'id': instance.id, 'title': instance.title};
