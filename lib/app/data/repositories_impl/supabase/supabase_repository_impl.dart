import '../../../core/defs/type_defs.dart';
import '../../../domain/models/supabase/failure/supabase_failure.dart';
import '../../../domain/models/supabase/success/supabase_success.dart';
import '../../source/providers/supabase/supabase_provider.dart';
import '../../../domain/repositories/supabase/supabase_repository.dart';

class SupabaseRepositoryImpl extends SupabaseRepository {
  SupabaseRepositoryImpl({required SupabaseProvider supabaseProvider})
    : _supabaseProvider = supabaseProvider;
  final SupabaseProvider _supabaseProvider;

  @override
  FutureEither<SupabaseFailure, SupabaseSuccess> initialize() async {
    return await _supabaseProvider.initialize();
  }
}
