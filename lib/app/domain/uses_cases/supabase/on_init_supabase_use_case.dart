import '../../../core/defs/type_defs.dart';
import '../../models/supabase/failure/supabase_failure.dart';
import '../../models/supabase/success/supabase_success.dart';
import '../../repositories/index_repositories.dart';

class OnInitSupabaseUseCase {
  OnInitSupabaseUseCase({required SupabaseRepository supabaseRepository})
    : _supabaseRepository = supabaseRepository;

  final SupabaseRepository _supabaseRepository;

  FutureEither<SupabaseFailure, SupabaseSuccess> call() async {
    return await _supabaseRepository.initialize();
  }
}
