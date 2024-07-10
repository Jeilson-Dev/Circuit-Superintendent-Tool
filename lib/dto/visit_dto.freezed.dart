// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visit_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VisitDTO _$VisitDTOFromJson(Map<String, dynamic> json) {
  return _VisitDTO.fromJson(json);
}

/// @nodoc
mixin _$VisitDTO {
  String get id => throw _privateConstructorUsedError;
  VisitDTO? get previousVisit => throw _privateConstructorUsedError;
  @JsonKey(name: 'congregation_id')
  String get congregationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'visit_date')
  String get visitDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'mid_week_assistance')
  int get midWeekAssistance => throw _privateConstructorUsedError;
  @JsonKey(name: 'weekend_assistance')
  int get weekendAssistance => throw _privateConstructorUsedError;
  @JsonKey(name: 'inactive_publishers')
  int get inactivePublishers => throw _privateConstructorUsedError;
  @JsonKey(name: 'disassociated_publishers')
  int get disassociatedPublishers => throw _privateConstructorUsedError;
  List<GroupDTO> get groups => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitDTOCopyWith<VisitDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitDTOCopyWith<$Res> {
  factory $VisitDTOCopyWith(VisitDTO value, $Res Function(VisitDTO) then) =
      _$VisitDTOCopyWithImpl<$Res, VisitDTO>;
  @useResult
  $Res call(
      {String id,
      VisitDTO? previousVisit,
      @JsonKey(name: 'congregation_id') String congregationId,
      @JsonKey(name: 'visit_date') String visitDate,
      @JsonKey(name: 'mid_week_assistance') int midWeekAssistance,
      @JsonKey(name: 'weekend_assistance') int weekendAssistance,
      @JsonKey(name: 'inactive_publishers') int inactivePublishers,
      @JsonKey(name: 'disassociated_publishers') int disassociatedPublishers,
      List<GroupDTO> groups});

  $VisitDTOCopyWith<$Res>? get previousVisit;
}

/// @nodoc
class _$VisitDTOCopyWithImpl<$Res, $Val extends VisitDTO>
    implements $VisitDTOCopyWith<$Res> {
  _$VisitDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? previousVisit = freezed,
    Object? congregationId = null,
    Object? visitDate = null,
    Object? midWeekAssistance = null,
    Object? weekendAssistance = null,
    Object? inactivePublishers = null,
    Object? disassociatedPublishers = null,
    Object? groups = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      previousVisit: freezed == previousVisit
          ? _value.previousVisit
          : previousVisit // ignore: cast_nullable_to_non_nullable
              as VisitDTO?,
      congregationId: null == congregationId
          ? _value.congregationId
          : congregationId // ignore: cast_nullable_to_non_nullable
              as String,
      visitDate: null == visitDate
          ? _value.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as String,
      midWeekAssistance: null == midWeekAssistance
          ? _value.midWeekAssistance
          : midWeekAssistance // ignore: cast_nullable_to_non_nullable
              as int,
      weekendAssistance: null == weekendAssistance
          ? _value.weekendAssistance
          : weekendAssistance // ignore: cast_nullable_to_non_nullable
              as int,
      inactivePublishers: null == inactivePublishers
          ? _value.inactivePublishers
          : inactivePublishers // ignore: cast_nullable_to_non_nullable
              as int,
      disassociatedPublishers: null == disassociatedPublishers
          ? _value.disassociatedPublishers
          : disassociatedPublishers // ignore: cast_nullable_to_non_nullable
              as int,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupDTO>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VisitDTOCopyWith<$Res>? get previousVisit {
    if (_value.previousVisit == null) {
      return null;
    }

    return $VisitDTOCopyWith<$Res>(_value.previousVisit!, (value) {
      return _then(_value.copyWith(previousVisit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VisitDTOImplCopyWith<$Res>
    implements $VisitDTOCopyWith<$Res> {
  factory _$$VisitDTOImplCopyWith(
          _$VisitDTOImpl value, $Res Function(_$VisitDTOImpl) then) =
      __$$VisitDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      VisitDTO? previousVisit,
      @JsonKey(name: 'congregation_id') String congregationId,
      @JsonKey(name: 'visit_date') String visitDate,
      @JsonKey(name: 'mid_week_assistance') int midWeekAssistance,
      @JsonKey(name: 'weekend_assistance') int weekendAssistance,
      @JsonKey(name: 'inactive_publishers') int inactivePublishers,
      @JsonKey(name: 'disassociated_publishers') int disassociatedPublishers,
      List<GroupDTO> groups});

  @override
  $VisitDTOCopyWith<$Res>? get previousVisit;
}

/// @nodoc
class __$$VisitDTOImplCopyWithImpl<$Res>
    extends _$VisitDTOCopyWithImpl<$Res, _$VisitDTOImpl>
    implements _$$VisitDTOImplCopyWith<$Res> {
  __$$VisitDTOImplCopyWithImpl(
      _$VisitDTOImpl _value, $Res Function(_$VisitDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? previousVisit = freezed,
    Object? congregationId = null,
    Object? visitDate = null,
    Object? midWeekAssistance = null,
    Object? weekendAssistance = null,
    Object? inactivePublishers = null,
    Object? disassociatedPublishers = null,
    Object? groups = null,
  }) {
    return _then(_$VisitDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      previousVisit: freezed == previousVisit
          ? _value.previousVisit
          : previousVisit // ignore: cast_nullable_to_non_nullable
              as VisitDTO?,
      congregationId: null == congregationId
          ? _value.congregationId
          : congregationId // ignore: cast_nullable_to_non_nullable
              as String,
      visitDate: null == visitDate
          ? _value.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as String,
      midWeekAssistance: null == midWeekAssistance
          ? _value.midWeekAssistance
          : midWeekAssistance // ignore: cast_nullable_to_non_nullable
              as int,
      weekendAssistance: null == weekendAssistance
          ? _value.weekendAssistance
          : weekendAssistance // ignore: cast_nullable_to_non_nullable
              as int,
      inactivePublishers: null == inactivePublishers
          ? _value.inactivePublishers
          : inactivePublishers // ignore: cast_nullable_to_non_nullable
              as int,
      disassociatedPublishers: null == disassociatedPublishers
          ? _value.disassociatedPublishers
          : disassociatedPublishers // ignore: cast_nullable_to_non_nullable
              as int,
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VisitDTOImpl extends _VisitDTO {
  const _$VisitDTOImpl(
      {required this.id,
      this.previousVisit,
      @JsonKey(name: 'congregation_id') this.congregationId = '',
      @JsonKey(name: 'visit_date') this.visitDate = '',
      @JsonKey(name: 'mid_week_assistance') this.midWeekAssistance = 0,
      @JsonKey(name: 'weekend_assistance') this.weekendAssistance = 0,
      @JsonKey(name: 'inactive_publishers') this.inactivePublishers = 0,
      @JsonKey(name: 'disassociated_publishers')
      this.disassociatedPublishers = 0,
      final List<GroupDTO> groups = const []})
      : _groups = groups,
        super._();

  factory _$VisitDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisitDTOImplFromJson(json);

  @override
  final String id;
  @override
  final VisitDTO? previousVisit;
  @override
  @JsonKey(name: 'congregation_id')
  final String congregationId;
  @override
  @JsonKey(name: 'visit_date')
  final String visitDate;
  @override
  @JsonKey(name: 'mid_week_assistance')
  final int midWeekAssistance;
  @override
  @JsonKey(name: 'weekend_assistance')
  final int weekendAssistance;
  @override
  @JsonKey(name: 'inactive_publishers')
  final int inactivePublishers;
  @override
  @JsonKey(name: 'disassociated_publishers')
  final int disassociatedPublishers;
  final List<GroupDTO> _groups;
  @override
  @JsonKey()
  List<GroupDTO> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  String toString() {
    return 'VisitDTO(id: $id, previousVisit: $previousVisit, congregationId: $congregationId, visitDate: $visitDate, midWeekAssistance: $midWeekAssistance, weekendAssistance: $weekendAssistance, inactivePublishers: $inactivePublishers, disassociatedPublishers: $disassociatedPublishers, groups: $groups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.previousVisit, previousVisit) ||
                other.previousVisit == previousVisit) &&
            (identical(other.congregationId, congregationId) ||
                other.congregationId == congregationId) &&
            (identical(other.visitDate, visitDate) ||
                other.visitDate == visitDate) &&
            (identical(other.midWeekAssistance, midWeekAssistance) ||
                other.midWeekAssistance == midWeekAssistance) &&
            (identical(other.weekendAssistance, weekendAssistance) ||
                other.weekendAssistance == weekendAssistance) &&
            (identical(other.inactivePublishers, inactivePublishers) ||
                other.inactivePublishers == inactivePublishers) &&
            (identical(
                    other.disassociatedPublishers, disassociatedPublishers) ||
                other.disassociatedPublishers == disassociatedPublishers) &&
            const DeepCollectionEquality().equals(other._groups, _groups));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      previousVisit,
      congregationId,
      visitDate,
      midWeekAssistance,
      weekendAssistance,
      inactivePublishers,
      disassociatedPublishers,
      const DeepCollectionEquality().hash(_groups));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitDTOImplCopyWith<_$VisitDTOImpl> get copyWith =>
      __$$VisitDTOImplCopyWithImpl<_$VisitDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VisitDTOImplToJson(
      this,
    );
  }
}

abstract class _VisitDTO extends VisitDTO {
  const factory _VisitDTO(
      {required final String id,
      final VisitDTO? previousVisit,
      @JsonKey(name: 'congregation_id') final String congregationId,
      @JsonKey(name: 'visit_date') final String visitDate,
      @JsonKey(name: 'mid_week_assistance') final int midWeekAssistance,
      @JsonKey(name: 'weekend_assistance') final int weekendAssistance,
      @JsonKey(name: 'inactive_publishers') final int inactivePublishers,
      @JsonKey(name: 'disassociated_publishers')
      final int disassociatedPublishers,
      final List<GroupDTO> groups}) = _$VisitDTOImpl;
  const _VisitDTO._() : super._();

  factory _VisitDTO.fromJson(Map<String, dynamic> json) =
      _$VisitDTOImpl.fromJson;

  @override
  String get id;
  @override
  VisitDTO? get previousVisit;
  @override
  @JsonKey(name: 'congregation_id')
  String get congregationId;
  @override
  @JsonKey(name: 'visit_date')
  String get visitDate;
  @override
  @JsonKey(name: 'mid_week_assistance')
  int get midWeekAssistance;
  @override
  @JsonKey(name: 'weekend_assistance')
  int get weekendAssistance;
  @override
  @JsonKey(name: 'inactive_publishers')
  int get inactivePublishers;
  @override
  @JsonKey(name: 'disassociated_publishers')
  int get disassociatedPublishers;
  @override
  List<GroupDTO> get groups;
  @override
  @JsonKey(ignore: true)
  _$$VisitDTOImplCopyWith<_$VisitDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
