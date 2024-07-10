import 'package:circuit_superintendent_tool/core/core.dart';
import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
import 'package:circuit_superintendent_tool/features/settings/manage_congregations/manage_congregations_cubit.dart';
import 'package:circuit_superintendent_tool/features/settings/manage_congregations/manage_congregations_state.dart';

class ManageCongregationPage extends StatefulWidget {
  const ManageCongregationPage({super.key});
  static String get path => 'manage_congregations';

  @override
  State<ManageCongregationPage> createState() => _ManageCongregationPageState();
}

class _ManageCongregationPageState extends State<ManageCongregationPage> {
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
                      AppNav.placeholder()
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
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AppDialog(
          title: isCreating ? AppLocalizations.of(context)!.congregationPageAddCongregation : AppLocalizations.of(context)!.congregationPageEditCongregation,
          content: Column(
            children: [
              InputFormWidget(
                controller: nameController,
                backgroundColor: AppColors.white,
                hintText: AppLocalizations.of(context)!.congregationPageAddEditCongregationHintCongregation,
              ),
              InputFormWidget(
                backgroundColor: AppColors.white,
                controller: cityController,
                hintText: AppLocalizations.of(context)!.congregationPageAddEditCongregationHintCity,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          await congregationCubit.updateCongregation(congregation: congregation.copyWith(name: nameController.text, city: cityController.text));
                        }
                        if (context.mounted) Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
