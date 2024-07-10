import 'package:circuit_superintendent_tool/core/core.dart';
import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
import 'package:circuit_superintendent_tool/dto/group_dto.dart';
import 'package:circuit_superintendent_tool/dto/visit_dto.dart';
import 'package:circuit_superintendent_tool/features/create_visit/components/group_form_widget.dart';
import 'package:circuit_superintendent_tool/features/create_visit/create_visit_cubit.dart';
import 'package:circuit_superintendent_tool/features/create_visit/create_visit_state.dart';
import 'package:circuit_superintendent_tool/features/visits/visits_cubit.dart';
import 'package:circuit_superintendent_tool/features/visits/visits_page.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

class CreateVisitPage extends StatefulWidget {
  const CreateVisitPage({super.key, required this.congregationId});
  static String get path => 'create_visit';

  static navigate(BuildContext context, {required String congregationId}) => context.go('/${VisitsPage.path}/$path/$congregationId');

  final String congregationId;
  @override
  State<CreateVisitPage> createState() => _CreateVisitPageState();
}

class _CreateVisitPageState extends State<CreateVisitPage> {
  final createVisitCubit = inject<CreateVisitCubit>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => createVisitCubit.loadCongregation(congregationId: widget.congregationId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Nova Visita')),
        body: BlocBuilder<CreateVisitCubit, CreateVisitState>(
            bloc: createVisitCubit,
            builder: (context, state) {
              return state.when(
                content: (congregation) => _CreateVisit(congregation: congregation),
                empty: () => EmptyScreen(message: AppLocalizations.of(context)!.visitsPageEmpty),
                error: () => Center(child: Text(AppLocalizations.of(context)!.visitsPageError)),
                loading: () => const Center(child: CircularProgressIndicator()),
              );
            }));
  }
}

class _CreateVisit extends StatefulWidget {
  const _CreateVisit({required this.congregation});
  final CongregationDTO congregation;

  @override
  State<_CreateVisit> createState() => __CreateVisitState();
}

class __CreateVisitState extends State<_CreateVisit> {
  final TextEditingController midWeekAttendance = TextEditingController();
  final TextEditingController weekendAttendance = TextEditingController();
  final TextEditingController inactivePublishers = TextEditingController();
  final TextEditingController disassociatedPublishers = TextEditingController();
  final groups = <GroupDTO>[];
  final createVisitCubit = inject<CreateVisitCubit>();

  @override
  void initState() {
    super.initState();
    groups.addAll(widget.congregation.lastVisit?.groups ?? []);
    midWeekAttendance.text = (widget.congregation.lastVisit?.midWeekAssistance ?? 0).toString();
    weekendAttendance.text = (widget.congregation.lastVisit?.weekendAssistance ?? 0).toString();
    inactivePublishers.text = (widget.congregation.lastVisit?.inactivePublishers ?? 0).toString();
    disassociatedPublishers.text = (widget.congregation.lastVisit?.disassociatedPublishers ?? 0).toString();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppCardTheme>()!;

    final String title = widget.congregation.name == widget.congregation.city ? widget.congregation.name : "${widget.congregation.name} de ${widget.congregation.city}";

    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: AppSpacing.x24),
            Row(
              children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.only(top: AppSpacing.x16, bottom: AppSpacing.x16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextTheme.titleLargeWidget(AppLocalizations.of(context)!.createVisitPageCongregationTitle, color: theme.textColor),
                          AppTextTheme.titleLargeWidget(title, color: theme.textColor),
                        ],
                      )),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: theme.inputBorderColor),
                borderRadius: BorderRadius.circular(AppSpacing.x8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSpacing.x8),
                child: Column(
                  children: [
                    InputFormWidget(
                      label: AppLocalizations.of(context)!.createVisitPageWeekAttendanceLabel,
                      hintText: AppLocalizations.of(context)!.createVisitPageWeekAttendanceHint,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                      controller: midWeekAttendance,
                    ),
                    InputFormWidget(
                      label: AppLocalizations.of(context)!.createVisitPageWeekendAttendanceLabel,
                      hintText: AppLocalizations.of(context)!.createVisitPageWeekendAttendanceHint,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                      controller: weekendAttendance,
                    ),
                    InputFormWidget(
                      label: AppLocalizations.of(context)!.createVisitPageDisassociatedPublishersLabel,
                      hintText: AppLocalizations.of(context)!.createVisitPageDisassociatedPublishersHint,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                      controller: disassociatedPublishers,
                    ),
                    InputFormWidget(
                      label: AppLocalizations.of(context)!.createVisitPageInactivePublishersLabel,
                      hintText: AppLocalizations.of(context)!.createVisitPageInactivePublishersHint,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                      controller: inactivePublishers,
                    ),
                    Container(height: AppSpacing.x8, color: theme.backgroundColor)
                  ],
                ),
              ),
            ),
            AppSpacing.spacingX20,
            Row(
              children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.only(top: AppSpacing.x16, bottom: AppSpacing.x8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextTheme.titleLargeWidget(AppLocalizations.of(context)!.createVisitPageGroups, color: theme.textColor),
                        ],
                      )),
                ),
              ],
            ),
            ...groups.map((group) {
              return GroupFormWidget(
                  key: Key(group.id),
                  group: group,
                  onRemoveGroup: (group) {
                    setState(() {
                      final groupIndex = groups.indexOf(group);
                      if (groupIndex != -1) groups.removeAt(groupIndex);
                    });
                  },
                  onUpdateGroup: (groupUpdated) {
                    setState(() {
                      final groupIndex = groups.indexOf(group);
                      if (groupIndex != -1) groups[groupIndex] = groupUpdated;
                    });
                  });
            }).toList(),
            TextButton(
                onPressed: () {
                  setState(() {
                    final newGroup = GroupDTO(id: Uuid().v1(), groupNumber: groups.length, responsible: groups.length.toString());
                    groups.add(newGroup);
                  });
                },
                child: Text(AppLocalizations.of(context)!.createVisitPageAddNewGroup)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.x24, horizontal: AppSpacing.x8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return AppColors.error700;
                          } else if (states.contains(MaterialState.hovered)) {
                            return AppColors.error300;
                          } else if (states.contains(MaterialState.disabled)) {
                            return AppColors.error300;
                          }
                          return AppColors.error500;
                        }),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      child: AppTextTheme.bodyMediumWidget(AppLocalizations.of(context)!.createVisitPageCancel)),
                  ElevatedButton(
                      onPressed: () async {
                        await createVisitCubit.createVisit(
                            visit: VisitDTO(
                          id: Uuid().v1(),
                          congregationId: widget.congregation.id,
                          disassociatedPublishers: int.tryParse(disassociatedPublishers.text.trim()) ?? 0,
                          inactivePublishers: int.tryParse(inactivePublishers.text.trim()) ?? 0,
                          midWeekAssistance: int.tryParse(midWeekAttendance.text.trim()) ?? 0,
                          previousVisit: widget.congregation.lastVisit,
                          // visitDate:visitDate.text.trim() ,
                          weekendAssistance: int.tryParse(weekendAttendance.text.trim()) ?? 0,
                          groups: groups,
                        ));
                        final visitsCubit = inject<VisitsCubit>();
                        visitsCubit.loadCongregations();
                        Navigator.of(context).pop();
                      },
                      child: AppTextTheme.bodyMediumWidget(AppLocalizations.of(context)!.createVisitPageSave)),
                ],
              ),
            ),
            AppNav.placeholder(),
          ],
        ),
      ),
    );
  }
}
