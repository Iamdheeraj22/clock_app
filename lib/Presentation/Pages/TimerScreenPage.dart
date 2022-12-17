import 'dart:async';

import 'package:clock_app/Util/Common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TimerScreenPage extends StatefulWidget {
  TimerScreenPage({Key? key}) : super(key: key);

  @override
  State<TimerScreenPage> createState() => _TimerScreenPageState();
}

class _TimerScreenPageState extends State<TimerScreenPage> {
  static const maxSeconds = 50;
  int seconds = maxSeconds;
  Timer? timer;

  void resetTimer() => setState(() {
        seconds = maxSeconds;
      });
  void startTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        stopTimer(reset: false);
      }
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    setState(() {
      timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(200)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: seconds == 0
                        ? Icon(
                            Icons.done,
                            color: Colors.blueAccent,
                            size: 100,
                          )
                        : Text(
                            seconds == 0 ? "$maxSeconds" : "$seconds",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w600),
                          ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: CircularProgressIndicator(
                      value: seconds == 0
                          ? double.parse(maxSeconds.toString())
                          : (seconds / maxSeconds),
                      strokeWidth: 12,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height(context) / 15,
            ),
            buildButtons()
          ],
        ),
      ),
    );
  }

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = seconds == maxSeconds || seconds == 0;
    return isRunning || !isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.blueAccent,
                onPressed: () {
                  if (isRunning) {
                    stopTimer(reset: false);
                  } else {
                    startTimer(reset: false);
                  }
                },
                child: Text(isRunning ? "Pause" : "Resume"),
              ),
              SizedBox(
                width: 20,
              ),
              MaterialButton(
                color: Colors.blueAccent,
                onPressed: () {
                  stopTimer();
                },
                child: Text("Reset"),
              ),
            ],
          )
        : MaterialButton(
            color: Colors.blueAccent,
            onPressed: () {
              startTimer();
            },
            child: Text("Start"),
          );
  }
}
/**
 * Container(
                    height: seconds / maxSeconds,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(200)),
                  ),
 */