// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'congregation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CongregationDTOImpl _$$CongregationDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CongregationDTOImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      city: json['city'] as String? ?? '',
    );

Map<String, dynamic> _$$CongregationDTOImplToJson(
        _$CongregationDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
    };
