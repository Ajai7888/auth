import 'package:hive/hive.dart';
import 'package:authmate/models/dashboard_response.dart' as dashboard;

import 'hair.dart';
import 'address.dart';
import 'bank.dart';
import 'company.dart';
import 'crypto.dart';

part 'user.g.dart';

@HiveType(typeId: 7) // Unique Hive typeId for LocalUser
class LocalUser {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String firstName;

  @HiveField(2)
  final String lastName;

  @HiveField(3)
  final String maidenName;

  @HiveField(4)
  final int age;

  @HiveField(5)
  final String gender;

  @HiveField(6)
  final String email;

  @HiveField(7)
  final String phone;

  @HiveField(8)
  final String username;

  @HiveField(9)
  final String password;

  @HiveField(10)
  final String birthDate;

  @HiveField(11)
  final String image;

  @HiveField(12)
  final String bloodGroup;

  @HiveField(13)
  final int height;

  @HiveField(14)
  final double weight;

  @HiveField(15)
  final String eyeColor;

  @HiveField(16)
  final Hair hair;

  @HiveField(17)
  final String ip;

  @HiveField(18)
  final Address address;

  @HiveField(19)
  final String macAddress;

  @HiveField(20)
  final String university;

  @HiveField(21)
  final Bank bank;

  @HiveField(22)
  final Company company;

  @HiveField(23)
  final String ein;

  @HiveField(24)
  final String ssn;

  @HiveField(25)
  final String userAgent;

  @HiveField(26)
  final Crypto crypto;

  @HiveField(27)
  final String role;

  LocalUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    required this.crypto,
    required this.role,
  });

  /// Factory to convert from API model User to Hive LocalUser
  factory LocalUser.fromDashboardUser(dashboard.User du) {
    return LocalUser(
      id: du.id,
      firstName: du.firstName,
      lastName: du.lastName,
      maidenName: du.maidenName,
      age: du.age,
      gender: du.gender,
      email: du.email,
      phone: du.phone,
      username: du.username,
      password: du.password,
      birthDate: du.birthDate,
      image: du.image,
      bloodGroup: du.bloodGroup,
      height: du.height.toInt(),
      weight: du.weight,
      eyeColor: du.eyeColor,
      hair: Hair.fromDashboardHair(du.hair),
      ip: du.ip,
      address: Address.fromDashboardAddress(du.address),
      macAddress: du.macAddress,
      university: du.university,
      bank: Bank.fromDashboardBank(du.bank),
      company: Company.fromDashboardCompany(du.company),
      ein: du.ein,
      ssn: du.ssn,
      userAgent: du.userAgent,
      crypto: Crypto.fromDashboardCrypto(du.crypto),
      role: du.role,
    );
  }

  /// Convert LocalUser back to API model User
  dashboard.User toDashboardUser() {
    return dashboard.User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      maidenName: maidenName,
      age: age,
      gender: gender,
      email: email,
      phone: phone,
      username: username,
      password: password,
      birthDate: birthDate,
      image: image,
      bloodGroup: bloodGroup,
      height: height.toDouble(),
      weight: weight,
      eyeColor: eyeColor,
      hair: hair.toDashboardHair(),
      ip: ip,
      address: address.toDashboardAddress(),
      macAddress: macAddress,
      university: university,
      bank: bank.toDashboardBank(),
      company: company.toDashboardCompany(),
      ein: ein,
      ssn: ssn,
      userAgent: userAgent,
      crypto: crypto.toDashboardCrypto(),
      role: role,
    );
  }
}
