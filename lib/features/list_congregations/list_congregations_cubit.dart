import 'package:bloc/bloc.dart';
import 'package:circuit_superintendent_tool/core/logger.dart';
import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
import 'package:circuit_superintendent_tool/dto/hive_adapters/congregation.dart';
import 'package:circuit_superintendent_tool/features/list_congregations/list_congregations_state.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class ListCongregationsCubit extends Cubit<ListCongregationsState> {
  ListCongregationsCubit() : super(const ListCongregationsState.loading());

  List<CongregationDTO> congregations = [];

  Future<void> loadCongregations() async {
    try {
      final box = await Hive.openBox<Congregation>(Congregation.key);
      emit(const ListCongregationsState.loading());
      Logger.l(message: 'Loading congregations');
      congregations = await box.values.map((cong) => cong.toDto).toList();
      Logger.l(message: 'Fetched ${congregations.length} congregations');
      congregations.isEmpty ? emit(const ListCongregationsState.empty()) : emit(ListCongregationsState.content(congregations: congregations));
    } catch (exception, stackTrace) {
      Logger.e(message: exception.toString(), exception: exception, stackTrace: stackTrace);
      emit(const ListCongregationsState.error());
    }
  }

  Future<void> createCongregation({required String name, required String city}) async {
    final box = await Hive.openBox<Congregation>(Congregation.key);

    await box.put(Congregation.key, Congregation(id: Uuid().v1(), name: name, city: city));
    loadCongregations();
  }

  Future<void> updateCongregation({required String id, required String name, required String city}) async {
    // await service.updateCongregation(id: id, name: name, city: city);
    loadCongregations();
  }

  Future<void> deleteCongregation({required String congregationId}) async {
    // await service.deleteCongregation(id: congregationId);
    loadCongregations();
  }
}
