import 'package:circuit_superintendent_tool/components/congregation_card_widget.dart';
import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:flutter/material.dart';

class CongregationPage extends StatefulWidget {
  const CongregationPage({super.key});

  @override
  State<CongregationPage> createState() => _CongregationPageState();
}

class _CongregationPageState extends State<CongregationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: AppSpacing.x24),
            CongregationCardWidget(
              congregationName: 'Fazenda Olhos d`água',
              congregationCity: 'Biritinga',
              lastVisit: '16/06/2024',
              nextVisit: '26/10/2025',
              attendingMeetingsWeekends: 30,
              attendingMeetingsWeekDay: 30,
              elders: 10,
              servants: 2,
              pioneers: 30,
            ),
          ],
        )),
      ),
    );
  }
}
