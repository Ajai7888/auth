// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BankAdapter extends TypeAdapter<Bank> {
  @override
  final int typeId = 4;

  @override
  Bank read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bank(
      cardNumber: fields[0] as String,
      cardType: fields[1] as String,
      cardExpire: fields[2] as String,
      currency: fields[3] as String,
      iban: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Bank obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.cardNumber)
      ..writeByte(1)
      ..write(obj.cardType)
      ..writeByte(2)
      ..write(obj.cardExpire)
      ..writeByte(3)
      ..write(obj.currency)
      ..writeByte(4)
      ..write(obj.iban);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
