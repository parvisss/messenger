import 'package:flutter/material.dart';
import 'package:messenger/views/screens/messages_screen.dart';

class Messages extends StatelessWidget {
  const Messages({super.key, required this.users});
  final List users;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          hoverColor: Colors.blue,
          title: Text(users[index]["firstName"]),
          subtitle: Text(users[index]["lastName"]),
          trailing: Text(users[index]["email"]),
          titleTextStyle: const TextStyle(fontSize: 20),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const MessagesScreen(),
              ),
            );
          },
        );
      },
    );
  }
}
