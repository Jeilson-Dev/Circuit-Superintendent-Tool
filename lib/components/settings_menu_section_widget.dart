import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class SectionSettingsMenuWidget extends StatelessWidget {
  final String title;
  final String? legend;
  final Widget content;
  const SectionSettingsMenuWidget({super.key, required this.title, required this.content, this.legend});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.x12),
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          border: Border.all(color: theme.appBarTheme.actionsIconTheme!.color!.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(AppSpacing.x12),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor,
              blurRadius: AppSpacing.x4,
              spreadRadius: 0.5,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.x12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextTheme.titleLarge.copyWith(color: theme.appBarTheme.titleTextStyle!.color)),
              if (legend != null) Text(legend!, style: AppTextTheme.bodySmall.copyWith(color: theme.appBarTheme.titleTextStyle!.color!.withOpacity(0.5))),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.x16),
                child: content,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
