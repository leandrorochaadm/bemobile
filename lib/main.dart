import 'package:bemobile/presentation/pages/employee_page.dart';
import 'package:flutter/material.dart';

import 'core/service_locator.dart';
import 'presentation/notifiers/employee_notifier.dart';

void main() {
  setupServiceLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EmployeesPage(employeeNotifier: sl<EmployeeNotifier>()),
    );
  }
}
