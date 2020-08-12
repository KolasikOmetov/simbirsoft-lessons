import 'package:json_annotation/json_annotation.dart';
part 'result.g.dart';

@JsonSerializable(nullable: false)
class Result {
  String category;
  String type;
  String difficulty;
  String question;
  String correctAnswer;
  List<String> incorrectAnswers;

  Result(
      {this.category,
      this.type,
      this.difficulty,
      this.question,
      this.correctAnswer,
      this.incorrectAnswers});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
