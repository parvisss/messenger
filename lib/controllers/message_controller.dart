import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger/services/messages_fire_store_service.dart';

class MessageController with ChangeNotifier {
  final _messagesFirestoreService = MessagesFireStoreService();

  Stream<QuerySnapshot> getMessages() async* {
    yield* _messagesFirestoreService.getMessages();
  }
}
