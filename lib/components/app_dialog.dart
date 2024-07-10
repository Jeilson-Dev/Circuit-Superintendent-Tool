import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/theme/app_colors.dart';
import 'package:circuit_superintendent_tool/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatefulWidget {
  const AppDialog({super.key, this.title, required this.content, this.verticalSizePercentage = 0.5});
  final String? title;
  final Widget content;
  final double verticalSizePercentage;

  @override
  State<AppDialog> createState() => _AppDialogState();
}

class _AppDialogState extends State<AppDialog> {
  @override
  Widget build(BuildContext context) {
    assert(widget.verticalSizePercentage < 0.9 && widget.verticalSizePercentage > 0.0);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.width * widget.verticalSizePercentage),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.x12),
        child: Material(
          child: Container(
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x8),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.x24),
                    child: AppTextTheme.titleLargeWidget(widget.title ?? ''),
                  ),
                  widget.content,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
