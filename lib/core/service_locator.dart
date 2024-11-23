import 'package:get_it/get_it.dart';

import '../data/repositories/employee_api_repository.dart';
import '../domain/repositories/employee_repository.dart';
import '../domain/use_case/get_employee_use_case.dart';
import '../presentation/notifiers/employee_notifier.dart';
import 'dio_client.dart';

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton(() => DioClient());

  sl.registerLazySingleton<EmployeeRepository>(
      () => EmployeeApiRepository(sl<DioClient>().client));

  sl.registerLazySingleton(() => GetEmployeesUseCase(sl<EmployeeRepository>()));

  sl.registerFactory(() => EmployeeNotifier(sl<GetEmployeesUseCase>()));
}
