import 'package:freezed_annotation/freezed_annotation.dart';

part 'congregation_dto.freezed.dart';
part 'congregation_dto.g.dart';

@freezed
class CongregationDTO with _$CongregationDTO {
  const factory CongregationDTO({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String city,
  }) = _CongregationDTO;

  factory CongregationDTO.fromJson(Map<String, dynamic> json) => _$CongregationDTOFromJson(json);
  factory CongregationDTO.fixture() => const CongregationDTO(id: 2, city: 'Serrinha', name: 'Central');
}
