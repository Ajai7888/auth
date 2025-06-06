import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Your existing imports
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'utils/token_storage.dart';
import 'models/login_response.dart'; // contains UserDetail class

// Import Hive models & adapters (you must have these files & adapters generated)
import 'models/hair.dart';
import 'models/address.dart';
import 'models/bank.dart';
import 'models/company.dart';
import 'models/crypto.dart';
import 'models/user.dart';
import 'models/coordinates.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive adapters
  Hive.registerAdapter(HairAdapter());
  Hive.registerAdapter(AddressAdapter());
  Hive.registerAdapter(BankAdapter());
  Hive.registerAdapter(CompanyAdapter());
  Hive.registerAdapter(CryptoAdapter());
  Hive.registerAdapter(LocalUserAdapter());
  Hive.registerAdapter(CoordinatesAdapter());
  // Open Hive box for user data caching
  await Hive.openBox<LocalUser>('users');

  // You can add other async initialization code here if needed

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Get stored token from secure storage or shared preferences
  Future<String?> _getStoredToken() async {
    try {
      return await TokenStorage.getToken();
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Token Auth App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: FutureBuilder<String?>(
        future: _getStoredToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for token check, show loader
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else {
            final token = snapshot.data;
            if (token != null && token.isNotEmpty) {
              // Token found - auto login with dummy user data
              final dummyUser = UserDetail(
                userid: 0,
                firstname: 'Auto',
                lastname: 'Login',
                email: 'auto@login.com',
                usertitle: 'User',
                userimageurl: '',
              );
              return HomeScreen(token: token, user: dummyUser);
            } else {
              // No token - show login screen
              return const LoginScreen();
            }
          }
        },
      ),
    );
  }
}
