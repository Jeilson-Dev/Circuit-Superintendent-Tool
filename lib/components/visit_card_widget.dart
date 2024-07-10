import 'package:circuit_superintendent_tool/core/core.dart';
import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
import 'package:circuit_superintendent_tool/dto/visit_dto.dart';

class VisitCardWidget extends StatelessWidget {
  final VisitDTO visit;
  final CongregationDTO congregation;

  const VisitCardWidget({super.key, required this.visit, required this.congregation});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppCardTheme>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x8, vertical: AppSpacing.x12),
      child: Container(
        decoration: BoxDecoration(
            color: theme.backgroundColor,
            border: Border.all(color: theme.shadowColor.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(AppSpacing.x12),
            boxShadow: [BoxShadow(color: theme.shadowColor, blurRadius: AppSpacing.x4, spreadRadius: 0.5, offset: const Offset(2, 2))]),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.x16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('${congregation.name} - ${congregation.city}', style: AppTextTheme.titleLarge.copyWith(color: theme.textColor)),
            AppSpacing.spacingX4,
            Text(AppLocalizations.of(context)!.visitCardWidgetLastVisit(visit.lastVisit), style: AppTextTheme.bodySmall.copyWith(color: theme.textColor)),
            AppSpacing.spacingX4,
            Text(AppLocalizations.of(context)!.visitCardWidgetMeetingsAttendance, style: AppTextTheme.labelLarge.copyWith(color: theme.textColor)),
            AppSpacing.spacingX4,
            Text(
              AppLocalizations.of(context)!.visitCardWidgetMeedWeekAttendance(visit.midWeekAssistance.toString()),
              style: AppTextTheme.bodySmall.copyWith(color: theme.textColor),
            ),
            AppSpacing.spacingX4,
            Text(
              AppLocalizations.of(context)!.visitCardWidgetWeekendAttendance(visit.weekendAssistance.toString()),
              style: AppTextTheme.bodySmall.copyWith(color: theme.textColor),
            ),
            AppSpacing.spacingX4,
            Text(
              AppLocalizations.of(context)!.visitCardWidgetPublishers(visit.publishersOnCongregation.toString()),
              style: AppTextTheme.bodySmall.copyWith(color: theme.textColor),
            ),
            AppSpacing.spacingX12,
            Row(
              children: [
                PrivilegeBadgeWidget.elder(context, amount: 0),
                AppSpacing.spacingX12,
                PrivilegeBadgeWidget.servant(context, amount: 0),
                AppSpacing.spacingX12,
                PrivilegeBadgeWidget.pioneer(context, amount: 0),
              ],
            ),
            // AppSpacing.spacingX12,
            // Text('Próxima visita: $', style: AppTextTheme.bodySmall.copyWith(color: theme.textColor)),
          ]),
        ),
      ),
    );
  }
}
