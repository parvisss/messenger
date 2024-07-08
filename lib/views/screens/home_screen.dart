import 'package:flutter/material.dart';
import 'package:messenger/controllers/user_controller.dart';
import 'package:messenger/services/auth_service.dart';
import 'package:messenger/views/widgets/chats.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  get builder => null;

  @override
  Widget build(BuildContext context) {
    final users = UserController();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              AuthService().logOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: users.getusers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
          final users = snapshot.data!.docs;

          return Chats(
            users: users,
          );
        },
      ),
    );
  }
}
