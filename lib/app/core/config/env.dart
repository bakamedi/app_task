enum Environment { development, staging, production }

class Env {
  static final String _env = const String.fromEnvironment(
    'ENV',
    defaultValue: 'development',
  );

  static final Environment environment = _parseEnvironment();
  static final String storeName = _getStoreName();

  static Environment _parseEnvironment() {
    switch (_env) {
      case 'production':
        return Environment.production;
      case 'staging':
        return Environment.staging;
      case 'development':
      default:
        return Environment.development;
    }
  }

  static String _getStoreName() {
    switch (environment) {
      case Environment.production:
        return 'my_store_prod';
      case Environment.staging:
        return 'my_store_staging';
      case Environment.development:
        return 'my_store_dev';
    }
  }
}
