import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger/services/push_notification_service.dart';
import 'package:messenger/services/users_firestore_service.dart';

class UserController extends ChangeNotifier {
  final user = FirebaseAuth.instance.currentUser!;
  final firestoreService = UsersFirestoreService();
  final token = PushNotificationService().getToken();
  Future<void> register(String firstName, String? lastName) async {
    firestoreService.addUser(
      {
        "firstName": firstName,
        "lastName": lastName,
        "id": user.uid,
        "email": user.email,
        "token": await token,
      },
    );
  }

  Stream<QuerySnapshot> getusers() async* {
    yield* firestoreService.getUsers();
  }
}
