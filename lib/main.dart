import 'package:clock_app/Provider/MenuInfo.dart';
import 'package:clock_app/Util/Enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Presentation/Pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
          create: (context) => MenuInfo(MenuType.clock), child: HomePage()),
    );
  }
}
