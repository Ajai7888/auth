import 'package:hive/hive.dart';
import 'package:authmate/models/dashboard_response.dart' as dashboard;

part 'crypto.g.dart';

@HiveType(typeId: 6) // Unique Hive typeId for Crypto
class Crypto {
  @HiveField(0)
  final String coin;

  @HiveField(1)
  final String wallet;

  @HiveField(2)
  final String network;

  Crypto({required this.coin, required this.wallet, required this.network});

  factory Crypto.fromDashboardCrypto(dashboard.Crypto dc) {
    return Crypto(coin: dc.coin, wallet: dc.wallet, network: dc.network);
  }

  dashboard.Crypto toDashboardCrypto() {
    return dashboard.Crypto(coin: coin, wallet: wallet, network: network);
  }
}
