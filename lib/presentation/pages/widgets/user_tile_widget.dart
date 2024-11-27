import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';

class UserTileWidget extends StatelessWidget {
  final String name;
  final String position;
  final String admissionDate;
  final String phone;
  final String image;

  const UserTileWidget({
    super.key,
    required this.name,
    required this.position,
    required this.admissionDate,
    required this.phone,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.all(AppSpaces.md),
        tilePadding: const EdgeInsets.all(AppSpaces.md),
        leading: CircleAvatar(
          radius: AppSpaces.xl,
          backgroundImage: NetworkImage(image),
        ),
        title: Text(name, style: Theme.of(context).textTheme.displaySmall),
        trailing: const Icon(
          Icons.expand_more,
          size: AppSpaces.xl,
          color: AppColors.bluePrimary,
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRow(
                label: 'Cargo',
                value: position,
                context: context,
              ),
              _buildRow(
                label: 'Data de admissão',
                value: admissionDate,
                context: context,
              ),
              _buildRow(
                label: 'Telefone',
                value: phone,
                context: context,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow({
    required BuildContext context,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpaces.xxs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.displayMedium),
          Text(value, style: Theme.of(context).textTheme.displaySmall),
        ],
      ),
    );
  }
}
