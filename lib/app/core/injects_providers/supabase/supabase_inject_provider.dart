import 'package:flutter_meedu/providers.dart';

import '../../../data/source/providers/supabase/supabase_provider.dart';

class SupabaseInjectProvider {
  SupabaseInjectProvider._();

  static final supabaseInjectProvider = Provider((ref) => SupabaseProvider());
}
