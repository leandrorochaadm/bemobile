import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';

class AppBarCustomWidget extends StatelessWidget {
  const AppBarCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundColor: AppColors.gray05,
          child: Text('CG'),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            const Icon(
              Icons.notifications_outlined,
              size: AppSpaces.xl,
              color: AppColors.black,
            ),
            Positioned(
              right: 1.0,
              top: -2.0,
              child: Container(
                padding: const EdgeInsets.all(AppSpaces.xxs),
                decoration: const BoxDecoration(
                  color: AppColors.bluePrimary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '02',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: AppColors.white, fontSize: AppSpaces.xs),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
