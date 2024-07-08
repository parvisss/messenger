import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger/services/messages_fire_store_service.dart';

class MessageController with ChangeNotifier {
  final _messagesFirestoreService = MessagesFireStoreService();

  Stream<QuerySnapshot> getMessages(String chatroomId) async* {
    yield* _messagesFirestoreService.getMessages(chatroomId);
  }

  Future<void> sendMessage(String usersId, String message, String senderId,
      DateTime dateTime) async {
    _messagesFirestoreService.sendMessage(
      usersId,
      {
        "message": message,
        "senderId": senderId,
        "dateTime": dateTime,
      },
    );
  }
}
