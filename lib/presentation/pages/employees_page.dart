import 'package:flutter/material.dart';

import '../notifiers/employee_notifier.dart';
import 'widgets/widgets.dart';

class EmployeesPage extends StatelessWidget {
  final EmployeeNotifier employeeNotifier;

  EmployeesPage({super.key, required this.employeeNotifier}) {
    employeeNotifier.fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Funcionários')),
      body: EmployeeTable(employeeNotifier: employeeNotifier),
    );
  }
}
