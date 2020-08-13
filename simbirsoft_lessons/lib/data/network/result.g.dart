// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    category: json['category'] as String,
    type: json['type'] as String,
    difficulty: json['difficulty'] as String,
    question: json['question'] as String,
    correct_answer: json['correct_answer'] as String,
    incorrect_answers:
        (json['incorrect_answers'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'category': instance.category,
      'type': instance.type,
      'difficulty': instance.difficulty,
      'question': instance.question,
      'correct_answer': instance.correct_answer,
      'incorrect_answers': instance.incorrect_answers,
    };
