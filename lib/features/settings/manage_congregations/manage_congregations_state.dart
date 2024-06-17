import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_congregations_state.freezed.dart';

@freezed
class CongregationsState with _$CongregationsState {
  const factory CongregationsState.loading() = _Loading;

  const factory CongregationsState.error() = _Error;

  const factory CongregationsState.empty() = _Empty;

  const factory CongregationsState.content({required List<CongregationDTO> congregations}) = _Content;
}
