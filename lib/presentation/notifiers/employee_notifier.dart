import 'package:bemobile/domain/entities/employee_entity.dart';
import 'package:flutter/material.dart';

import '../../domain/use_case/get_employee_use_case.dart';
import '../models_ui/employees_model_ui.dart';
import '../states/employee_state.dart';

class EmployeeNotifier extends ValueNotifier<EmployeeState> {
  final GetEmployeesUseCase getEmployeesUseCase;

  EmployeeNotifier(this.getEmployeesUseCase) : super(EmployeeInitialState());

  final searchController = TextEditingController();

  Future<void> fetchEmployees() async {
    value = EmployeeLoadingState();

    final (error, employees) = await getEmployeesUseCase();

    if (error != null) {
      value = EmployeeErrorState(error);
      return;
    }

    if (employees.isEmpty) {
      value = EmployeeEmptyState();
      return;
    }

    List<EmployeeModelUI> employeesFormatted =
        _formatEmployeesToModelUI(employees);

    value = EmployeeLoadedState(employeesFormatted);
  }

  List<EmployeeModelUI> _formatEmployeesToModelUI(
      List<EmployeeEntity> employees) {
    final employeesFormatted =
        employees.map((entity) => EmployeeModelUI.fromEntity(entity)).toList();
    return employeesFormatted;
  }

  Future<void> searchEmployees(String query) async {
    if (query.isEmpty) {
      await fetchEmployees();
      return;
    }

    final (error, employees) = await getEmployeesUseCase();
    if (error != null) {
      value = EmployeeErrorState(error);
      return;
    }

    // Filtra os funcionários com base em nome, cargo ou telefone
    final filteredEmployees = employees.where((employee) {
      final lowerQuery = query.toLowerCase();

      return employee.name.toLowerCase().contains(lowerQuery) ||
          employee.job.toLowerCase().contains(lowerQuery) ||
          employee.phone.toLowerCase().contains(lowerQuery);
    }).toList();

    // Caso não encontre resultados
    if (filteredEmployees.isEmpty) {
      value = EmployeeEmptyState();
      return;
    }

    List<EmployeeModelUI> employeesFormatted =
        _formatEmployeesToModelUI(filteredEmployees);

    // Atualiza o estado com os resultados filtrados
    value = EmployeeLoadedState(employeesFormatted);
  }

  void clearSearch() {
    fetchEmployees();
    searchController.clear();
  }
}
