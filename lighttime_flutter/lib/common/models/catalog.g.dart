// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Catalog _$CatalogFromJson(Map<String, dynamic> json) {
  return Catalog()
    ..id = json['id'] as num
    ..user_id = json['user_id'] as String
    ..title = json['title'] as String;
}

Map<String, dynamic> _$CatalogToJson(Catalog instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'title': instance.title
    };
