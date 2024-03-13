import 'package:flutter/material.dart';
import 'package:sreeselvavinayagartemple/sessionHandler.dart';
//import 'firebase_options.dart';



// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();

//   print("Handling a background message: ${message.messageId}");
// }

// // ...
// FirebaseMessaging messaging = FirebaseMessaging.instance;
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
void main() async {
//     WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,

// );

  // final InitializationSettings initializationSettings = InitializationSettings(


  //   android: AndroidInitializationSettings('@mipmap/launcher_icon'),

  //   iOS: DarwinInitializationSettings(
  //     requestAlertPermission: true,
  //     requestBadgePermission: true,
  //     requestSoundPermission: true,
  //     onDidReceiveLocalNotification: (no, value, value2, value3) {},


  //   ),

  // );
  // await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );
  //  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true
  // );

  // FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
  //   print('Got a message whilst in the foreground!');
  //   print('Message data: ${message.data}');

  //   if (message.notification != null) {
  //     print('Message also contained a notification: ${message.notification}');
  //     await flutterLocalNotificationsPlugin.initialize(initializationSettings,onDidReceiveNotificationResponse: (payload){

  //       if(message.data['receiverid']!=null){
  //        // Get.to(ChatScreen(receiverId: message.data['receiverid'], receiverImageUrl:message.data['imageurl'], Name: message.data['username']));

  //       }



  //     });
  //     flutterLocalNotificationsPlugin.show(
  //         message.notification.hashCode,
  //         message.notification!.title,
  //         message.notification!.body,

  //         NotificationDetails(

  //           iOS: DarwinNotificationDetails(subtitle: message.notification!.body,categoryIdentifier: message.notification!.title,
            

  //           ),


  //           android: AndroidNotificationDetails(
  //             message.notification!.title!,
  //             message.notification!.title!,
  //             icon: '@mipmap/launcher_icon',



  //           ),
  //         )
  //     );


  //   }
  // });


  // FirebaseMessaging.onMessageOpenedApp.listen((event) { 

  //   if(event.data['receiverid']!=null){
  //    // Get.to(ChatScreen(receiverId: event.data['receiverid'], receiverImageUrl:event.data['imageurl'], Name: event.data['username']));


  //   }
    

    
    
    
  // });

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await FirebaseMessaging.instance.subscribeToTopic('admin');

 // print('User granted permission: ${settings.authorizationStatus}');
  runApp( const SessionHandler());
}

