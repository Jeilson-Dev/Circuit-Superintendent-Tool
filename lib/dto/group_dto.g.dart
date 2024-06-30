// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupDTOImpl _$$GroupDTOImplFromJson(Map<String, dynamic> json) =>
    _$GroupDTOImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      congregationId: (json['congregation_id'] as num?)?.toInt() ?? 0,
      visitId: (json['visit_id'] as num?)?.toInt() ?? 0,
      responsible: json['responsible'] as String? ?? '',
      groupNumber: (json['group_number'] as num?)?.toInt() ?? 0,
      studies: (json['studies'] as num?)?.toInt() ?? 0,
      publisherWithoutStudies:
          (json['publisher_without_studies'] as num?)?.toInt() ?? 0,
      activePublishers: (json['active_publishers'] as num?)?.toInt() ?? 0,
      baptizedPublishers: (json['baptized_publishers'] as num?)?.toInt() ?? 0,
      notBaptizedPublishers:
          (json['not_baptized_publishers'] as num?)?.toInt() ?? 0,
      regularPioneers: (json['regular_pioneers'] as num?)?.toInt() ?? 0,
      auxiliaryPioneers: (json['auxiliary_pioneers'] as num?)?.toInt() ?? 0,
      irregularPublishers: (json['irregular_publishers'] as num?)?.toInt() ?? 0,
      potentialPioneer: (json['potential_pioneer'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      potentialElder: (json['potential_elder'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      potentialMinisterialServant:
          (json['potential_ministerial_servant'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
    );

Map<String, dynamic> _$$GroupDTOImplToJson(_$GroupDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'congregation_id': instance.congregationId,
      'visit_id': instance.visitId,
      'responsible': instance.responsible,
      'group_number': instance.groupNumber,
      'studies': instance.studies,
      'publisher_without_studies': instance.publisherWithoutStudies,
      'active_publishers': instance.activePublishers,
      'baptized_publishers': instance.baptizedPublishers,
      'not_baptized_publishers': instance.notBaptizedPublishers,
      'regular_pioneers': instance.regularPioneers,
      'auxiliary_pioneers': instance.auxiliaryPioneers,
      'irregular_publishers': instance.irregularPublishers,
      'potential_pioneer': instance.potentialPioneer,
      'potential_elder': instance.potentialElder,
      'potential_ministerial_servant': instance.potentialMinisterialServant,
    };
