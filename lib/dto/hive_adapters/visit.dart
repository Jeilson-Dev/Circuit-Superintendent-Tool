import 'package:circuit_superintendent_tool/dto/visit_dto.dart';
import 'package:hive/hive.dart';

part 'visit.g.dart';

@HiveType(typeId: 3)
class Visit {
  static const key = 'visit';

  Visit({
    required this.id,
    this.previousVisit,
    required this.congregationId,
    required this.visitDate,
    required this.midWeekAssistance,
    required this.weekendAssistance,
    required this.inactivePublishers,
    required this.disassociatedPublishers,
    required this.groups,
  });

  @HiveField(0)
  String id;

  @HiveField(1)
  String? previousVisit;

  @HiveField(2)
  String congregationId;

  @HiveField(3)
  String visitDate;

  @HiveField(4)
  int midWeekAssistance;

  @HiveField(5)
  int weekendAssistance;

  @HiveField(6)
  int inactivePublishers;

  @HiveField(7)
  int disassociatedPublishers;

  @HiveField(8)
  List<String> groups;

  VisitDTO get toDto => VisitDTO(
        id: id,
        congregationId: congregationId,
        disassociatedPublishers: disassociatedPublishers,
        groups: [],
        inactivePublishers: inactivePublishers,
        midWeekAssistance: midWeekAssistance,
        visitDate: visitDate,
        weekendAssistance: weekendAssistance,
      );
}
