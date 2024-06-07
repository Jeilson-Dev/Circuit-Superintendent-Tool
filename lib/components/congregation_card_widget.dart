import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/theme/app_colors.dart';
import 'package:circuit_superintendent_tool/core/theme/app_text_theme.dart';
import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
import 'package:flutter/material.dart';

class CongregationCardWidget extends StatelessWidget {
  final CongregationDTO congregation;

  const CongregationCardWidget({super.key, required this.congregation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x24, vertical: AppSpacing.x12),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSpacing.x12),
            boxShadow: [BoxShadow(color: AppColors.gray400, blurRadius: AppSpacing.x4, spreadRadius: 0.5, offset: Offset(2, 2))]),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.x16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(congregation.name, style: AppTextTheme.titleLarge),
                AppSpacing.spacingX4,
                Text(congregation.city, style: AppTextTheme.bodySmall),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
