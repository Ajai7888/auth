// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalUserAdapter extends TypeAdapter<LocalUser> {
  @override
  final int typeId = 7;

  @override
  LocalUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalUser(
      id: fields[0] as int,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      maidenName: fields[3] as String,
      age: fields[4] as int,
      gender: fields[5] as String,
      email: fields[6] as String,
      phone: fields[7] as String,
      username: fields[8] as String,
      password: fields[9] as String,
      birthDate: fields[10] as String,
      image: fields[11] as String,
      bloodGroup: fields[12] as String,
      height: fields[13] as int,
      weight: fields[14] as double,
      eyeColor: fields[15] as String,
      hair: fields[16] as Hair,
      ip: fields[17] as String,
      address: fields[18] as Address,
      macAddress: fields[19] as String,
      university: fields[20] as String,
      bank: fields[21] as Bank,
      company: fields[22] as Company,
      ein: fields[23] as String,
      ssn: fields[24] as String,
      userAgent: fields[25] as String,
      crypto: fields[26] as Crypto,
      role: fields[27] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalUser obj) {
    writer
      ..writeByte(28)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.maidenName)
      ..writeByte(4)
      ..write(obj.age)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.username)
      ..writeByte(9)
      ..write(obj.password)
      ..writeByte(10)
      ..write(obj.birthDate)
      ..writeByte(11)
      ..write(obj.image)
      ..writeByte(12)
      ..write(obj.bloodGroup)
      ..writeByte(13)
      ..write(obj.height)
      ..writeByte(14)
      ..write(obj.weight)
      ..writeByte(15)
      ..write(obj.eyeColor)
      ..writeByte(16)
      ..write(obj.hair)
      ..writeByte(17)
      ..write(obj.ip)
      ..writeByte(18)
      ..write(obj.address)
      ..writeByte(19)
      ..write(obj.macAddress)
      ..writeByte(20)
      ..write(obj.university)
      ..writeByte(21)
      ..write(obj.bank)
      ..writeByte(22)
      ..write(obj.company)
      ..writeByte(23)
      ..write(obj.ein)
      ..writeByte(24)
      ..write(obj.ssn)
      ..writeByte(25)
      ..write(obj.userAgent)
      ..writeByte(26)
      ..write(obj.crypto)
      ..writeByte(27)
      ..write(obj.role);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
