// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task()
    ..id = json['id'] as num
    ..principal = json['principal'] as String
    ..sponsor = json['sponsor'] as String
    ..title = json['title'] as String
    ..content = json['content'] as String
    ..deadline = json['deadline'] as String
    ..lauchdate = json['lauchdate'] as String
    ..status = json['status'] as num
    ..tag = json['tag'] as String
    ..catalog = json['catalog'] as num;
}

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'principal': instance.principal,
      'sponsor': instance.sponsor,
      'title': instance.title,
      'content': instance.content,
      'deadline': instance.deadline,
      'lauchdate': instance.lauchdate,
      'status': instance.status,
      'tag': instance.tag,
      'catalog': instance.catalog
    };

String _$TaskToSendMessage(Task instance) {
  return '''
      {
            "principal": "${instance.principal}",
            "sponsor": "${instance.sponsor}",
            "title": "${instance.title}",
            "content": "${instance.content}",
            "deadline": "${instance.deadline}",
            "lauchdate": "${instance.lauchdate}",
            "status": ${instance.status} 
      }
    ''';
}
