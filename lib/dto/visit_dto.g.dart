// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VisitDTOImpl _$$VisitDTOImplFromJson(Map<String, dynamic> json) =>
    _$VisitDTOImpl(
      id: json['id'] as String,
      previousVisit: json['previousVisit'] == null
          ? null
          : VisitDTO.fromJson(json['previousVisit'] as Map<String, dynamic>),
      congregationId: json['congregation_id'] as String? ?? '',
      visitDate: json['visit_date'] as String? ?? '',
      midWeekAssistance: (json['mid_week_assistance'] as num?)?.toInt() ?? 0,
      weekendAssistance: (json['weekend_assistance'] as num?)?.toInt() ?? 0,
      inactivePublishers: (json['inactive_publishers'] as num?)?.toInt() ?? 0,
      disassociatedPublishers:
          (json['disassociated_publishers'] as num?)?.toInt() ?? 0,
      groups: (json['groups'] as List<dynamic>?)
              ?.map((e) => GroupDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$VisitDTOImplToJson(_$VisitDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'previousVisit': instance.previousVisit,
      'congregation_id': instance.congregationId,
      'visit_date': instance.visitDate,
      'mid_week_assistance': instance.midWeekAssistance,
      'weekend_assistance': instance.weekendAssistance,
      'inactive_publishers': instance.inactivePublishers,
      'disassociated_publishers': instance.disassociatedPublishers,
      'groups': instance.groups,
    };
