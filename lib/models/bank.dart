import 'package:hive/hive.dart';
import 'package:authmate/models/dashboard_response.dart' as dashboard;

part 'bank.g.dart';

@HiveType(typeId: 4)
class Bank {
  @HiveField(0)
  final String cardNumber;

  @HiveField(1)
  final String cardType;

  @HiveField(2)
  final String cardExpire;

  @HiveField(3)
  final String currency;

  @HiveField(4)
  final String iban;

  Bank({
    required this.cardNumber,
    required this.cardType,
    required this.cardExpire,
    required this.currency,
    required this.iban,
  });

  factory Bank.fromDashboardBank(dashboard.Bank bank) {
    return Bank(
      cardNumber: bank.cardNumber,
      cardType: bank.cardType,
      cardExpire: bank.cardExpire,
      currency: bank.currency,
      iban: bank.iban,
    );
  }

  dashboard.Bank toDashboardBank() {
    return dashboard.Bank(
      cardNumber: cardNumber,
      cardType: cardType,
      cardExpire: cardExpire,
      currency: currency,
      iban: iban,
    );
  }
}
