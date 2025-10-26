import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/environment/env_util.dart';

class SupabaseProvider {
  late final SupabaseClient supabase;

  Future<void> initialize() async {
    await Supabase.initialize(
      url: EnvUtil.supabaseUrl,
      anonKey: EnvUtil.supabaseAnonKey,
    );

    supabase = Supabase.instance.client;
  }
}
