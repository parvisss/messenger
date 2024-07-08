import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages(
      {super.key, required this.messages, required this.currentUserId});
  final List messages;
  // ignore: prefer_typing_uninitialized_variables
  final currentUserId;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (ctx, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: currentUserId != messages[index]['senderId']
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  messages[index]['message'],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
