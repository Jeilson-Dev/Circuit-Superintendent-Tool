// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'congregation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CongregationDTOImpl _$$CongregationDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CongregationDTOImpl(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      city: json['city'] as String? ?? '',
      lastVisit: json['lastVisit'] == null
          ? null
          : VisitDTO.fromJson(json['lastVisit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CongregationDTOImplToJson(
        _$CongregationDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'lastVisit': instance.lastVisit,
    };
