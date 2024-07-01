import 'package:circuit_superintendent_tool/core/theme/app_colors.dart';
import 'package:circuit_superintendent_tool/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppDialog {
  final String title;
  final bool critAction;
  final String confirmText;
  final void Function(BuildContext context)? onConfirm;
  final String cancelText;
  final void Function(BuildContext context)? onCancel;
  AppDialog({required this.title, required this.cancelText, this.onCancel, required this.confirmText, this.onConfirm, this.critAction = false});

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: [],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: onCancel != null ? () => onCancel!(context) : null,
                  child: Text(cancelText, style: AppTextTheme.bodyLarge.copyWith(color: critAction ? AppColors.primary600 : AppColors.error400)),
                ),
                TextButton(
                  onPressed: onConfirm != null ? () => onConfirm!(context) : null,
                  child: Text(confirmText, style: AppTextTheme.bodyLarge.copyWith(color: critAction ? AppColors.error400 : AppColors.primary600)),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
