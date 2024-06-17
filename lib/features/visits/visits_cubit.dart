import 'package:bloc/bloc.dart';
import 'package:circuit_superintendent_tool/core/logger.dart';
import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
import 'package:circuit_superintendent_tool/features/visits/visits_state.dart';
import 'package:circuit_superintendent_tool/services/sqflite_service.dart';

class VisitsCubit extends Cubit<VisitsState> {
  VisitsCubit(this.service) : super(const VisitsState.loading());

  final SQFliteService service;
  List<CongregationDTO> visits = [];

  Future<void> loadCongregations() async {
    try {
      emit(const VisitsState.loading());
      Logger.l(message: 'Loading visits');
      visits = await service.getCongregations();
      Logger.l(message: 'Fetched ${visits.length} visits');
      visits.isEmpty ? emit(const VisitsState.empty()) : emit(VisitsState.content(visits: visits));
    } catch (exception, stackTrace) {
      Logger.e(message: exception.toString(), exception: exception, stackTrace: stackTrace);
      emit(const VisitsState.error());
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
