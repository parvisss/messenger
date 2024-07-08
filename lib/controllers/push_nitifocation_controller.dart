import 'package:messenger/services/push_notification_service.dart';

class PushNotificationController {
  final _pushNotificationService = PushNotificationService();

  Future<void> sendNotification(
      String receiverToken, String title, String body) async {
    await _pushNotificationService.sendNotification(
      {
        'message': {
          'token': receiverToken,
          'notification': {
            'title': title,
            'body': body,
          }
        },
      },
    );
  }
}
