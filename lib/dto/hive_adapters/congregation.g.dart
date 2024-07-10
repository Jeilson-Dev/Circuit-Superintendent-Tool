// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'congregation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CongregationAdapter extends TypeAdapter<Congregation> {
  @override
  final int typeId = 1;

  @override
  Congregation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Congregation(
      id: fields[0] as String,
      name: fields[1] as String,
      city: fields[2] as String,
      lastVisitId: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Congregation obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.lastVisitId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CongregationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
