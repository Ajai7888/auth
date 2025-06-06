//import 'package:authmate/models/dashboard_response.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';

class UserDetailScreen extends StatelessWidget {
  final LocalUser user;

  const UserDetailScreen({super.key, required this.user});

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 6),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16, color: Colors.black87),
          children: [
            TextSpan(
              text: "$label: ",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${user.firstName} ${user.lastName}')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(user.image),
              ),
            ),

            _sectionTitle('Basic Info'),
            _infoRow('Full Name', '${user.firstName} ${user.lastName}'),
            _infoRow('Maiden Name', user.maidenName),
            _infoRow('Age', user.age.toString()),
            _infoRow('Gender', user.gender),
            _infoRow('Email', user.email),
            _infoRow('Phone', user.phone),
            _infoRow('Username', user.username),
            _infoRow('Birth Date', user.birthDate),
            _infoRow('Blood Group', user.bloodGroup),
            _infoRow('Height', '${user.height} cm'),
            _infoRow('Weight', '${user.weight} kg'),
            _infoRow('Eye Color', user.eyeColor),
            _infoRow('Role', user.role),
            _infoRow('IP Address', user.ip),
            _infoRow('MAC Address', user.macAddress),
            _infoRow('University', user.university),
            _infoRow('User Agent', user.userAgent),

            _sectionTitle('Hair'),
            _infoRow('Color', user.hair.color),
            _infoRow('Type', user.hair.type),

            _sectionTitle('Address'),
            _infoRow('Address', user.address.address),
            _infoRow('City', user.address.city),
            _infoRow(
              'State',
              '${user.address.state} (${user.address.stateCode})',
            ),
            _infoRow('Postal Code', user.address.postalCode),
            _infoRow('Country', user.address.country),
            _infoRow('Latitude', user.address.coordinates.lat.toString()),
            _infoRow('Longitude', user.address.coordinates.lng.toString()),

            _sectionTitle('Company'),
            _infoRow('Name', user.company.name),
            _infoRow('Department', user.company.department),
            _infoRow('Title', user.company.title),
            const SizedBox(height: 8),
            const Text(
              'Company Address:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            _infoRow('Address', user.company.address.address),
            _infoRow('City', user.company.address.city),
            _infoRow(
              'State',
              '${user.company.address.state} (${user.company.address.stateCode})',
            ),
            _infoRow('Postal Code', user.company.address.postalCode),
            _infoRow('Country', user.company.address.country),
            _infoRow(
              'Latitude',
              user.company.address.coordinates.lat.toString(),
            ),
            _infoRow(
              'Longitude',
              user.company.address.coordinates.lng.toString(),
            ),

            _sectionTitle('Bank'),
            _infoRow('Card Number', user.bank.cardNumber),
            _infoRow('Card Type', user.bank.cardType),
            _infoRow('Card Expiry', user.bank.cardExpire),
            _infoRow('Currency', user.bank.currency),
            _infoRow('IBAN', user.bank.iban),

            _sectionTitle('Crypto'),
            _infoRow('Coin', user.crypto.coin),
            _infoRow('Wallet', user.crypto.wallet),
            _infoRow('Network', user.crypto.network),

            _sectionTitle('Other'),
            _infoRow('EIN', user.ein),
            _infoRow('SSN', user.ssn),
          ],
        ),
      ),
    );
  }
}
