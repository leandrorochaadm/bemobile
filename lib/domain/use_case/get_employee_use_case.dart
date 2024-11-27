import '../../core/exceptions.dart';
import '../entities/employee_entity.dart';
import '../repositories/employee_repository.dart';

class GetEmployeesUseCase {
  final EmployeeRepository repository;

  GetEmployeesUseCase(this.repository);

  Future<(String?, List<EmployeeEntity>)> call() async {
    try {
      final employees = await repository.getEmployees();
      return (null, employees);
    } on ConnectionException catch (_) {
      return (
        'Erro na conexão.\nVerifique sua internet e tente novamente.',
        <EmployeeEntity>[]
      );
    } on BadResponseException catch (_) {
      return (
        'Erro no servidor.\nTente novamente mais tarde.',
        <EmployeeEntity>[]
      );
    } catch (_) {
      return (
        'Erro desconhecido.\nPor favor, entre em contato com o suporte.',
        <EmployeeEntity>[]
      );
    }
  }
}
