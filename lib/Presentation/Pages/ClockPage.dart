import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Logic/Util/Common.dart';
import '../widgets/ClockView.dart';

class ClockPage extends StatefulWidget {
  ClockPage({Key? key}) : super(key: key);

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat("HH:mm").format(now);
    var formattedDate = DateFormat("EEE, d MMM").format(now);
    var timeString = now.timeZoneOffset.toString().split(".").first;
    var offSetSign = "";

    if (!timeString.startsWith("-")) offSetSign = "+";
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:const [
                 Text(
                  "Clock",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ],
            ),
          ),
          Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formattedTime.toString(),
                    style:const TextStyle(fontSize: 64, color: Colors.white),
                  ),
                  Text(
                    formattedDate,
                    style:const TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ],
              )),
          Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Transform.rotate(
                  angle: -pi / 2,
                  child: ClockView(
                    s: height(context) / 2,
                  ))),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const SizedBox(
                  height: 25,
                ),
              const  Text(
                  "Timezone",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              const  SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                   const Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                  const  SizedBox(
                      width: 10,
                    ),
                    Text(
                      "UTC   $offSetSign$timeString",
                      style:const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
