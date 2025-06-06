import 'package:authmate/models/dashboard_response.dart' as api;
import 'package:authmate/models/coordinates.dart';

import 'package:authmate/models/user.dart'; // LocalUser
import 'package:authmate/models/hair.dart'; // Hair
import 'package:authmate/models/address.dart'; // Address
import 'package:authmate/models/company.dart'; // Company
import 'package:authmate/models/crypto.dart'; // Crypto
import 'package:authmate/models/bank.dart'; // Bank

Hair mapHair(api.Hair apiHair) {
  return Hair(color: apiHair.color, type: apiHair.type);
}

Address mapAddress(api.Address apiAddress) {
  return Address(
    address: apiAddress.address,
    city: apiAddress.city,
    state: apiAddress.state,
    stateCode: apiAddress.stateCode,
    postalCode: apiAddress.postalCode,
    coordinates: Coordinates.fromDashboardCoordinates(apiAddress.coordinates),
    country: apiAddress.country,
  );
}

Bank mapBank(api.Bank apiBank) {
  return Bank(
    cardExpire: apiBank.cardExpire,
    cardNumber: apiBank.cardNumber,
    cardType: apiBank.cardType,
    currency: apiBank.currency,
    iban: apiBank.iban,
  );
}

Company mapCompany(api.Company apiCompany) {
  return Company(
    name: apiCompany.name,
    department: apiCompany.department,
    title: apiCompany.title,
    address: mapAddress(apiCompany.address),
  );
}

Crypto mapCrypto(api.Crypto apiCrypto) {
  return Crypto(
    coin: apiCrypto.coin,
    wallet: apiCrypto.wallet,
    network: apiCrypto.network,
  );
}

LocalUser mapApiUserToHiveUser(api.User apiUser) {
  return LocalUser(
    id: apiUser.id,
    firstName: apiUser.firstName,
    lastName: apiUser.lastName,
    maidenName: apiUser.maidenName,
    age: apiUser.age,
    gender: apiUser.gender,
    email: apiUser.email,
    phone: apiUser.phone,
    username: apiUser.username,
    password: apiUser.password,
    birthDate: apiUser.birthDate,
    image: apiUser.image,
    bloodGroup: apiUser.bloodGroup,
    height: apiUser.height.toInt(),
    weight: apiUser.weight,
    eyeColor: apiUser.eyeColor,
    hair: mapHair(apiUser.hair),
    ip: apiUser.ip,
    address: mapAddress(apiUser.address),
    macAddress: apiUser.macAddress,
    university: apiUser.university,
    bank: mapBank(apiUser.bank),
    company: mapCompany(apiUser.company),
    ein: apiUser.ein,
    ssn: apiUser.ssn,
    userAgent: apiUser.userAgent,
    crypto: mapCrypto(apiUser.crypto),
    role: apiUser.role,
  );
}
