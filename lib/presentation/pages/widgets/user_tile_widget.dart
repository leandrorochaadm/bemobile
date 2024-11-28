import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';
import 'dashed_line_widget.dart';

class UserTileWidget extends StatefulWidget {
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
  State<UserTileWidget> createState() => _UserTileWidgetState();
}

bool isExpanded = false;

class _UserTileWidgetState extends State<UserTileWidget> {
  @override
  Widget build(BuildContext context) {
    var lineWidget = const DashedLineWidget(
      color: AppColors.gray10,
      dashWidth: 4,
      dashSpace: 2,
      thickness: 1,
      length: double.infinity,
    );
    return ExpansionTile(
      childrenPadding: const EdgeInsets.all(AppSpaces.md),
      tilePadding: const EdgeInsets.all(AppSpaces.sm),
      shape: const RoundedRectangleBorder(),
      onExpansionChanged: (value) {
        setState(() {
          isExpanded = value;
        });
      },
      leading: CircleAvatar(
        radius: AppSpaces.xl,
        backgroundImage: NetworkImage(widget.image),
      ),
      title: Text(widget.name, style: Theme.of(context).textTheme.displaySmall),
      trailing: Icon(
        isExpanded ? Icons.expand_less : Icons.expand_more,
        size: AppSpaces.xl,
        color: AppColors.bluePrimary,
      ),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpaces.md),
            _buildRow(
              label: 'Cargo',
              value: widget.position,
              context: context,
            ),
            lineWidget,
            const SizedBox(height: AppSpaces.md),
            _buildRow(
              label: 'Data de admissão',
              value: widget.admissionDate,
              context: context,
            ),
            lineWidget,
            const SizedBox(height: AppSpaces.md),
            _buildRow(
              label: 'Telefone',
              value: widget.phone,
              context: context,
            ),
            lineWidget,
            const SizedBox(height: AppSpaces.md),
          ],
        ),
      ],
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
