import 'package:authmate/models/user.dart';
import 'package:flutter/material.dart';
import '../models/dashboard_response.dart';
import '../services/api_service.dart';
import 'user_detail_screen.dart';
import '../utils/mappers.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late Future<DashboardResponse?> _futureUsers;

  @override
  void initState() {
    super.initState();
    _futureUsers = ApiService.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User List')),
      body: FutureBuilder<DashboardResponse?>(
        future: _futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.users.isEmpty) {
            return const Center(child: Text('No users found.'));
          } else {
            final users = snapshot.data!.users;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.image),
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.email),
                  onTap: () {
                    final localUser = mapApiUserToHiveUser(user);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserDetailScreen(user: localUser),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
