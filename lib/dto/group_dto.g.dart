// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupDTOImpl _$$GroupDTOImplFromJson(Map<String, dynamic> json) =>
    _$GroupDTOImpl(
      id: json['id'] as String,
      congregationId: json['congregation_id'] as String? ?? '',
      visitId: json['visit_id'] as String? ?? '',
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
      irregularPublishers: (json['irregular_publishers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      potentialPioneers: (json['potential_pioneers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      potentialElders: (json['potential_elders'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      potentialMinisterialServants:
          (json['potential_ministerial_servants'] as List<dynamic>?)
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
      'potential_pioneers': instance.potentialPioneers,
      'potential_elders': instance.potentialElders,
      'potential_ministerial_servants': instance.potentialMinisterialServants,
    };
