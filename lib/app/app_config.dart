enum Environment { dev, staging, prod }

extension XEnvironment on Environment {
  bool get isProd => this == Environment.prod;

  bool get isStaging => this == Environment.staging;

  bool get isDev => this == Environment.dev;
}

class AppConfig {
  static Environment environment = Environment.dev;
  late String baseUrl;
  static String mapsApiKey = '';
  static String firebaseClientId = "100784575969-jfogo2632jtba0hrgenmj5vud1qibauk.apps.googleusercontent.com";
  bool mock;

  AppConfig.dev({this.mock = false}) {
    environment = Environment.dev;
    baseUrl = 'https://marketplace-dev.mealplanet.com';
  }

  AppConfig.staging({this.mock = false}) {
    environment = Environment.staging;
    baseUrl = 'https://marketplace-dev.mealplanet.com';
  }

  AppConfig.prod({this.mock = false}) {
    environment = Environment.prod;
    baseUrl = 'https://marketplace-dev.mealplanet.com';
  }
}
