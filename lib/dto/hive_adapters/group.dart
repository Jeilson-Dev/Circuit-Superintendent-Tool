import 'package:circuit_superintendent_tool/dto/group_dto.dart';
import 'package:hive/hive.dart';

part 'group.g.dart';

@HiveType(typeId: 2)
class Group {
  static const key = 'group';
  Group({
    required this.id,
    required this.congregationId,
    required this.visitId,
    required this.responsible,
    required this.groupNumber,
    required this.studies,
    required this.publisherWithoutStudies,
    required this.activePublishers,
    required this.baptizedPublishers,
    required this.notBaptizedPublishers,
    required this.regularPioneers,
    required this.auxiliaryPioneers,
    required this.irregularPublishers,
    required this.potentialPioneers,
    required this.potentialElders,
    required this.potentialMinisterialServants,
  });

  @HiveField(0)
  String id;

  @HiveField(1)
  String congregationId;

  @HiveField(2)
  String visitId;

  @HiveField(3)
  String responsible;

  @HiveField(4)
  int groupNumber;

  @HiveField(5)
  int studies;

  @HiveField(6)
  int publisherWithoutStudies;

  @HiveField(7)
  int activePublishers;

  @HiveField(8)
  int baptizedPublishers;

  @HiveField(9)
  int notBaptizedPublishers;

  @HiveField(10)
  int regularPioneers;

  @HiveField(11)
  int auxiliaryPioneers;

  @HiveField(12)
  List<String> irregularPublishers;

  @HiveField(13)
  List<String> potentialPioneers;

  @HiveField(14)
  List<String> potentialElders;

  @HiveField(15)
  List<String> potentialMinisterialServants;

  GroupDTO get toDto => GroupDTO(
        id: id,
        activePublishers: activePublishers,
        auxiliaryPioneers: activePublishers,
        baptizedPublishers: baptizedPublishers,
        congregationId: congregationId,
        groupNumber: groupNumber,
        irregularPublishers: irregularPublishers,
        notBaptizedPublishers: notBaptizedPublishers,
        potentialElders: potentialElders,
        potentialMinisterialServants: potentialMinisterialServants,
        potentialPioneers: potentialPioneers,
        publisherWithoutStudies: publisherWithoutStudies,
        regularPioneers: regularPioneers,
        responsible: responsible,
        studies: studies,
        visitId: visitId,
      );
}
