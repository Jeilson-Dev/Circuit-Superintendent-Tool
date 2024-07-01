import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_dto.freezed.dart';
part 'group_dto.g.dart';

@freezed
class GroupDTO with _$GroupDTO {
  const GroupDTO._();
  const factory GroupDTO({
    @Default(0) int id,
    @Default(0) @JsonKey(name: 'congregation_id') int congregationId,
    @Default(0) @JsonKey(name: 'visit_id') int visitId,
    @Default('') String responsible,
    @Default(0) @JsonKey(name: 'group_number') int groupNumber,
    @Default(0) @JsonKey(name: 'studies') int studies,
    @Default(0) @JsonKey(name: 'publisher_without_studies') int publisherWithoutStudies,
    @Default(0) @JsonKey(name: 'active_publishers') int activePublishers,
    @Default(0) @JsonKey(name: 'baptized_publishers') int baptizedPublishers,
    @Default(0) @JsonKey(name: 'not_baptized_publishers') int notBaptizedPublishers,
    @Default(0) @JsonKey(name: 'regular_pioneers') int regularPioneers,
    @Default(0) @JsonKey(name: 'auxiliary_pioneers') int auxiliaryPioneers,
    @Default([]) @JsonKey(name: 'irregular_publishers') List<String> irregularPublishers,
    @Default([]) @JsonKey(name: 'potential_pioneers') List<String> potentialPioneers,
    @Default([]) @JsonKey(name: 'potential_elders') List<String> potentialElders,
    @Default([]) @JsonKey(name: 'potential_ministerial_servants') List<String> potentialMinisterialServants,
  }) = _GroupDTO;

  int get totalPublishers => activePublishers + irregularPublishers.length;

  factory GroupDTO.fromJson(Map<String, dynamic> json) => _$GroupDTOFromJson(json);
  // factory GroupDTO.fixture() => const GroupDTO(id: 2, city: 'Serrinha', name: 'Central');
}
