// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socketRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocketRequest _$SocketRequestFromJson(Map<String, dynamic> json) {
  return SocketRequest()
    ..data = json['data'] == null
        ? null
        : Task.fromJson(json['data'] as Map<String, dynamic>)
    ..form = json['form'] as String
    ..to = json['to'] as String
    ..code = json['code'] as num
    ..timestamp = json['timestamp'] as String;
}

Map<String, dynamic> _$SocketRequestToJson(SocketRequest instance) =>
    <String, dynamic>{
      'data': instance.data,
      'form': instance.form,
      'to': instance.to,
      'code': instance.code,
      'timestamp': instance.timestamp
    };
