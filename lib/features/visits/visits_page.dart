import 'package:circuit_superintendent_tool/core/core.dart';
import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
import 'package:circuit_superintendent_tool/features/create_visit/create_visit_page.dart';
import 'package:circuit_superintendent_tool/features/list_congregations/list_congregations_page.dart';
import 'package:circuit_superintendent_tool/features/visits/visits_cubit.dart';
import 'package:circuit_superintendent_tool/features/visits/visits_state.dart';

class VisitsPage extends StatefulWidget {
  const VisitsPage({super.key, this.congregationId});
  static String get path => 'visits';
  final String? congregationId;

  static navigate(BuildContext context, {String? congregationId}) =>
      congregationId != null ? context.go('/${ListCongregationPage.path}/$path/$congregationId') : context.go('/$path');

  @override
  State<VisitsPage> createState() => _VisitsPageState();
}

class _VisitsPageState extends State<VisitsPage> {
  final visitsCubit = inject<VisitsCubit>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => visitsCubit.loadCongregations(congregationId: widget.congregationId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisitsCubit, VisitsState>(
        bloc: visitsCubit,
        builder: (context, state) {
          return state.when(
            content: (visits, congregations) => Scaffold(
              appBar: AppBar(
                title: Text(AppLocalizations.of(context)!.visitsPageTitle),
                actions: [
                  IconButton(
                      onPressed: () => widget.congregationId != null
                          ? CreateVisitPage.navigate(context, congregationId: widget.congregationId!)
                          : _showMyDialog(congregations: congregations),
                      icon: const Icon(Icons.add))
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: AppSpacing.x24),
                    ...List.generate(
                      visits.length,
                      (index) => VisitCardWidget(
                        key: Key(visits[index].id.toString()),
                        congregation: congregations.firstWhere((cong) => cong.id == visits[index].congregationId),
                        visit: visits[index],
                      ),
                    ),
                    AppNav.placeholder()
                  ],
                ),
              ),
            ),
            empty: (congregations) => Scaffold(
                appBar: AppBar(
                  title: Text(AppLocalizations.of(context)!.visitsPageTitle),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => widget.congregationId != null
                          ? CreateVisitPage.navigate(context, congregationId: widget.congregationId!)
                          : _showMyDialog(congregations: congregations),
                    )
                  ],
                ),
                body: EmptyScreen(message: AppLocalizations.of(context)!.visitsPageEmpty)),
            error: () => Center(child: Text(AppLocalizations.of(context)!.visitsPageError)),
            loading: () => const Center(child: CircularProgressIndicator()),
          );
        });
  }

  Future<void> _showMyDialog({required List<CongregationDTO> congregations}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AppDialog(
        title: AppLocalizations.of(context)!.visitsPageAddEditCongregationNewVisitTitle,
        content: _DialogContent(congregations: congregations),
      ),
    );
  }
}

class _DialogContent extends StatefulWidget {
  const _DialogContent({required this.congregations});
  final List<CongregationDTO> congregations;
  @override
  State<_DialogContent> createState() => __DialogContentState();
}

class __DialogContentState extends State<_DialogContent> {
  CongregationDTO? congregation;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          DropdownInputWidget<CongregationDTO?>(
            backgroundColor: AppColors.white,
            label: AppLocalizations.of(context)!.visitsPageAddEditCongregationDropdownCongregationLabel,
            value: congregation,
            hint: AppLocalizations.of(context)!.visitsPageAddEditCongregationDropdownCongregationHint,
            isExpanded: true,
            onChanged: (value) => setState(() => congregation = value),
            items: widget.congregations
                .map((congregation) => DropdownMenuItem<CongregationDTO?>(
                      value: congregation,
                      child: Container(child: AppTextTheme.bodyMediumWidget('${congregation.name} - ${congregation.city}', color: AppColors.gray800)),
                    ))
                .toList(),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x24, vertical: AppSpacing.x12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text(
                    AppLocalizations.of(context)!.visitsPageAddEditCongregationCancel,
                    style: AppTextTheme.bodyLarge.copyWith(color: AppColors.error400),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: Text(
                    AppLocalizations.of(context)!.visitsPageAddEditCongregationSave,
                    style: AppTextTheme.bodyLarge.copyWith(color: AppColors.primary600),
                  ),
                  onPressed: () async {
                    if (context.mounted) Navigator.of(context).pop();
                    CreateVisitPage.navigate(context, congregationId: congregation?.id.toString() ?? '');
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
