import 'package:bemobile/data/repositories/employee_api_repository.dart';

import '../domain/use_case/get_employee_use_case.dart';
import '../presentation/notifiers/employee_notifier.dart';
import 'dio_client.dart';

class AppDependencies {
  AppDependencies._();
  static DioClient createDioClient() => DioClient();
  static EmployeeApiRepository createEmployeeApiRepository() =>
      EmployeeApiRepository(createDioClient().client);
  static GetEmployeesUseCase createGetEmployeesUseCase() =>
      GetEmployeesUseCase(createEmployeeApiRepository());

  static EmployeeNotifier createEmployeeNotifier() =>
      EmployeeNotifier(createGetEmployeesUseCase());
}
