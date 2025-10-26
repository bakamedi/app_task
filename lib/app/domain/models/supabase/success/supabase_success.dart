import 'package:freezed_annotation/freezed_annotation.dart';

part 'supabase_success.freezed.dart';

@freezed
class SupabaseSuccess with _$SupabaseSuccess {
  const factory SupabaseSuccess.ok() = _SupabaseOK;
  const factory SupabaseSuccess.online() = _SupabaseOnline;
}
