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
        'Erro de conexão. Verifique sua internet e tente novamente.',
        <EmployeeEntity>[]
      );
    } on BadResponseException catch (_) {
      return (
        'Erro no servidor. Tente novamente mais tarde.',
        <EmployeeEntity>[]
      );
    } catch (_) {
      return (
        'Erro desconhecido. Por favor, entre em contato com o suporte.',
        <EmployeeEntity>[]
      );
    }
  }
}
