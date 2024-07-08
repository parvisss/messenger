import 'package:flutter/material.dart';
import 'package:messenger/views/screens/messages_screen.dart';

class Chats extends StatelessWidget {
  const Chats({super.key, required this.users});
  final List users;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          hoverColor: Colors.blue,
          title: Text(
            users[index]["firstName"],
            style: const TextStyle(color: Colors.black),
          ),
          subtitle: Text(
            users[index]["lastName"],
            style: const TextStyle(color: Colors.black),
          ),
          trailing: Text(
            users[index]["email"],
            style: const TextStyle(color: Colors.black),
          ),
          titleTextStyle: const TextStyle(fontSize: 20),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => MessagesScreen(
                  userid: users[index]['id'],
                  reseverToken: users[index]['token'],
                  userName: users[index]['firstName'],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
