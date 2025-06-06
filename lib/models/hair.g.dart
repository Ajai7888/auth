// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hair.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HairAdapter extends TypeAdapter<Hair> {
  @override
  final int typeId = 1;

  @override
  Hair read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hair(
      color: fields[0] as String,
      type: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Hair obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.color)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HairAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
