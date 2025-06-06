import 'package:hive/hive.dart';
import 'package:authmate/models/dashboard_response.dart' as dashboard;

part 'hair.g.dart';

@HiveType(typeId: 1)
class Hair {
  @HiveField(0)
  final String color;

  @HiveField(1)
  final String type;

  Hair({required this.color, required this.type});

  factory Hair.fromDashboardHair(dashboard.Hair dh) {
    return Hair(color: dh.color, type: dh.type);
  }

  dashboard.Hair toDashboardHair() {
    return dashboard.Hair(color: color, type: type);
  }
}
