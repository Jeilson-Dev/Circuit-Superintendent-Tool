import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
import 'package:hive/hive.dart';

part 'congregation.g.dart';

@HiveType(typeId: 1)
class Congregation {
  static const key = 'congregation';
  Congregation({required this.id, required this.name, required this.city, this.lastVisitId});

  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String city;

  @HiveField(3)
  String? lastVisitId;

  CongregationDTO get toDto => CongregationDTO(id: id, city: city, name: name);
}
