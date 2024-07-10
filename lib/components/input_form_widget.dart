import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/theme/app_text_theme.dart';
import 'package:circuit_superintendent_tool/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputFormWidget extends StatefulWidget {
  const InputFormWidget({
    super.key,
    required this.hintText,
    this.padding = const EdgeInsets.symmetric(vertical: 10),
    this.obscureText = false,
    this.controller,
    this.keyboardType,
    this.label,
    this.labelInLine = false,
    this.inputFormatters,
    this.onChanged,
    this.backgroundColor,
  });
  final String hintText;
  final String? label;
  final bool labelInLine;
  final EdgeInsets padding;
  final bool obscureText;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String value)? onChanged;

  @override
  State<InputFormWidget> createState() => InputFormWidgetState();
}

class InputFormWidgetState extends State<InputFormWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppCardTheme>()!;

    return Container(
      decoration: BoxDecoration(color: widget.backgroundColor ?? theme.backgroundColor),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.x8),
        child: Padding(
          padding: widget.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.label != null && !widget.labelInLine)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x4, vertical: AppSpacing.x8),
                  child: AppTextTheme.bodyMediumWidget(widget.label!, color: widget.backgroundColor == null ? theme.textColor.withOpacity(0.8) : null),
                ),
              Row(
                children: [
                  if (widget.label != null && widget.labelInLine) ...[
                    AppTextTheme.bodyMediumWidget(widget.label!, color: widget.backgroundColor == null ? theme.textColor.withOpacity(0.8) : null),
                    AppSpacing.spacingX8
                  ],
                  Expanded(
                    child: SizedBox(
                      height: AppSpacing.x44,
                      child: TextFormField(
                        inputFormatters: widget.inputFormatters,
                        keyboardType: widget.keyboardType,
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: widget.controller,
                        obscureText: widget.obscureText,
                        onChanged: widget.onChanged,
                        style: AppTextTheme.bodyMedium.copyWith(color: widget.backgroundColor == null ? theme.textColor : null),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppSpacing.x8),
                            borderSide: BorderSide(color: theme.textColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppSpacing.x8),
                            borderSide: BorderSide(color: theme.inputBorderColor),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.x12),
                          hintText: widget.hintText,
                          hintStyle: AppTextTheme.labelLarge.copyWith(color: widget.backgroundColor == null ? theme.textColor.withOpacity(0.3) : null),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppSpacing.x8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
