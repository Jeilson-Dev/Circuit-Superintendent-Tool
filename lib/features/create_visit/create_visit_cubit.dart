import 'package:bloc/bloc.dart';
import 'package:circuit_superintendent_tool/core/logger.dart';
import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
import 'package:circuit_superintendent_tool/dto/visit_dto.dart';
import 'package:circuit_superintendent_tool/features/create_visit/create_visit_state.dart';
import 'package:circuit_superintendent_tool/repository/repository.dart';

class CreateVisitCubit extends Cubit<CreateVisitState> {
  CreateVisitCubit(this.repository) : super(const CreateVisitState.loading());

  final Repository repository;
  CongregationDTO? congregation;

  Future<void> loadCongregation({required String congregationId}) async {
    try {
      emit(const CreateVisitState.loading());
      Logger.l(message: 'Loading visits');
      congregation = await repository.getCongregation(congregationId: congregationId);
      Logger.l(message: 'Congregation fetched');
      emit(CreateVisitState.content(congregation: congregation!));
    } catch (exception, stackTrace) {
      Logger.e(message: exception.toString(), exception: exception, stackTrace: stackTrace);
      emit(const CreateVisitState.error());
    }
  }

  Future<void> createVisit({required VisitDTO visit}) async {
    await repository.createVisit(visit);
  }

  Future<void> updateCongregation({required String id, required String name, required String city}) async {
    // await service.updateCongregation(id: id, name: name, city: city);
    // loadCongregations();
  }

  Future<void> deleteCongregation({required String congregationId}) async {
    // await service.deleteCongregation(id: congregationId);
    // loadCongregations();
  }
}
