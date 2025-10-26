// supabase_provider.dart
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/defs/type_defs.dart';
import '../../../../core/environment/env_util.dart';
import '../../../../core/http/either/either.dart';
import '../../../../domain/models/supabase/failure/supabase_failure.dart';
import '../../../../domain/models/supabase/success/supabase_success.dart';

class SupabaseProvider {
  late final SupabaseClient supabase;

  FutureEither<SupabaseFailure, SupabaseSuccess> initialize() async {
    try {
      await Supabase.initialize(
        url: EnvUtil.supabaseUrl,
        anonKey: EnvUtil.supabaseAnonKey,
      );

      supabase = Supabase.instance.client;

      return Either.right(SupabaseSuccess.ok());
    } catch (e) {
      return Either.left(SupabaseFailure.error());
    }
  }
}
