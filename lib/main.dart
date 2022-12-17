import 'package:clock_app/Logic/cubit/stopwatch_cubit.dart';
import 'package:clock_app/Provider/MenuInfo.dart';
import 'package:clock_app/Logic/Util/Enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'Presentation/Pages/HomePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
          create: (context) => MenuInfo(MenuType.clock), child: HomePage()),
    );
  }
}
/***
 * 
 *  final AndroidInitializationSettings initialisationSetting_android =
      AndroidInitializationSettings("unknown_code");

  final InitializationSettings initializationSettings =
      InitializationSettings(android: initialisationSetting_android);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
 */
  // void onDidReceiveLocalNotification(
  //   {int id, String title, String body, String payload}) async {
  // // display a dialog with the notification details, tap ok to go to another page
  // showDialog(
  //   context: context,
  //   builder: (BuildContext context) => CupertinoAlertDialog(
  //     title: Text(title),
  //     content: Text(body),
  //     actions: [
  //       CupertinoDialogAction(
  //         isDefaultAction: true,
  //         child: Text('Ok'),
  //         onPressed: () async {
  //           // Navigator.of(context, rootNavigator: true).pop();
  //           // await Navigator.push(
  //           //   context,
  //           //   MaterialPageRoute(
  //           //     builder: (context) => SecondScreen(payload),
  //           //   ),
  //           // );
  //         },
  //       )
  //     ],
  //   ),
  // );

