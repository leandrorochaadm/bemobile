import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';
import '../../notifiers/employee_notifier.dart';

class FieldSearchWidget extends StatefulWidget {
  const FieldSearchWidget({
    super.key,
    required this.employeeNotifier,
  });

  final EmployeeNotifier employeeNotifier;

  @override
  State<FieldSearchWidget> createState() => _FieldSearchWidgetState();
}

class _FieldSearchWidgetState extends State<FieldSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.employeeNotifier.searchController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: widget.employeeNotifier.searchController.text.isEmpty
            ? null
            : IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    widget.employeeNotifier.clearSearch();
                  });
                }),
        hintText: 'Pesquisar',
        hintStyle: Theme.of(context).textTheme.displaySmall,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(AppSpaces.xxxxxl),
        ),
        filled: true,
        fillColor: AppColors.gray05,
        contentPadding: const EdgeInsets.symmetric(
          vertical: AppSpaces.xs,
          horizontal: AppSpaces.md,
        ),
      ),
      textInputAction: TextInputAction.search,
      style: Theme.of(context).textTheme.displaySmall,
      onSubmitted: (value) {
        setState(() {
          widget.employeeNotifier.searchEmployees(value);
        });
      },
    );
  }
}
