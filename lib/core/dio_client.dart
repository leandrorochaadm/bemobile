import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(BaseOptions(
          // define o endereço base da API
          baseUrl: 'http://192.168.1.105:3000',
          // baseUrl: 'http://localhost:3000',
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ));

  Dio get client => _dio;
}
