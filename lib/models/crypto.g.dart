// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoAdapter extends TypeAdapter<Crypto> {
  @override
  final int typeId = 6;

  @override
  Crypto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Crypto(
      coin: fields[0] as String,
      wallet: fields[1] as String,
      network: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Crypto obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.coin)
      ..writeByte(1)
      ..write(obj.wallet)
      ..writeByte(2)
      ..write(obj.network);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
