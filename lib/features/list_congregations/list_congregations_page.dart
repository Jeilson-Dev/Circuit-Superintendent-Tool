import 'package:circuit_superintendent_tool/core/core.dart';
import 'package:circuit_superintendent_tool/features/list_congregations/list_congregations_cubit.dart';
import 'package:circuit_superintendent_tool/features/list_congregations/list_congregations_state.dart';
import 'package:circuit_superintendent_tool/features/visits/visits_page.dart';

class ListCongregationPage extends StatefulWidget {
  const ListCongregationPage({super.key});
  static String get path => 'list_congregations';

  @override
  State<ListCongregationPage> createState() => _ListCongregationPageState();
}

class _ListCongregationPageState extends State<ListCongregationPage> {
  final listCongregationCubit = inject<ListCongregationsCubit>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => listCongregationCubit.loadCongregations());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.congregationPageTitle),
        ),
        body: BlocBuilder<ListCongregationsCubit, ListCongregationsState>(
            bloc: listCongregationCubit,
            builder: (context, state) {
              return state.when(
                content: (congregations) => SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: AppSpacing.x24),
                      ...congregations.map((congregation) => CongregationCardWidget(
                            key: Key(congregation.id.toString()),
                            congregation: congregation,
                            onEdit: () => VisitsPage.navigate(context, congregationId: congregation.id),
                          )),
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
}
