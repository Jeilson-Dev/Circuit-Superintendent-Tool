import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/localizations.dart';
import 'package:circuit_superintendent_tool/core/theme/app_colors.dart';
import 'package:circuit_superintendent_tool/core/theme/app_text_theme.dart';
import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
import 'package:flutter/material.dart';

class CongregationCardWidget extends StatefulWidget {
  final CongregationDTO congregation;
  final void Function() onDelete;
  final void Function() onEdit;

  const CongregationCardWidget({super.key, required this.congregation, required this.onDelete, required this.onEdit});

  @override
  State<CongregationCardWidget> createState() => _CongregationCardWidgetState();
}

class _CongregationCardWidgetState extends State<CongregationCardWidget> {
  bool displayDelete = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x24, vertical: AppSpacing.x12),
      child: GestureDetector(
        onTap: displayDelete ? null : widget.onEdit,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSpacing.x12),
            boxShadow: [
              BoxShadow(color: AppColors.gray400, blurRadius: AppSpacing.x4, spreadRadius: 0.5, offset: const Offset(2, 2)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.x16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (displayDelete)
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Center(
                        child: Text(
                          maxLines: 2,
                          AppLocalizations.of(context)!.congregationCardConfirmDelete(widget.congregation.name),
                          style: AppTextTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      AppSpacing.spacingX4,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            child: Text(
                              AppLocalizations.of(context)!.congregationCardConfirmDeleteYes,
                              style: AppTextTheme.bodyMedium.copyWith(color: AppColors.error400),
                            ),
                            onPressed: () => widget.onDelete(),
                          ),
                          TextButton(
                            child: Text(
                              AppLocalizations.of(context)!.congregationCardConfirmDeleteNo,
                              style: AppTextTheme.bodyMedium.copyWith(color: AppColors.primary600),
                            ),
                            onPressed: () => setState(() => displayDelete = false),
                          ),
                        ],
                      )
                    ]),
                  ),
                if (!displayDelete)
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(widget.congregation.name, style: AppTextTheme.titleLarge, overflow: TextOverflow.ellipsis),
                      AppSpacing.spacingX4,
                      Text(widget.congregation.city, style: AppTextTheme.bodySmall, overflow: TextOverflow.ellipsis),
                    ]),
                  ),
                if (!displayDelete) IconButton(onPressed: () => setState(() => displayDelete = true), icon: Icon(Icons.delete, color: AppColors.error300))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
