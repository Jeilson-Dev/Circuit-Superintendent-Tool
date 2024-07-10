// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VisitAdapter extends TypeAdapter<Visit> {
  @override
  final int typeId = 3;

  @override
  Visit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Visit(
      id: fields[0] as String,
      previousVisit: fields[1] as String?,
      congregationId: fields[2] as String,
      visitDate: fields[3] as String,
      midWeekAssistance: fields[4] as int,
      weekendAssistance: fields[5] as int,
      inactivePublishers: fields[6] as int,
      disassociatedPublishers: fields[7] as int,
      groups: (fields[8] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Visit obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.previousVisit)
      ..writeByte(2)
      ..write(obj.congregationId)
      ..writeByte(3)
      ..write(obj.visitDate)
      ..writeByte(4)
      ..write(obj.midWeekAssistance)
      ..writeByte(5)
      ..write(obj.weekendAssistance)
      ..writeByte(6)
      ..write(obj.inactivePublishers)
      ..writeByte(7)
      ..write(obj.disassociatedPublishers)
      ..writeByte(8)
      ..write(obj.groups);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VisitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
