import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  final authService = FirebaseAuth.instance;

  Future<void> login(String adress, String password) async {
    try {
      await authService.signInWithEmailAndPassword(
          email: adress, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register(String adress, String password) async {
    try {
      await authService.createUserWithEmailAndPassword(
          email: adress, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logOut() async {
    await authService.signOut();
  }
}
