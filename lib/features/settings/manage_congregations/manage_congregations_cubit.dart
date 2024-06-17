import 'package:bloc/bloc.dart';
import 'package:circuit_superintendent_tool/core/logger.dart';
import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
import 'package:circuit_superintendent_tool/features/settings/manage_congregations/manage_congregations_state.dart';
import 'package:circuit_superintendent_tool/services/sqflite_service.dart';

class CongregationsCubit extends Cubit<CongregationsState> {
  CongregationsCubit(this.service) : super(const CongregationsState.loading());

  final SQFliteService service;
  List<CongregationDTO> congregations = [];

  Future<void> loadCongregations() async {
    try {
      emit(const CongregationsState.loading());
      Logger.l(message: 'Loading congregations');
      congregations = await service.getCongregations();
      Logger.l(message: 'Fetched ${congregations.length} congregations');
      congregations.isEmpty ? emit(const CongregationsState.empty()) : emit(CongregationsState.content(congregations: congregations));
    } catch (exception, stackTrace) {
      Logger.e(message: exception.toString(), exception: exception, stackTrace: stackTrace);
      emit(const CongregationsState.error());
    }
  }

  Future<void> createCongregation({required String name, required String city}) async {
    await service.createCongregation(name: name, city: city);
    loadCongregations();
  }

  Future<void> updateCongregation({required int id, required String name, required String city}) async {
    await service.updateCongregation(id: id, name: name, city: city);
    loadCongregations();
  }

  Future<void> deleteCongregation({required int congregationId}) async {
    await service.deleteCongregation(id: congregationId);
    loadCongregations();
  }
}
