import 'package:flutter/material.dart';

import '../../domain/use_case/get_employee_use_case.dart';
import '../models_ui/employees_model_ui.dart';
import '../states/employee_state.dart';

class EmployeeNotifier extends ValueNotifier<EmployeeState> {
  final GetEmployeesUseCase getEmployeesUseCase;

  EmployeeNotifier(this.getEmployeesUseCase) : super(EmployeeInitialState());

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
}
