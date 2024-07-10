import 'package:bloc/bloc.dart';
import 'package:circuit_superintendent_tool/core/logger.dart';
import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
import 'package:circuit_superintendent_tool/dto/hive_adapters/congregation.dart';
import 'package:circuit_superintendent_tool/features/settings/manage_congregations/manage_congregations_state.dart';
import 'package:circuit_superintendent_tool/repository/repository.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class CongregationsCubit extends Cubit<CongregationsState> {
  CongregationsCubit(this.repository) : super(const CongregationsState.loading());

  final Repository repository;
  List<CongregationDTO> congregations = [];

  Future<void> loadCongregations() async {
    try {
      emit(const CongregationsState.loading());
      Logger.l(message: 'Loading congregations');
      congregations = await repository.getCongregations();
      Logger.l(message: 'Fetched ${congregations.length} congregations');
      congregations.isEmpty ? emit(const CongregationsState.empty()) : emit(CongregationsState.content(congregations: congregations));
    } catch (exception, stackTrace) {
      Logger.e(message: exception.toString(), exception: exception, stackTrace: stackTrace);
      emit(const CongregationsState.error());
    }
  }

  Future<void> createCongregation({required String name, required String city}) async {
    final box = await Hive.openBox<Congregation>(Congregation.key);
    final congregationId = Uuid().v1();
    await box.put(congregationId, Congregation(id: congregationId, name: name, city: city));
    loadCongregations();
  }

  Future<void> updateCongregation({required CongregationDTO congregation}) async {
    await repository.updateCongregation(congregation: congregation);
    loadCongregations();
  }

  Future<void> deleteCongregation({required String congregationId}) async {
    await repository.deleteCongregation(congregationId);
    loadCongregations();
  }
}
