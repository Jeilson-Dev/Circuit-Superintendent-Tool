import 'package:circuit_superintendent_tool/components/badges/privilege_badge_widget.dart';
import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/theme/app_colors.dart';
import 'package:circuit_superintendent_tool/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class VisitCardWidget extends StatelessWidget {
  final String congregationName;
  final String congregationCity;
  final String lastVisit;
  final String nextVisit;
  final int attendingMeetingsWeekends;
  final int attendingMeetingsWeekDay;
  final int elders;
  final int servants;
  final int pioneers;

  const VisitCardWidget({
    super.key,
    required this.congregationName,
    required this.congregationCity,
    required this.lastVisit,
    required this.nextVisit,
    required this.attendingMeetingsWeekends,
    required this.attendingMeetingsWeekDay,
    required this.elders,
    required this.servants,
    required this.pioneers,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x24, vertical: AppSpacing.x12),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSpacing.x12),
            boxShadow: [BoxShadow(color: AppColors.gray400, blurRadius: AppSpacing.x4, spreadRadius: 0.5, offset: Offset(2, 2))]),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.x16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('$congregationName - $congregationCity', style: AppTextTheme.titleLarge),
            AppSpacing.spacingX4,
            Text('Última visita: $lastVisit', style: AppTextTheme.bodySmall),
            AppSpacing.spacingX4,
            Text('Assistência às Reuniões:', style: AppTextTheme.labelLarge),
            AppSpacing.spacingX4,
            Text('Meio de semana - $attendingMeetingsWeekDay', style: AppTextTheme.bodySmall.copyWith(color: AppColors.gray600)),
            AppSpacing.spacingX4,
            Text('Final de semana - $attendingMeetingsWeekends', style: AppTextTheme.bodySmall.copyWith(color: AppColors.gray600)),
            AppSpacing.spacingX12,
            Row(
              children: [
                PrivilegeBadgeWidget.elder(value: elders),
                AppSpacing.spacingX12,
                PrivilegeBadgeWidget.servant(value: servants),
                AppSpacing.spacingX12,
                PrivilegeBadgeWidget.pioneer(value: pioneers),
              ],
            ),
            AppSpacing.spacingX12,
            Text('Próxima visita: $nextVisit', style: AppTextTheme.bodySmall.copyWith(color: AppColors.gray500)),
          ]),
        ),
      ),
    );
  }
}
