import 'package:circuit_superintendent_tool/dto/group_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'visit_dto.freezed.dart';
part 'visit_dto.g.dart';

@freezed
class VisitDTO with _$VisitDTO {
  const VisitDTO._();
  const factory VisitDTO({
    @Default(0) int id,
    VisitDTO? previousVisit,
    @Default(0) @JsonKey(name: 'congregation_id') int congregationId,
    @Default('') @JsonKey(name: 'visit_date') String visitDate,
    @Default(0) @JsonKey(name: 'mid_week_assistance') int midWeekAssistance,
    @Default(0) @JsonKey(name: 'weekend_assistance') int weekendAssistance,
    @Default(0) @JsonKey(name: 'inactive_publishers') int inactivePublishers,
    @Default(0) @JsonKey(name: 'disassociated_publishers') int disassociatedPublishers,
    @Default([]) List<GroupDTO> groups,
  }) = _VisitDTO;

  int get newPublishers => _getPositiveValue(currentValue: publishersOnCongregation, previousValue: previousVisit?.publishersOnCongregation);
  int get newBaptized => _getPositiveValue(currentValue: publishersBaptizedOnCongregation, previousValue: previousVisit?.publishersBaptizedOnCongregation);
  int get newRegularPioneers => _getPositiveValue(currentValue: regularPioneersOnCongregation, previousValue: previousVisit?.regularPioneersOnCongregation);
  int get newAuxiliaryPioneers => _getPositiveValue(currentValue: auxiliaryPioneersOnCongregation, previousValue: previousVisit?.auxiliaryPioneersOnCongregation);
  int get reinstatedPublishers => _getPositiveValue(currentValue: disassociatedPublishers, previousValue: previousVisit?.disassociatedPublishers);
  int get reactivatedPublishers => _getPositiveValue(currentValue: inactivePublishers, previousValue: previousVisit?.inactivePublishers);
  int get publishersOnCongregation => groups.map((group) => group.totalPublishers).reduce((a, b) => a + b);
  int get publishersBaptizedOnCongregation => groups.map((group) => group.baptizedPublishers).reduce((a, b) => a + b);
  int get auxiliaryPioneersOnCongregation => groups.map((group) => group.auxiliaryPioneers).reduce((a, b) => a + b);
  int get regularPioneersOnCongregation => groups.map((group) => group.regularPioneers).reduce((a, b) => a + b);
  int get irregularPublishers => groups.map((group) => group.irregularPublishers.length).reduce((a, b) => a + b);

  int _getPositiveValue({required int currentValue, required int? previousValue}) {
    if (previousValue == null) return 0;
    final value = currentValue - previousValue;
    return value > 0 ? value : 0;
  }

  factory VisitDTO.fixture() => const VisitDTO();
  factory VisitDTO.fromJson(Map<String, dynamic> json) => _$VisitDTOFromJson(json);
}
