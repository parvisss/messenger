import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger/controllers/message_controller.dart';
import 'package:messenger/controllers/push_nitifocation_controller.dart';
import 'package:messenger/services/notify.dart';
import 'package:messenger/services/push_notification_service.dart';
import 'package:messenger/views/widgets/messages.dart';

// ignore: must_be_immutable
class MessagesScreen extends StatefulWidget {
  String userid;
  String reseverToken;
  String userName;
  MessagesScreen(
      {super.key,
      required this.userid,
      required this.reseverToken,
      required this.userName});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

final sendMessageController = TextEditingController();
final pushNitifocationController = PushNotificationController();

class _MessagesScreenState extends State<MessagesScreen> {
  late String chatroom;

  @override
  void initState() {
    super.initState();
    final s = [widget.userid, FirebaseAuth.instance.currentUser!.uid]..sort();
    chatroom = s.join("-");
  }

  @override
  Widget build(BuildContext context) {
    final messagesController = MessageController();
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: messagesController.getMessages(chatroom),
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
          print(messages);
          return Column(
            children: [
              Flexible(
                child: Container(
                  width: double.infinity,
                  // height: 245.h,
                  child: Messages(
                    messages: messages,
                    currentUserId: widget.userid,
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: TextField(
                clipBehavior: Clip.hardEdge,
                controller: sendMessageController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  hintText: "Enter your messege",
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (sendMessageController.text.isNotEmpty &&
                          sendMessageController.text != '') {
                        messagesController.sendMessage(
                          chatroom,
                          sendMessageController.text,
                          widget.userid,
                          DateTime.now(),
                        );
                        pushNitifocationController.sendNotification(
                            widget.reseverToken,
                            widget.userName,
                            sendMessageController.text);
                        sendMessageController.text = '';
                      }
                    },
                    icon: const Icon(Icons.send),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
