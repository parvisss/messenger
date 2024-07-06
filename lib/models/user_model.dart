import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  String id;
  String name;
  String email;
  UserModel({
    required this.id,
    required this.email,
    required this.name,
  });
}
