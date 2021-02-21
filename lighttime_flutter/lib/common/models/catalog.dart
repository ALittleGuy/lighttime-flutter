import 'package:json_annotation/json_annotation.dart';

part 'catalog.g.dart';

@JsonSerializable()
class Catalog {
    Catalog();

    num id;
    String user_id;
    String title;
    
    factory Catalog.fromJson(Map<String,dynamic> json) => _$CatalogFromJson(json);
    Map<String, dynamic> toJson() => _$CatalogToJson(this);
}
