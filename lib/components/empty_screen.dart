import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/theme/app_text_theme.dart';
import 'package:circuit_superintendent_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyScreen extends StatelessWidget {
  final String message;
  const EmptyScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message, style: AppTextTheme.headlineSmall, textAlign: TextAlign.center),
              SizedBox(child: Lottie.asset(Assets.lotties.cat)),
            ],
          ),
        ),
      ),
    );
  }
}
