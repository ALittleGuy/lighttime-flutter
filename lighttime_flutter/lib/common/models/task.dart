import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  Task();

  num id;
  String principal;
  String sponsor;
  String title;
  String content;
  String deadline;
  String lauchdate;
  num status;
  String tag;
  num catalog;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);

  String toSendMessage() => _$TaskToSendMessage(this);
}
