import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions.dart';
import '../../domain/entities/employee_entity.dart';
import '../../domain/repositories/employee_repository.dart';
import '../models/employee_model.dart';

class EmployeeApiRepository implements EmployeeRepository {
  final Dio dio;

  EmployeeApiRepository(this.dio);

  @override
  Future<List<EmployeeEntity>> getEmployees() async {
    try {
      final response = await dio.get('/employees');
      final data = response.data as List;
      return data.map<EmployeeEntity>((e) {
        return EmployeeModel.fromJson(e).toEntity();
      }).toList();
    } on DioException catch (e, s) {
      log(e.toString(), stackTrace: s);

      if (e.type == DioExceptionType.badResponse) {
        throw BadResponseException(
            'Received invalid response: ${e.response?.statusCode}');
      }

      throw ConnectionException(
          'Failed to connect to the server. ${e.message}');
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw UnknownApiException('Failed to load employees: $e');
    }
  }
}
