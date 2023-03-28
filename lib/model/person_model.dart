import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_model.freezed.dart';
part 'person_model.g.dart';

@freezed
class Person with _$Person {
  const factory Person({
    required int id,
    required String email,
    required String first_name,
    required String last_name,
    required String avatar,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
