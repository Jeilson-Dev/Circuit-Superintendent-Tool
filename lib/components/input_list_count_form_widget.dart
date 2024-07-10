import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/theme/app_text_theme.dart';
import 'package:circuit_superintendent_tool/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputListCountFormWidget extends StatefulWidget {
  const InputListCountFormWidget({
    super.key,
    required this.hintText,
    this.padding = const EdgeInsets.symmetric(vertical: 10),
    this.obscureText = false,
    this.controller,
    this.label,
    this.labelInLine = false,
    this.displayCounter = false,
    this.inputFormatters,
    this.onChanged,
  });
  final String hintText;
  final String? label;
  final bool labelInLine;
  final EdgeInsets padding;
  final bool obscureText;
  final bool displayCounter;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String value)? onChanged;

  @override
  State<InputListCountFormWidget> createState() => InputListCountFormWidgetState();
}

class InputListCountFormWidgetState extends State<InputListCountFormWidget> {
  int get itemsCounter => calculateItemsCounter(widget.controller?.text ?? '');

  bool get _displayCounter {
    final hasController = widget.controller != null;
    if (!hasController) return false;

    return hasController && widget.displayCounter;
  }

  int calculateItemsCounter(String value) {
    if (widget.controller == null || !widget.displayCounter || value.trim().isEmpty) return 0;

    return value.trim().split('\n').length;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppCardTheme>()!;

    return Container(
      decoration: BoxDecoration(color: theme.backgroundColor),
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
                  child: Row(
                    children: [
                      AppTextTheme.bodyMediumWidget(widget.label!, color: theme.textColor.withOpacity(0.8)),
                      if (_displayCounter) AppTextTheme.bodyMediumWidget('($itemsCounter)', color: theme.textColor.withOpacity(0.8)),
                    ],
                  ),
                ),
              Row(
                children: [
                  if (widget.label != null && widget.labelInLine) ...[
                    AppTextTheme.bodyMediumWidget(widget.label!, color: theme.textColor.withOpacity(0.8)),
                    if (_displayCounter) AppTextTheme.bodyMediumWidget('($itemsCounter)', color: theme.textColor.withOpacity(0.8)),
                    AppSpacing.spacingX8
                  ],
                  Expanded(
                    child: TextFormField(
                      maxLines: null,
                      inputFormatters: widget.inputFormatters,
                      keyboardType: TextInputType.multiline,
                      enableSuggestions: false,
                      autocorrect: false,
                      minLines: 3,
                      controller: widget.controller,
                      obscureText: widget.obscureText,
                      onChanged: (value) => setState(() {
                        if (widget.onChanged != null) widget.onChanged!(value);
                      }),
                      style: AppTextTheme.bodyMedium.copyWith(color: theme.textColor),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSpacing.x8),
                          borderSide: BorderSide(color: theme.textColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSpacing.x8),
                          borderSide: BorderSide(
                            color: theme.inputBorderColor,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.x12, vertical: AppSpacing.x8),
                        hintText: widget.hintText,
                        hintStyle: AppTextTheme.labelLarge.copyWith(color: theme.textColor.withOpacity(0.3)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSpacing.x8),
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
