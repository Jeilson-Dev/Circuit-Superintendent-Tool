import 'package:circuit_superintendent_tool/core/app_colors.dart';
import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/app_text_theme.dart';
import 'package:flutter/material.dart';

class PrivilegeBadgeWidget extends StatelessWidget {
  final Color color;
  final String label;
  final int value;
  const PrivilegeBadgeWidget._({required this.color, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 68,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppSpacing.x4)),
      child: Center(
        child: Text(
          '$label $value',
          textAlign: TextAlign.center,
          style: AppTextTheme.bodySmall.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  factory PrivilegeBadgeWidget.elder({required int value}) => PrivilegeBadgeWidget._(
        color: AppColors.elderBadge,
        label: 'AC -',
        value: value,
      );
  factory PrivilegeBadgeWidget.servant({required int value}) => PrivilegeBadgeWidget._(
        color: AppColors.servantBadge,
        label: 'SM -',
        value: value,
      );
  factory PrivilegeBadgeWidget.pioneer({required int value}) => PrivilegeBadgeWidget._(
        color: AppColors.pioneerBadge,
        label: 'PR -',
        value: value,
      );
}
