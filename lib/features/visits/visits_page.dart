import 'package:circuit_superintendent_tool/components/empty_screen.dart';
import 'package:circuit_superintendent_tool/components/navigation/app_nav.dart';
import 'package:circuit_superintendent_tool/components/visit_card_widget.dart';
import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/inject.dart';
import 'package:circuit_superintendent_tool/core/localizations.dart';
import 'package:circuit_superintendent_tool/features/settings/manage_congregations/manage_congregations_cubit.dart';
import 'package:circuit_superintendent_tool/features/settings/manage_congregations/manage_congregations_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisitsPage extends StatefulWidget {
  const VisitsPage({super.key});
  static String get path => 'visits';

  @override
  State<VisitsPage> createState() => _VisitsPageState();
}

class _VisitsPageState extends State<VisitsPage> {
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
          title: Text(AppLocalizations.of(context)!.visitsPageTitle),
          actions: [IconButton(onPressed: () {}, /* => _showMyDialog(),*/ icon: const Icon(Icons.add))],
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
                        (index) => VisitCardWidget(
                          key: Key(congregations[index].id.toString()),
                          congregationName: congregations[index].name,
                          congregationCity: congregations[index].city,
                          lastVisit: '',
                          attendingMeetingsWeekDay: 0, attendingMeetingsWeekends: 0,
                          elders: 0,
                          nextVisit: '',
                          pioneers: 0,
                          servants: 0,
                          // onEdit: () {}, // => _showMyDialog(congregation: congregations[index]),
                          // onDelete: () => congregationCubit.deleteCongregation(congregationId: congregations[index].id),
                        ),
                      ),
                      AppNav.placeholder()
                    ],
                  ),
                ),
                empty: () => EmptyScreen(message: AppLocalizations.of(context)!.visitsPageEmpty),
                error: () => Center(child: Text(AppLocalizations.of(context)!.visitsPageError)),
                loading: () => const Center(child: CircularProgressIndicator()),
              );
            }));
  }

  // Future<void> _showMyDialog({CongregationDTO? congregation}) async {
  //   final TextEditingController nameController = TextEditingController();
  //   final TextEditingController cityController = TextEditingController();

  //   nameController.text = congregation?.name ?? '';
  //   cityController.text = congregation?.city ?? '';
  //   final bool isCreating = congregation == null;
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(isCreating ? AppLocalizations.of(context)!.visitsPageAddCongregation : AppLocalizations.of(context)!.visitsPageEditCongregation),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: [
  //               InputFormWidget(hintText: AppLocalizations.of(context)!.visitsPageAddEditCongregationHintCongregation, controller: nameController),
  //               InputFormWidget(hintText: AppLocalizations.of(context)!.visitsPageAddEditCongregationHintCity, controller: cityController),
  //             ],
  //           ),
  //         ),
  //         actions: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: [
  //               TextButton(
  //                 child: Text(
  //                   AppLocalizations.of(context)!.visitsPageAddEditCongregationCancel,
  //                   style: AppTextTheme.bodyLarge.copyWith(color: AppColors.error400),
  //                 ),
  //                 onPressed: () => Navigator.of(context).pop(),
  //               ),
  //               TextButton(
  //                 child: Text(
  //                   AppLocalizations.of(context)!.visitsPageAddEditCongregationSave,
  //                   style: AppTextTheme.bodyLarge.copyWith(color: AppColors.primary600),
  //                 ),
  //                 onPressed: () async {
  //                   if (isCreating) {
  //                     await congregationCubit.createCongregation(name: nameController.text.trim(), city: cityController.text.trim());
  //                   } else {
  //                     await congregationCubit.updateCongregation(id: congregation.id, name: nameController.text.trim(), city: cityController.text.trim());
  //                   }
  //                   if (context.mounted) Navigator.of(context).pop();
  //                 },
  //               ),
  //             ],
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }
}
