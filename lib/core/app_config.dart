class AppConfig {
  AppConfig._();

  // terminal execute o comando `flutter run --dart-define=API_BASE_URL=http://endreço_IP_da_máquina:3000` ou a URL de outra api para rodar o projeto.
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:3000',
  );
}
