import 'package:circuit_superintendent_tool/core/core.dart';

class PrivilegeBadgeWidget extends StatelessWidget {
  final Color color;
  final String label;
  const PrivilegeBadgeWidget._({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 68,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppSpacing.x4)),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: AppTextTheme.bodySmall.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  factory PrivilegeBadgeWidget.elder(BuildContext context, {required int amount}) => PrivilegeBadgeWidget._(
        color: AppColors.elderBadge,
        label: AppLocalizations.of(context)!.privilegeBadgeElderAbbreviation(amount),
      );
  factory PrivilegeBadgeWidget.servant(BuildContext context, {required int amount}) => PrivilegeBadgeWidget._(
        color: AppColors.servantBadge,
        label: AppLocalizations.of(context)!.privilegeBadgeServantAbbreviation(amount),
      );
  factory PrivilegeBadgeWidget.pioneer(BuildContext context, {required int amount}) => PrivilegeBadgeWidget._(
        color: AppColors.pioneerBadge,
        label: AppLocalizations.of(context)!.privilegeBadgePioneerAbbreviation(amount),
      );
}
