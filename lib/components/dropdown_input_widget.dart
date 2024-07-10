import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/theme/app_text_theme.dart';
import 'package:circuit_superintendent_tool/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DropdownInputWidget<T> extends StatelessWidget {
  const DropdownInputWidget({
    super.key,
    this.onChanged,
    this.isExpanded = false,
    required this.value,
    required this.items,
    this.label,
    this.hint = '',
    this.backgroundColor,
  });
  final void Function(T?)? onChanged;
  final bool isExpanded;
  final T value;
  final String? label;
  final String hint;
  final Color? backgroundColor;
  final List<DropdownMenuItem<T>> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppCardTheme>()!;

    return Container(
      decoration: BoxDecoration(color: backgroundColor ?? theme.backgroundColor),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.x8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x4, vertical: AppSpacing.x8),
                child: AppTextTheme.bodyMediumWidget(label!, color: backgroundColor != null ? null : theme.textColor.withOpacity(0.8)),
              ),
            Container(
              height: AppSpacing.x44,
              decoration: BoxDecoration(border: Border.all(color: theme.inputBorderColor), borderRadius: BorderRadius.circular(AppSpacing.x8)),
              child: DropdownButton(
                hint: hint.isEmpty ? null : AppTextTheme.bodyMediumWidget(hint, color: backgroundColor != null ? null : theme.textColor.withOpacity(0.5)),
                underline: const SizedBox(),
                style: AppTextTheme.bodyMedium.copyWith(color: backgroundColor != null ? null : theme.textColor),
                dropdownColor: backgroundColor ?? theme.backgroundColor,
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.x8),
                isExpanded: isExpanded,
                value: value,
                items: items,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
