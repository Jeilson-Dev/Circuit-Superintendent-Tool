import 'package:circuit_superintendent_tool/dto/group_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'visit_dto.freezed.dart';
part 'visit_dto.g.dart';

@freezed
class VisitDTO with _$VisitDTO {
  const VisitDTO._();
  const factory VisitDTO({
    required String id,
    VisitDTO? previousVisit,
    @Default('') @JsonKey(name: 'congregation_id') String congregationId,
    @Default('') @JsonKey(name: 'visit_date') String visitDate,
    @Default(0) @JsonKey(name: 'mid_week_assistance') int midWeekAssistance,
    @Default(0) @JsonKey(name: 'weekend_assistance') int weekendAssistance,
    @Default(0) @JsonKey(name: 'inactive_publishers') int inactivePublishers,
    @Default(0) @JsonKey(name: 'disassociated_publishers') int disassociatedPublishers,
    @Default([]) List<GroupDTO> groups,
  }) = _VisitDTO;

  String get lastVisit => previousVisit?.visitDate ?? '';
  int get newPublishers => _getPositiveValue(currentValue: publishersOnCongregation, previousValue: previousVisit?.publishersOnCongregation);
  int get newBaptized => _getPositiveValue(currentValue: publishersBaptizedOnCongregation, previousValue: previousVisit?.publishersBaptizedOnCongregation);
  int get newRegularPioneers => _getPositiveValue(currentValue: regularPioneersOnCongregation, previousValue: previousVisit?.regularPioneersOnCongregation);
  int get newAuxiliaryPioneers => _getPositiveValue(currentValue: auxiliaryPioneersOnCongregation, previousValue: previousVisit?.auxiliaryPioneersOnCongregation);
  int get reinstatedPublishers => _getPositiveValue(currentValue: disassociatedPublishers, previousValue: previousVisit?.disassociatedPublishers);
  int get reactivatedPublishers => _getPositiveValue(currentValue: inactivePublishers, previousValue: previousVisit?.inactivePublishers);
  int get publishersOnCongregation => _getAmount(groups.map((group) => group.totalPublishers).toList());
  int get publishersBaptizedOnCongregation => _getAmount(groups.map((group) => group.baptizedPublishers).toList());
  int get auxiliaryPioneersOnCongregation => _getAmount(groups.map((group) => group.auxiliaryPioneers).toList());
  int get regularPioneersOnCongregation => _getAmount(groups.map((group) => group.regularPioneers).toList());
  int get irregularPublishers => _getAmount(groups.map((group) => group.irregularPublishers.length).toList());

  int _getPositiveValue({required int currentValue, required int? previousValue}) {
    if (previousValue == null) return 0;
    final value = currentValue - previousValue;
    return value > 0 ? value : 0;
  }

  int _getAmount(List<int> list) {
    if (list.isEmpty) return 0;
    return list.length < 2 ? list.first : list.reduce((a, b) => a + b);
  }

  factory VisitDTO.fixture() => VisitDTO(id: 'visitId', groups: [GroupDTO.fixture()]);
  factory VisitDTO.fromJson(Map<String, dynamic> json) => _$VisitDTOFromJson(json);
}
