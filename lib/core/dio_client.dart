import 'package:dio/dio.dart';

import 'app_config.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(
          BaseOptions(
            // no terminal execute o comando `flutter run --dart-define=API_BASE_URL=http://endreço_IP_da_máquina:3000` ou a URL de outra api para rodar o projeto.
            baseUrl: AppConfig.baseUrl,
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
          ),
        );
  Dio get client => _dio;
}
