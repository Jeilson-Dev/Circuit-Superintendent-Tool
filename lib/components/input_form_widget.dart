import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/theme/app_colors.dart';
import 'package:circuit_superintendent_tool/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class InputFormWidget extends StatefulWidget {
  const InputFormWidget({super.key, required this.hintText, this.padding = const EdgeInsets.symmetric(vertical: 10), this.obscureText = false, this.controller});
  final String hintText;
  final EdgeInsets padding;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  State<InputFormWidget> createState() => InputFormWidgetState();
}

class InputFormWidgetState extends State<InputFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: SizedBox(
        height: AppSpacing.x44,
        child: TextFormField(
          enableSuggestions: false,
          autocorrect: false,
          controller: widget.controller,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.x8),
              borderSide: BorderSide(color: AppColors.primary900),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.x12),
            hintText: widget.hintText,
            hintStyle: AppTextTheme.labelLarge.copyWith(color: AppColors.primary900),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.x8),
              borderSide: BorderSide(color: AppColors.primary900),
            ),
          ),
        ),
      ),
    );
  }
}
