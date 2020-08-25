// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    category: json['category'] as String,
    type: json['type'] as String,
    difficulty: _$enumDecodeNullable(_$DifficultyEnumMap, json['difficulty']),
    question: json['question'] as String,
    correct_answer: json['correct_answer'] as String,
    incorrect_answers:
        (json['incorrect_answers'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'category': instance.category,
      'type': instance.type,
      'difficulty': _$DifficultyEnumMap[instance.difficulty],
      'question': instance.question,
      'correct_answer': instance.correct_answer,
      'incorrect_answers': instance.incorrect_answers,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$DifficultyEnumMap = {
  Difficulty.Easy: 'easy',
  Difficulty.Medium: 'medium',
  Difficulty.Hard: 'hard',
};
