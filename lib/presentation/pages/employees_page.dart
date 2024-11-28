import 'package:bemobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../notifiers/employee_notifier.dart';
import 'widgets/widgets.dart';

class EmployeesPage extends StatelessWidget {
  final EmployeeNotifier employeeNotifier;

  EmployeesPage({super.key, required this.employeeNotifier}) {
    employeeNotifier.fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpaces.md),
          child: Column(
            children: [
              Container(
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      child: Text('CG'),
                      backgroundColor: AppColors.gray05,
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.add_alert)),
                  ],
                ),
              ),
              const SizedBox(height: AppSpaces.lg),
              Row(
                children: [
                  Text(
                    'Funcionários',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
              const SizedBox(height: AppSpaces.md),
              FieldSearchWidget(employeeNotifier: employeeNotifier),
              const SizedBox(height: AppSpaces.lg),
              EmployeeTable(employeeNotifier: employeeNotifier),
            ],
          ),
        ),
      ),
    );
  }
}
