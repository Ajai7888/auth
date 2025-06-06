import 'package:hive/hive.dart';
import 'package:authmate/models/dashboard_response.dart' as dashboard;

part 'coordinates.g.dart';

@HiveType(typeId: 2) // Unique Hive typeId for Coordinates
class Coordinates {
  @HiveField(0)
  final double lat;

  @HiveField(1)
  final double lng;

  Coordinates({required this.lat, required this.lng});

  factory Coordinates.fromDashboardCoordinates(dashboard.Coordinates dc) {
    return Coordinates(lat: dc.lat, lng: dc.lng);
  }

  dashboard.Coordinates toDashboardCoordinates() {
    return dashboard.Coordinates(lat: lat, lng: lng);
  }
}
