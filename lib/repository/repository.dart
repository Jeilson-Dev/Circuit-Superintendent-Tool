import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
import 'package:circuit_superintendent_tool/dto/group_dto.dart';
import 'package:circuit_superintendent_tool/dto/hive_adapters/congregation.dart';
import 'package:circuit_superintendent_tool/dto/hive_adapters/group.dart';
import 'package:circuit_superintendent_tool/dto/hive_adapters/visit.dart';
import 'package:circuit_superintendent_tool/dto/visit_dto.dart';
import 'package:hive/hive.dart';

class Repository {
  late Box<Visit> _visitBox;
  late Box<Group> _groupBox;
  late Box<Congregation> _congregationBox;
  Repository({required Box<Visit> visitBox, required Box<Group> groupBox, required Box<Congregation> congregationBox}) {
    this._visitBox = visitBox;
    this._groupBox = groupBox;
    this._congregationBox = congregationBox;
  }

  List<VisitDTO> getVisits({String? congregationId}) {
    final groups = getGroups();
    final congregations =
        _visitBox.values.map((visit) => visit.toDto.copyWith(groups: visit.groups.map((e) => groups.firstWhere((element) => element.id == e)).toList())).toList();

    return congregationId != null ? congregations.where((congregation) => congregation.congregationId == congregationId).toList() : congregations;
  }

  VisitDTO? getVisit({required String visitId}) {
    List<GroupDTO> groups = [];
    final visit = _visitBox.get(visitId);
    if (visit != null) {
      visit.groups.forEach((group) {
        groups.add(getGroup(groupId: group));
      });
    }

    return visit?.toDto.copyWith(groups: groups);
  }

  List<CongregationDTO> getCongregations() {
    final congregations = _congregationBox.values.map((congregation) => congregation.toDto).toList();
    return congregations;
  }

  CongregationDTO getCongregation({required String congregationId}) {
    VisitDTO? lastVisit;
    final congregation = _congregationBox.get(congregationId);
    if (congregation == null) {
      throw 'Congregation not found';
    }
    if (congregation.lastVisitId != null) {
      lastVisit = getVisit(visitId: congregation.lastVisitId!);
    }

    return congregation.toDto.copyWith(lastVisit: lastVisit);
  }

  Future<void> updateCongregation({required CongregationDTO congregation}) async {
    await _congregationBox.put(
        congregation.id,
        Congregation(
          id: congregation.id,
          name: congregation.name,
          city: congregation.city,
          lastVisitId: congregation.lastVisit?.id,
        ));
  }

  Future<void> createVisit(VisitDTO visit) async {
    visit.groups.forEach((group) => createGroup(group: group));
    _visitBox.put(
        visit.id,
        Visit(
          id: visit.id,
          congregationId: visit.congregationId,
          visitDate: visit.visitDate,
          midWeekAssistance: visit.midWeekAssistance,
          weekendAssistance: visit.weekendAssistance,
          inactivePublishers: visit.inactivePublishers,
          disassociatedPublishers: visit.disassociatedPublishers,
          groups: visit.groups.map((group) => group.id).toList(),
        ));
  }

  deleteCongregation(String congregationId) {
    _congregationBox.delete(congregationId);
  }

  GroupDTO getGroup({required String groupId}) {
    final group = _groupBox.get(groupId);
    if (group == null) {
      throw 'Congregation not found';
    }

    return group.toDto;
  }

  List<GroupDTO> getGroups() {
    return _groupBox.values.map((groups) => groups.toDto).toList();
  }

  Future<void> createGroup({required GroupDTO group}) {
    return _groupBox.put(
      group.id,
      Group(
        id: group.id,
        congregationId: group.congregationId,
        visitId: group.visitId,
        responsible: group.responsible,
        groupNumber: group.groupNumber,
        studies: group.studies,
        publisherWithoutStudies: group.publisherWithoutStudies,
        activePublishers: group.activePublishers,
        baptizedPublishers: group.baptizedPublishers,
        notBaptizedPublishers: group.notBaptizedPublishers,
        regularPioneers: group.regularPioneers,
        auxiliaryPioneers: group.auxiliaryPioneers,
        irregularPublishers: group.irregularPublishers,
        potentialPioneers: group.potentialPioneers,
        potentialElders: group.potentialElders,
        potentialMinisterialServants: group.potentialMinisterialServants,
      ),
    );
  }
}
