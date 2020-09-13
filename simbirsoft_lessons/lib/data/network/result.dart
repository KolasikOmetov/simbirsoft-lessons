import 'package:json_annotation/json_annotation.dart';
part 'result.g.dart';

@JsonSerializable()
class Result {
  String category;
  String type;
  Difficulty difficulty;
  String question;
  // ignore: non_constant_identifier_names
  String correct_answer;
  // ignore: non_constant_identifier_names
  List<String> incorrect_answers;

  Result(
      {this.category,
      this.type,
      this.difficulty,
      this.question,
      // ignore: non_constant_identifier_names
      this.correct_answer,
      // ignore: non_constant_identifier_names
      this.incorrect_answers});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

enum Difficulty {Easy, Medium, Hard}
