import 'package:hive/hive.dart';
import 'package:authmate/models/dashboard_response.dart' as dashboard;
import 'address.dart';

part 'company.g.dart';

@HiveType(typeId: 5) // Unique Hive typeId for Company
class Company {
  @HiveField(0)
  final String department;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final Address address;

  Company({
    required this.department,
    required this.name,
    required this.title,
    required this.address,
  });

  factory Company.fromDashboardCompany(dashboard.Company dc) {
    return Company(
      department: dc.department,
      name: dc.name,
      title: dc.title,
      address: Address.fromDashboardAddress(dc.address),
    );
  }

  dashboard.Company toDashboardCompany() {
    return dashboard.Company(
      department: department,
      name: name,
      title: title,
      address: address.toDashboardAddress(),
    );
  }
}
