// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupAdapter extends TypeAdapter<Group> {
  @override
  final int typeId = 2;

  @override
  Group read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Group(
      id: fields[0] as String,
      congregationId: fields[1] as String,
      visitId: fields[2] as String,
      responsible: fields[3] as String,
      groupNumber: fields[4] as int,
      studies: fields[5] as int,
      publisherWithoutStudies: fields[6] as int,
      activePublishers: fields[7] as int,
      baptizedPublishers: fields[8] as int,
      notBaptizedPublishers: fields[9] as int,
      regularPioneers: fields[10] as int,
      auxiliaryPioneers: fields[11] as int,
      irregularPublishers: (fields[12] as List).cast<String>(),
      potentialPioneers: (fields[13] as List).cast<String>(),
      potentialElders: (fields[14] as List).cast<String>(),
      potentialMinisterialServants: (fields[15] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Group obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.congregationId)
      ..writeByte(2)
      ..write(obj.visitId)
      ..writeByte(3)
      ..write(obj.responsible)
      ..writeByte(4)
      ..write(obj.groupNumber)
      ..writeByte(5)
      ..write(obj.studies)
      ..writeByte(6)
      ..write(obj.publisherWithoutStudies)
      ..writeByte(7)
      ..write(obj.activePublishers)
      ..writeByte(8)
      ..write(obj.baptizedPublishers)
      ..writeByte(9)
      ..write(obj.notBaptizedPublishers)
      ..writeByte(10)
      ..write(obj.regularPioneers)
      ..writeByte(11)
      ..write(obj.auxiliaryPioneers)
      ..writeByte(12)
      ..write(obj.irregularPublishers)
      ..writeByte(13)
      ..write(obj.potentialPioneers)
      ..writeByte(14)
      ..write(obj.potentialElders)
      ..writeByte(15)
      ..write(obj.potentialMinisterialServants);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
