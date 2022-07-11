// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interest_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InterestHiveAdapter extends TypeAdapter<InterestHive> {
  @override
  final int typeId = 0;

  @override
  InterestHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InterestHive()
      ..id = fields[0] as String?
      ..createdAt = fields[1] as int?
      ..updatedAt = fields[2] as int?
      ..name = fields[3] as String?
      ..icon = fields[4] as String?;
  }

  @override
  void write(BinaryWriter writer, InterestHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.updatedAt)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InterestHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
