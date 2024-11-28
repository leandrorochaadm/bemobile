import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';

class EmployeeTableHeadWidget extends StatelessWidget {
  const EmployeeTableHeadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blue10,
      padding: const EdgeInsets.all(AppSpaces.md),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'Foto',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
          const SizedBox(width: AppSpaces.xl),
          Expanded(
            flex: 9,
            child: Text(
              'Nome',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          const SizedBox(width: AppSpaces.xl),
          const Expanded(
              flex: 1,
              child: Icon(
                Icons.circle,
                color: AppColors.black,
                size: AppSpaces.xs,
              )),
        ],
      ),
    );
  }
}
