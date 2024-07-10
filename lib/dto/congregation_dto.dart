import 'package:circuit_superintendent_tool/dto/visit_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'congregation_dto.freezed.dart';
part 'congregation_dto.g.dart';

@freezed
class CongregationDTO with _$CongregationDTO {
  const factory CongregationDTO({
    required String id,
    @Default('') String name,
    @Default('') String city,
    VisitDTO? lastVisit,
  }) = _CongregationDTO;

  factory CongregationDTO.fromJson(Map<String, dynamic> json) => _$CongregationDTOFromJson(json);
  factory CongregationDTO.fixture() => const CongregationDTO(id: '', city: 'Serrinha', name: 'Central', lastVisit: null);
}
