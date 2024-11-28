import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../notifiers/employee_notifier.dart';
import 'employee_list_widget.dart';
import 'employee_table_head_widget.dart';

class EmployeeTable extends StatelessWidget {
  const EmployeeTable({
    super.key,
    required this.employeeNotifier,
  });

  final EmployeeNotifier employeeNotifier;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.gray10, width: 1.0),
          borderRadius: BorderRadius.circular(AppSpaces.xs),
        ),
        child: Column(
          children: [
            const EmployeeTableHeadWidget(),
            const Divider(color: AppColors.gray10, thickness: 1, height: 0),
            EmployeeListWidget(employeeNotifier: employeeNotifier),
          ],
        ),
      ),
    );
  }
}
