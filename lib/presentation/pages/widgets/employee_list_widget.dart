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
