import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

@JsonSerializable()
class Status {
    Status();

    num id;
    String title;
    
    factory Status.fromJson(Map<String,dynamic> json) => _$StatusFromJson(json);
    Map<String, dynamic> toJson() => _$StatusToJson(this);
}
