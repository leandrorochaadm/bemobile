import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../notifiers/employee_notifier.dart';
import '../../states/employee_state.dart';
import 'user_tile_widget.dart';

class EmployeeListWidget extends StatelessWidget {
  const EmployeeListWidget({
    super.key,
    required this.employeeNotifier,
  });

  final EmployeeNotifier employeeNotifier;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder<EmployeeState>(
        valueListenable: employeeNotifier,
        builder: (context, state, _) {
          if (state is EmployeeErrorState) {
            return Center(
                child: Text(state.message, textAlign: TextAlign.center));
          }

          if (state is EmployeeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is EmployeeEmptyState) {
            return const Center(
                child: Text(
              'Nenhum funcionário encontrado com o nome pesquisado',
              textAlign: TextAlign.center,
            ));
          }

          if (state is EmployeeLoadedState) {
            final employees = state.employees;
            return ListView.separated(
              itemCount: employees.length,
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) => const Divider(
                color: AppColors.gray10,
                thickness: 1,
                height: 0,
              ),
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
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
