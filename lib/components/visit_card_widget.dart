import 'package:circuit_superintendent_tool/components/badges/privilege_badge_widget.dart';
import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/theme/app_text_theme.dart';
import 'package:circuit_superintendent_tool/core/theme/app_theme.dart';
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
    final theme = Theme.of(context).extension<AppCardTheme>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x24, vertical: AppSpacing.x12),
      child: Container(
        decoration: BoxDecoration(
            color: theme.backgroundColor,
            border: Border.all(color: theme.shadowColor.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(AppSpacing.x12),
            boxShadow: [BoxShadow(color: theme.shadowColor, blurRadius: AppSpacing.x4, spreadRadius: 0.5, offset: const Offset(2, 2))]),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.x16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('$congregationName - $congregationCity', style: AppTextTheme.titleLarge.copyWith(color: theme.textColor)),
            AppSpacing.spacingX4,
            Text('Última visita: $lastVisit', style: AppTextTheme.bodySmall.copyWith(color: theme.textColor)),
            AppSpacing.spacingX4,
            Text('Assistência às Reuniões:', style: AppTextTheme.labelLarge.copyWith(color: theme.textColor)),
            AppSpacing.spacingX4,
            Text('Meio de semana - $attendingMeetingsWeekDay', style: AppTextTheme.bodySmall.copyWith(color: theme.textColor)),
            AppSpacing.spacingX4,
            Text('Final de semana - $attendingMeetingsWeekends', style: AppTextTheme.bodySmall.copyWith(color: theme.textColor)),
            AppSpacing.spacingX12,
            Row(
              children: [
                PrivilegeBadgeWidget.elder(context, amount: elders),
                AppSpacing.spacingX12,
                PrivilegeBadgeWidget.servant(context, amount: servants),
                AppSpacing.spacingX12,
                PrivilegeBadgeWidget.pioneer(context, amount: pioneers),
              ],
            ),
            AppSpacing.spacingX12,
            Text('Próxima visita: $nextVisit', style: AppTextTheme.bodySmall.copyWith(color: theme.textColor)),
          ]),
        ),
      ),
    );
  }
}
