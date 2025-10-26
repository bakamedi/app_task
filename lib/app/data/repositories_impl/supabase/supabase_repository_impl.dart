import '../../source/providers/supabase/supabase_provider.dart';
import '../../../domain/repositories/supabase/supabase_repository.dart';

class SupabaseRepositoryImpl extends SupabaseRepository {
  SupabaseRepositoryImpl({required SupabaseProvider supabaseProvider})
    : _supabaseProvider = supabaseProvider;
  final SupabaseProvider _supabaseProvider;

  @override
  Future<void> initialize() async {
    await _supabaseProvider.initialize();
  }
}
