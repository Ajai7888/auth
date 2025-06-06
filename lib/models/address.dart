import 'package:hive/hive.dart';
import 'package:authmate/models/dashboard_response.dart' as dashboard;
import 'coordinates.dart';

part 'address.g.dart';

@HiveType(typeId: 3) // Unique Hive typeId for Address
class Address {
  @HiveField(0)
  final String address;

  @HiveField(1)
  final String city;

  @HiveField(2)
  final String state;

  @HiveField(3)
  final String stateCode;

  @HiveField(4)
  final String postalCode;

  @HiveField(5)
  final Coordinates coordinates;

  @HiveField(6)
  final String country;

  Address({
    required this.address,
    required this.city,
    required this.state,
    required this.stateCode,
    required this.postalCode,
    required this.coordinates,
    required this.country,
  });

  factory Address.fromDashboardAddress(dashboard.Address da) {
    return Address(
      address: da.address,
      city: da.city,
      state: da.state,
      stateCode: da.stateCode,
      postalCode: da.postalCode,
      coordinates: Coordinates.fromDashboardCoordinates(da.coordinates),
      country: da.country,
    );
  }

  dashboard.Address toDashboardAddress() {
    return dashboard.Address(
      address: address,
      city: city,
      state: state,
      stateCode: stateCode,
      postalCode: postalCode,
      coordinates: coordinates.toDashboardCoordinates(),
      country: country,
    );
  }
}
