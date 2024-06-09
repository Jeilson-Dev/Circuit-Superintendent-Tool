import 'package:circuit_superintendent_tool/components/congregation_card_widget.dart';
import 'package:circuit_superintendent_tool/components/empty_screen.dart';
import 'package:circuit_superintendent_tool/components/input_form_widget.dart';
import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/inject.dart';
import 'package:circuit_superintendent_tool/core/localizations.dart';
import 'package:circuit_superintendent_tool/core/theme/app_colors.dart';
import 'package:circuit_superintendent_tool/core/theme/app_text_theme.dart';
import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
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
          title: Text(AppLocalizations.of(context)!.congregationPageTitle),
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
                      ...List.generate(
                        congregations.length,
                        (index) => CongregationCardWidget(
                          key: Key(congregations[index].id.toString()),
                          congregation: congregations[index],
                          onEdit: () => _showMyDialog(congregation: congregations[index]),
                          onDelete: () => congregationCubit.deleteCongregation(congregationId: congregations[index].id),
                        ),
                      ),
                    ],
                  ),
                ),
                empty: () => EmptyScreen(message: AppLocalizations.of(context)!.congregationPageEmpty),
                error: () => Center(child: Text(AppLocalizations.of(context)!.congregationPageError)),
                loading: () => const Center(child: CircularProgressIndicator()),
              );
            }));
  }

  Future<void> _showMyDialog({CongregationDTO? congregation}) async {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController cityController = TextEditingController();

    nameController.text = congregation?.name ?? '';
    cityController.text = congregation?.city ?? '';
    final bool isCreating = congregation == null;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isCreating ? AppLocalizations.of(context)!.congregationPageAddCongregation : AppLocalizations.of(context)!.congregationPageEditCongregation),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                InputFormWidget(hintText: AppLocalizations.of(context)!.congregationPageAddEditCongregationHintCongregation, controller: nameController),
                InputFormWidget(hintText: AppLocalizations.of(context)!.congregationPageAddEditCongregationHintCity, controller: cityController),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Text(
                    AppLocalizations.of(context)!.congregationPageAddEditCongregationCancel,
                    style: AppTextTheme.bodyLarge.copyWith(color: AppColors.error400),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: Text(
                    AppLocalizations.of(context)!.congregationPageAddEditCongregationSave,
                    style: AppTextTheme.bodyLarge.copyWith(color: AppColors.primary600),
                  ),
                  onPressed: () async {
                    if (isCreating) {
                      await congregationCubit.createCongregation(name: nameController.text.trim(), city: cityController.text.trim());
                    } else {
                      await congregationCubit.updateCongregation(id: congregation.id, name: nameController.text.trim(), city: cityController.text.trim());
                    }
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
