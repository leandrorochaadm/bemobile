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

    final employeesFormatted =
        employees.map((entity) => EmployeeModelUI.fromEntity(entity)).toList();

    value = EmployeeLoadedState(employeesFormatted);
  }

  Future<void> searchEmployees(String query) async {
    if (query.isEmpty) {
      await fetchEmployees();
      return;
    }

    // Verifica se o estado atual é EmployeeLoadedState
    if (value is EmployeeLoadedState) {
      // filtra os funcinários do estado atual
      final loadedState = value as EmployeeLoadedState;
      final filteredEmployees = loadedState.employees
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      // Atualiza o estado com os resultados filtrados
      value = EmployeeLoadedState(filteredEmployees);

      // Caso não encontre resultados
      if (filteredEmployees.isEmpty) {
        value = EmployeeEmptyState();
      }
    }
  }

  void clearSearch() {
    fetchEmployees();
    searchController.clear();
  }
}
