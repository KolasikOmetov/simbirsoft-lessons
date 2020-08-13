import 'package:json_annotation/json_annotation.dart';
part 'result.g.dart';

@JsonSerializable()
class Result {
  String category;
  String type;
  String difficulty;
  String question;
  String correct_answer;
  List<String> incorrect_answers;

  Result(
      {this.category,
      this.type,
      this.difficulty,
      this.question,
      this.correct_answer,
      this.incorrect_answers});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
