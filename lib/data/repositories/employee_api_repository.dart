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
      final response = await dio.get('/employees1');
      final data = response.data as List;
      return data.map<EmployeeEntity>((e) {
        return EmployeeModel.fromJson(e).toEntity();
      }).toList();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw ConnectionException('Failed to connect to the server.');
      }
      if (e.type == DioExceptionType.badResponse) {
        throw BadResponseException(
            'Received invalid response: ${e.response?.statusCode}');
      }
      throw UnknownApiException('An unknown Dio error occurred: ${e.message}');
    } catch (e) {
      throw UnknownApiException('Failed to load employees: $e');
    }
  }
}
