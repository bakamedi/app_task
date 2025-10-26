import 'package:freezed_annotation/freezed_annotation.dart';

part 'supabase_failure.freezed.dart';

@freezed
class SupabaseFailure with _$SupabaseFailure {
  const factory SupabaseFailure.error() = _SupabaseFailure;
}
