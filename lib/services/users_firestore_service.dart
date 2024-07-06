import 'package:cloud_firestore/cloud_firestore.dart';

class UsersFirestoreService {
  final _firestore = FirebaseFirestore.instance;

  Future<void> addUser(Map<String, dynamic> data) async {
    try {
      await _firestore.collection("users").add(data);
    } catch (e) {
      rethrow;
    }
  }

  Stream<QuerySnapshot> getUsers() async* {
    yield* _firestore.collection("users").snapshots();
  }

  
}
