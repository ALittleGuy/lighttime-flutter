import 'package:json_annotation/json_annotation.dart';
import "task.dart";
part 'socketRequest.g.dart';

@JsonSerializable()
class SocketRequest {
    SocketRequest();

    Task data;
    String form;
    String to;
    num code;
    String timestamp;
    
    factory SocketRequest.fromJson(Map<String,dynamic> json) => _$SocketRequestFromJson(json);
    Map<String, dynamic> toJson() => _$SocketRequestToJson(this);
}
