import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesFireStoreService {
  final _firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> getMessages(
    String chatroomId,
  ) async* {
    yield* _firestore
        .collection("chatRooms")
        .doc(chatroomId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots();
  }

  Future<void> sendMessage(
      String usersId, Map<String, dynamic> messageData) async {
    try {
      await _firestore
          .collection("chatRooms")
          .doc(usersId)
          .collection("messages")
          .add(
            messageData
          );
    } catch (e) {
      rethrow;
    }
  }
}
