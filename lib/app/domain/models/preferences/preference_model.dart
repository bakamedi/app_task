// To parse this JSON data, do
//
//     final preference = preferenceFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'preference_model.freezed.dart';
part 'preference_model.g.dart';

Preference preferenceFromJson(String str) =>
    Preference.fromJson(json.decode(str));

String preferenceToJson(Preference data) => json.encode(data.toJson());

@freezed
abstract class Preference with _$Preference {
  const factory Preference({
    @JsonKey(name: "is_dark_mode") required bool isDarkMode,
  }) = _Preference;

  factory Preference.fromJson(Map<String, dynamic> json) =>
      _$PreferenceFromJson(json);

  static Preference empty() => const Preference(isDarkMode: false);
}
