import 'dart:async';
import 'dart:math';

import 'package:clock_app/Presentation/widgets/ClockView.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFF2D2F41),
        ),
        child: Transform.rotate(angle: -pi / 2, child: ClockView()),
      ),
    );
  }
}
