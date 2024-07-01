import 'package:circuit_superintendent_tool/components/congregation_card_widget.dart';
import 'package:circuit_superintendent_tool/components/empty_screen.dart';
import 'package:circuit_superintendent_tool/components/navigation/app_nav.dart';
import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/inject.dart';
import 'package:circuit_superintendent_tool/core/localizations.dart';
import 'package:circuit_superintendent_tool/features/list_congregations/list_congregations_cubit.dart';
import 'package:circuit_superintendent_tool/features/list_congregations/list_congregations_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) => listCongregationCubit.loadCongregations());

    super.initState();
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
                      ...List.generate(
                        congregations.length,
                        (index) => CongregationCardWidget(
                          key: Key(congregations[index].id.toString()),
                          congregation: congregations[index],
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
}
