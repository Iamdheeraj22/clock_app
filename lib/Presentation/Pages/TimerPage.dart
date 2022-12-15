import 'package:clock_app/Util/Common.dart';
import 'package:flutter/material.dart';

import '../widgets/CustomTimerPainter.dart';

class TimerPage extends StatefulWidget {
  TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> with TickerProviderStateMixin {
  AnimationController? controller;
  bool isStop = false;

  @override
  void initState() {
    super.initState();
    newMethod(25);
  }

  void newMethod(sec) {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: sec),
    );
  }

  String get timerString {
    Duration duration = (controller!.duration)! * (controller!.value);
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedBuilder(
          animation: controller!,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Expanded(
                          child: Align(
                            alignment: FractionalOffset.center,
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: CustomPaint(
                                        painter: CustomTimerPainter(
                                      animation: controller!,
                                      backgroundColor: Colors.white,
                                      color: Colors.blueAccent,
                                    )),
                                  ),
                                  Align(
                                    alignment: FractionalOffset.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          timerString,
                                          style: TextStyle(
                                              fontSize: 112.0,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: height(context) / 10,
                ),
                AnimatedBuilder(
                    animation: controller!,
                    builder: (context, child) {
                      return FloatingActionButton(
                        onPressed: () {
                          if (controller!.isAnimating) {
                            controller!.stop();
                          } else {
                            controller!.reverse(
                                from: controller!.value == 0.0
                                    ? 1.0
                                    : controller!.value);
                          }
                        },
                        child: Icon(controller!.isAnimating
                            ? Icons.pause
                            : Icons.play_arrow),
                      );
                    }),
              ],
            );
          }),
    );
  }
}

/**
 *  Container(
            height: height(context) / 2,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
          )
 */