import 'package:circuit_superintendent_tool/components/congregation_card_widget.dart';
import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/inject.dart';
import 'package:circuit_superintendent_tool/core/theme/app_colors.dart';
import 'package:circuit_superintendent_tool/core/theme/app_text_theme.dart';
import 'package:circuit_superintendent_tool/features/congregations/congregations_cubit.dart';
import 'package:circuit_superintendent_tool/features/congregations/congregations_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CongregationPage extends StatefulWidget {
  const CongregationPage({super.key});
  static String get path => 'congregations';

  @override
  State<CongregationPage> createState() => _CongregationPageState();
}

class _CongregationPageState extends State<CongregationPage> {
  final congregationCubit = inject<CongregationsCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => congregationCubit.loadCongregations());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Congregações'),
          actions: [IconButton(onPressed: () => _showMyDialog(), icon: const Icon(Icons.add))],
        ),
        body: BlocBuilder<CongregationsCubit, CongregationsState>(
            bloc: congregationCubit,
            builder: (context, state) {
              return state.when(
                content: (congregations) => SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: AppSpacing.x24),
                      ...List.generate(congregations.length, (index) => CongregationCardWidget(congregation: congregations[index])),
                    ],
                  ),
                ),
                empty: () => const Center(child: Text('empty')),
                error: () => const Center(child: Text('error')),
                loading: () => const Center(child: CircularProgressIndicator()),
              );
            }));
  }

  Future<void> _showMyDialog() async {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cadastrar Congregação'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextFormField(controller: nameController),
                TextFormField(controller: cityController),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Text(
                    'Cancelar',
                    style: AppTextTheme.bodyLarge.copyWith(color: AppColors.error400),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: Text(
                    'Salvar',
                    style: AppTextTheme.bodyLarge.copyWith(color: AppColors.primary600),
                  ),
                  onPressed: () async {
                    await congregationCubit.createCongregation(name: nameController.text.trim(), city: cityController.text.trim());
                    if (context.mounted) Navigator.of(context).pop();
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
