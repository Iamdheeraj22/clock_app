import 'dart:async';

import 'package:flutter/material.dart';

import '../../Util/Common.dart';

class StopwatchPage extends StatefulWidget {
  StopwatchPage({Key? key}) : super(key: key);

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  int seconds = 0, minutes = 0, hours = 0;
  var time = "00:00:00";
  List<String> _list = [];
  Timer? timer;
  bool isStarted = false;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: EdgeInsets.only(top: height(context) / 15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Stopwatch",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 24),
                ),
                Center(
                  child: Text("00:00:00",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: height(context) / 9)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: height(context) / 2,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 82, 82),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      color: Colors.blueAccent,
                      onPressed: () {},
                      child: Text("Start"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.flag),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    MaterialButton(
                      color: Colors.red,
                      onPressed: () {},
                      child: Text("Reset"),
                    ),
                  ],
                ),
                SizedBox()
              ]),
        ));
  }
}
