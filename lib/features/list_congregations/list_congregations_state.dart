import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_congregations_state.freezed.dart';

@freezed
class ListCongregationsState with _$ListCongregationsState {
  const factory ListCongregationsState.loading() = _Loading;

  const factory ListCongregationsState.error() = _Error;

  const factory ListCongregationsState.empty() = _Empty;

  const factory ListCongregationsState.content({required List<CongregationDTO> congregations}) = _Content;
}
