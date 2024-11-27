import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';
import '../notifiers/employee_notifier.dart';
import '../states/employee_state.dart';
import 'widgets/user_tile_widget.dart';

class EmployeesPage extends StatelessWidget {
  final EmployeeNotifier employeeNotifier;

  EmployeesPage({super.key, required this.employeeNotifier}) {
    employeeNotifier.fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Funcionários')),
      body: ValueListenableBuilder<EmployeeState>(
        valueListenable: employeeNotifier,
        builder: (context, state, _) {
          if (state is EmployeeInitialState) {
            return const Center(
                child: Text(
              'Nenhum funcionário encontrado',
              textAlign: TextAlign.center,
            ));
          } else if (state is EmployeeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is EmployeeLoadedState) {
            final employees = state.employees;
            return ListView.builder(
              itemCount: employees.length,
              padding: const EdgeInsets.all(AppSpaces.md),
              itemBuilder: (context, index) {
                final employee = employees[index];
                return UserTileWidget(
                  name: employee.name,
                  position: employee.job,
                  admissionDate: employee.admissionDate,
                  phone: employee.phone,
                  image: employee.image,
                );
              },
            );
          } else if (state is EmployeeErrorState) {
            final message = state.message;
            return Center(child: Text(message, textAlign: TextAlign.center));
          }
          return const Center(
            child: Text(
              'Erro inesperado, feche o app e abra novamente',
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
