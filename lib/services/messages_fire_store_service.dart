import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesFireStoreService {
  final _firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> getMessages() async* {
    yield* _firestore.collection("chatRooms").snapshots();
  }
}
