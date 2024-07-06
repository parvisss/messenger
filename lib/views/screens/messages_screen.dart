import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:messenger/controllers/message_controller.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

final sendMessageController = TextEditingController();

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    final messagesController = MessageController();
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: messagesController.getMessages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
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
          final messages = snapshot.data!.docs;
          return Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.amber,
                height: 250.h,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "salom",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: TextField(
                          controller: sendMessageController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter your messege"),
                        ),
                      ),
                      const Gap(10),
                      IconButton(
                        onPressed: () {
                          print("--------------------------------------------");
                          print(messages[0].data());
                          print("--------------------------------------------");
                        },
                        icon: const Icon(Icons.send),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
