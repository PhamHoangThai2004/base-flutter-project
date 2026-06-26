enum Environment { development, production }

class AppConfig {
  static late Environment environment;

  static void initialize(Environment environment) {
    environment = environment;
  }

  static String get baseUrl => switch (environment) {
        Environment.development => 'https://api-dev.example.com',
        Environment.production => 'https://api-prod.example.com',
      };

  static String get appTitle => switch (environment) {
        Environment.development => 'App DEV',
        Environment.production => 'App PROD',
      };
}
