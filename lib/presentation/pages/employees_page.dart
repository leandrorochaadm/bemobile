import 'package:flutter/material.dart';

import '../notifiers/employee_notifier.dart';
import '../states/employee_state.dart';

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
            return const Center(child: Text('Nenhum funcionário encontrado'));
          } else if (state is EmployeeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is EmployeeLoadedState) {
            final employees = state.employees;
            return ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                final employee = employees[index];
                return ListTile(
                  leading: Image.network(employee.image),
                  title: Text(employee.name),
                  subtitle: Text(employee.job),
                );
              },
            );
          } else if (state is EmployeeErrorState) {
            final message = state.message;
            return Center(child: Text(message));
          }
          return const Center(
              child: Text('Erro inesperado, feche o app e abra novamente'));
        },
      ),
    );
  }
}
