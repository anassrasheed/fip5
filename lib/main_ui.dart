import 'package:fip5/config/app_colors.dart';
import 'package:fip5/getx/counter_example/couter_controller.dart';
import 'package:fip5/getx/sum_example/sum_view.dart';
import 'package:fip5/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';
import 'getx/navigators/screen_a.dart';
import 'l10n/app_language.dart';
import 'old/generated/l10n.dart';

const AndroidNotificationChannel androidChannel = AndroidNotificationChannel(
    'android_channel', // id
    'High Importance Notifications', // title
    // 'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId} ${message
      .notification!.title}');
  showNotification(
      message.notification!.title ?? '', message.notification!.body ?? '');
}

void showNotification(String title, String body) {
  flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      NotificationDetails(
          android: AndroidNotificationDetails(
              androidChannel.id, androidChannel.name,
              importance: Importance.max,
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher')));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // be ready firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(androidChannel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(ScopedModel<AppLanguage>(
    model: AppLanguage(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification!;
      AndroidNotification android = message.notification!.android!;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                androidChannel.id,
                androidChannel.name,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppLanguage>(builder: (context, child, model) {
      return Sizer(builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          home: LoginScreen(),
          locale: model.appLocale,
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          theme: ThemeData(
            // colors
              primaryColor: AppColors.primaryColor,
              accentColor: Colors.black,
              backgroundColor: Colors.white,
              scaffoldBackgroundColor: Colors.white,
              buttonColor: Colors.red,
              fontFamily: "trojan",
              // textTheme: GoogleFonts.abelTextTheme(Theme.of(context).textTheme),
              // ctrl + s  hotReload
              shadowColor: Colors.red),
          // routes: {
          //   "/screenA": (c) => ScreenA(),
          //   "/screenB": (c) => ScreenB(),
          //   "/screenC": (c) => const ScreenC(),
          // },
          getPages: [
            GetPage(
              name: "/screenA",
              page: () => ScreenA(),
            )
          ],
          // initialRoute: "/screenA",
          title: "Fip5",
          debugShowCheckedModeBanner: false,
          initialBinding: MyBinding(),
        );
      });
      // wid
    });
  }
}

class MyBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(()=>SumController(),fenix: true); // no cache data
    Get.put(CounterController());
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Fip5"),
        shadowColor: Colors.red,
        elevation: 1,
        centerTitle: true,
        leading: const Text("asjdhaskjdhkjsdfdsfdsfdsfashdkj"),
        actions: const [
          Icon(Icons.add),
          Icon(Icons.remove),
          Text("Anas"),
          Text("Sami"),
        ],
        backgroundColor: Colors.red,
        leadingWidth: 150,
        iconTheme:
        const IconThemeData(color: Colors.green, size: 20, weight: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        // leadingWidth: ,
      ),
      body: SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Container(
            color: Colors.yellow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Anas"),
                Text("Hussain"),
              ],
            ),
          )), // column row
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
// listView with Future
// shimmer
