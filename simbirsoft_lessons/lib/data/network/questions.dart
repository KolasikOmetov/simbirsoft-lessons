import 'package:simbirsoft_lessons/data/network/result.dart';
import 'package:json_annotation/json_annotation.dart';
part 'questions.g.dart';

@JsonSerializable()
class Questions {
  int responseCode;
  List<Result> results;

  Questions({this.responseCode, this.results});

  factory Questions.fromJson(Map<String, dynamic> json) => _$QuestionsFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionsToJson(this);
}
