import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_visit_state.freezed.dart';

@freezed
class CreateVisitState with _$CreateVisitState {
  const factory CreateVisitState.loading() = _Loading;

  const factory CreateVisitState.error() = _Error;

  const factory CreateVisitState.empty() = _Empty;

  const factory CreateVisitState.content({required CongregationDTO congregation}) = _Content;
}
