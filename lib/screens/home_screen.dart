import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/login_response.dart'; // For UserDetail
import '../models/dashboard_response.dart'; // For DashboardResponse & API User
import '../models/user.dart'; // For Hive User model (LocalUser)
import '../services/api_service.dart';
import '../utils/token_storage.dart';
import 'login_screen.dart';
import 'user_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  final String token;
  final UserDetail user;

  const HomeScreen({required this.token, required this.user, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<LocalUser>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _usersFuture = _getUsersCachedOrFetch();
  }

  Future<List<LocalUser>> _getUsersCachedOrFetch() async {
    final box = await Hive.openBox<LocalUser>('users');

    if (box.isNotEmpty) {
      // Return cached users
      print("Hive cache found ${box.length} users. Loading from cache.");
      return box.values.toList();
    } else {
      // Fetch from API
      print("Hive cache empty. Fetching users from API...");
      final dashboardResponse = await ApiService.getUsers(token: widget.token);
      final apiUsers = dashboardResponse.users;

      // Convert API users to Hive users
      final hiveUsers =
          apiUsers.map((du) => LocalUser.fromDashboardUser(du)).toList();

      // Cache users in Hive box
      for (var user in hiveUsers) {
        await box.put(user.id, user);
      }

      print("Cached ${hiveUsers.length} users into Hive.");
      return hiveUsers;
    }
  }

  Future<void> _logout() async {
    await TokenStorage.clearToken();
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  // Debug function to print all cached users in Hive box
  Future<void> _printCachedUsers() async {
    final box = await Hive.openBox<LocalUser>('users');
    print("---- Cached Users in Hive ----");
    for (var user in box.values) {
      print("User: ${user.firstName} ${user.lastName}, Email: ${user.email}");
    }
    print("------------------------------");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome ${widget.user.firstname}', // Note lowercase 'firstname'
        ),
        actions: [
          IconButton(
            onPressed: _logout,
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: FutureBuilder<List<LocalUser>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final users = snapshot.data ?? [];

          if (users.isEmpty) {
            return const Center(child: Text('No users found.'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: users.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.image),
                ),
                title: Text(
                  '${user.firstName} ${user.lastName}',
                ), // Use exact case from your LocalUser model
                subtitle: Text(user.email),
                trailing: Text(user.role),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => UserDetailScreen(user: user),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _printCachedUsers,
        tooltip: 'Print Cached Users',
        child: const Icon(Icons.print),
      ),
    );
  }
}
