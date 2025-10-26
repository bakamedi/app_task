import '../../repositories/index_repositories.dart';

class OnInitSupabaseUseCase {
  OnInitSupabaseUseCase({required SupabaseRepository supabaseRepository})
    : _supabaseRepository = supabaseRepository;

  final SupabaseRepository _supabaseRepository;

  Future<void> call() async {
    await _supabaseRepository.initialize();
  }
}
