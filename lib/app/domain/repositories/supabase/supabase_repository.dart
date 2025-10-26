import '../../../core/defs/type_defs.dart';
import '../../models/supabase/failure/supabase_failure.dart';
import '../../models/supabase/success/supabase_success.dart';

abstract class SupabaseRepository {
  FutureEither<SupabaseFailure, SupabaseSuccess> initialize();
}
