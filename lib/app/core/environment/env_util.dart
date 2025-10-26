import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../extensions/flavor_ext.dart';
import 'environment_files.dart';

/// Clas para obtener desde el .env sus atributos
abstract class EnvUtil {
  EnvUtil._();

  static String get supabaseUrl => dotenv.get('SUPABASE_URL');
  static String get supabaseAnonKey => dotenv.get('SUPABASE_ANONKEY');

  static Future<void> loadEnv(AppFlavor appFlavor) async {
    String fileName;

    switch (appFlavor) {
      case AppFlavor.production:
        fileName = EnvironmentFiles.prodName;
        break;
      case AppFlavor.development:
        fileName = EnvironmentFiles.devName;
        break;
      case AppFlavor.qa:
        fileName = EnvironmentFiles.qaName;
        break;
      default:
        fileName = EnvironmentFiles.devName;
    }

    await dotenv.load(fileName: fileName);
  }
}
