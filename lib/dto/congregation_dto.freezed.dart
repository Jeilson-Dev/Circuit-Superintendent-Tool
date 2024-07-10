// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'congregation_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CongregationDTO _$CongregationDTOFromJson(Map<String, dynamic> json) {
  return _CongregationDTO.fromJson(json);
}

/// @nodoc
mixin _$CongregationDTO {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  VisitDTO? get lastVisit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CongregationDTOCopyWith<CongregationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CongregationDTOCopyWith<$Res> {
  factory $CongregationDTOCopyWith(
          CongregationDTO value, $Res Function(CongregationDTO) then) =
      _$CongregationDTOCopyWithImpl<$Res, CongregationDTO>;
  @useResult
  $Res call({String id, String name, String city, VisitDTO? lastVisit});

  $VisitDTOCopyWith<$Res>? get lastVisit;
}

/// @nodoc
class _$CongregationDTOCopyWithImpl<$Res, $Val extends CongregationDTO>
    implements $CongregationDTOCopyWith<$Res> {
  _$CongregationDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? city = null,
    Object? lastVisit = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      lastVisit: freezed == lastVisit
          ? _value.lastVisit
          : lastVisit // ignore: cast_nullable_to_non_nullable
              as VisitDTO?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VisitDTOCopyWith<$Res>? get lastVisit {
    if (_value.lastVisit == null) {
      return null;
    }

    return $VisitDTOCopyWith<$Res>(_value.lastVisit!, (value) {
      return _then(_value.copyWith(lastVisit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CongregationDTOImplCopyWith<$Res>
    implements $CongregationDTOCopyWith<$Res> {
  factory _$$CongregationDTOImplCopyWith(_$CongregationDTOImpl value,
          $Res Function(_$CongregationDTOImpl) then) =
      __$$CongregationDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String city, VisitDTO? lastVisit});

  @override
  $VisitDTOCopyWith<$Res>? get lastVisit;
}

/// @nodoc
class __$$CongregationDTOImplCopyWithImpl<$Res>
    extends _$CongregationDTOCopyWithImpl<$Res, _$CongregationDTOImpl>
    implements _$$CongregationDTOImplCopyWith<$Res> {
  __$$CongregationDTOImplCopyWithImpl(
      _$CongregationDTOImpl _value, $Res Function(_$CongregationDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? city = null,
    Object? lastVisit = freezed,
  }) {
    return _then(_$CongregationDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      lastVisit: freezed == lastVisit
          ? _value.lastVisit
          : lastVisit // ignore: cast_nullable_to_non_nullable
              as VisitDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CongregationDTOImpl implements _CongregationDTO {
  const _$CongregationDTOImpl(
      {required this.id, this.name = '', this.city = '', this.lastVisit});

  factory _$CongregationDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CongregationDTOImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String city;
  @override
  final VisitDTO? lastVisit;

  @override
  String toString() {
    return 'CongregationDTO(id: $id, name: $name, city: $city, lastVisit: $lastVisit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CongregationDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.lastVisit, lastVisit) ||
                other.lastVisit == lastVisit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, city, lastVisit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CongregationDTOImplCopyWith<_$CongregationDTOImpl> get copyWith =>
      __$$CongregationDTOImplCopyWithImpl<_$CongregationDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CongregationDTOImplToJson(
      this,
    );
  }
}

abstract class _CongregationDTO implements CongregationDTO {
  const factory _CongregationDTO(
      {required final String id,
      final String name,
      final String city,
      final VisitDTO? lastVisit}) = _$CongregationDTOImpl;

  factory _CongregationDTO.fromJson(Map<String, dynamic> json) =
      _$CongregationDTOImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get city;
  @override
  VisitDTO? get lastVisit;
  @override
  @JsonKey(ignore: true)
  _$$CongregationDTOImplCopyWith<_$CongregationDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
