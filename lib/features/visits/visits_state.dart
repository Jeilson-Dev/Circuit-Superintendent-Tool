import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'visits_state.freezed.dart';

@freezed
class VisitsState with _$VisitsState {
  const factory VisitsState.loading() = _Loading;

  const factory VisitsState.error() = _Error;

  const factory VisitsState.empty() = _Empty;

  const factory VisitsState.content({required List<CongregationDTO> visits}) = _Content;
}
