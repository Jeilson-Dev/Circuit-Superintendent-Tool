import 'package:bloc/bloc.dart';
import 'package:circuit_superintendent_tool/core/logger.dart';
import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
import 'package:circuit_superintendent_tool/dto/visit_dto.dart';
import 'package:circuit_superintendent_tool/features/visits/visits_state.dart';
import 'package:circuit_superintendent_tool/repository/repository.dart';

class VisitsCubit extends Cubit<VisitsState> {
  VisitsCubit(this.repository) : super(const VisitsState.loading());

  final Repository repository;
  List<VisitDTO> visits = [];
  List<CongregationDTO> congregations = [];

  Future<void> loadCongregations({String? congregationId}) async {
    try {
      emit(const VisitsState.loading());
      Logger.l(message: 'Loading visits');
      visits = await repository.getVisits(congregationId: congregationId);
      congregations = await repository.getCongregations();

      Logger.l(message: 'Fetched ${visits.length} visits');
      visits.isEmpty ? emit(VisitsState.empty(congregations: congregations)) : emit(VisitsState.content(visits: visits, congregations: congregations));
    } catch (exception, stackTrace) {
      Logger.e(message: exception.toString(), exception: exception, stackTrace: stackTrace);
      emit(const VisitsState.error());
    }
  }

  Future<void> createVisit({required String name, required String city}) async {
    // await service.createVisit(congregationId: '');
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
