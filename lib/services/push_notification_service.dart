import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';

class PushNotificationService {
  static final _pushNotification = FirebaseMessaging.instance;

  //! Push Notification uchun ruxsat so'raymiz
  static Future<void> init() async {
    await Firebase.initializeApp(); // Firebase ilovasini ishga tushirish

    // notificationni sozlamalarini qaytaradi va bu orqali ruhsat beirilgan yoki yuq ligini bilib olsak buladi
    final notificationSettings = await _pushNotification.requestPermission(
      provisional: true,
    );

    // ruxsat holati
    print(notificationSettings.authorizationStatus);

    //? Dasturda vaqti xabarni olish uchun
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        print('DASTURDA VAQTIMIZ KELDI');
        print('XABAR: ${message.data}');

        if (message.notification != null) {
          print('XABARDAGI ASOSIY MA\'LUMOT: ${message.notification!.title}');
        }
      },
    );

    //? Orqa fonda xabarni ustiga bosib dasturga kirgan vaqtda
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("ORQA FONDAN DASTURGA KIRIB KELDIM");
    });

    //? Orqa fonda xabarni olish uchun
    FirebaseMessaging.onBackgroundMessage(
      _firebaseMessagingBackgroundHandler,
    );

    await FirebaseMessaging.instance.subscribeToTopic("KunlikMotivatsiyalar");
  }

  //! quirlma TOKEN'ni olamiz (shu orqali kimga xabar yuborishni bilamiz)
  Future<String?> getToken() async {
    final token = await _pushNotification.getToken();
    return token;
  }

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();

    print("ORQA FONDA XABAR KELDI: ${message.notification!.body}");
  }

  //!habarni yuborish
  Future<void> sendNotification(Map notificationData) async {
    final serviceAccount = await rootBundle.loadString("service-account.json");

    var accountCredentials = ServiceAccountCredentials.fromJson(serviceAccount);

    var scopes = ['https://www.googleapis.com/auth/cloud-platform'];

    final client = await clientViaServiceAccount(accountCredentials, scopes);
    print(client.credentials.accessToken);

    const projectId = "messages-5e9bc";
    Uri url = Uri.parse(
      "https://fcm.googleapis.com/v1/projects/$projectId/messages:send",
    );

    final response = await client.post(
      url,
      headers: {
        'content-type': 'application/json',
        'Authorization': 'Bearer ${client.credentials.accessToken}',
      },
      body: jsonEncode(notificationData),
    );

    client.close();
    if (response.statusCode == 200) {
      print("YUBORILDI");
    } else {
      print("_______________________________________________________");

      print("_______________________________________________________");
      print(
          'Notification Sending Error Response status: ${response.statusCode}');
      print('Notification Response body: ${response.body}');
      print("_______________________________________________________");
      print("_______________________________________________________");
    }
  }
}
