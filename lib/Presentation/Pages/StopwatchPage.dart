import 'dart:async';

import 'package:clock_app/Logic/cubit/stopwatch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Logic/Util/Common.dart';

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

  void stop() => {
        timer?.cancel(),
        setState(() {
          isStarted = false;
        })
      };

  void reset() => {
        timer?.cancel(),
        setState(() {
          seconds = 0;
          minutes = 0;
          hours = 0;
          time = "00:00:00";
          isStarted = false;
          _list.clear();
        }),
      };
  void addLap() => {
        setState(() {
          _list.add(time);
        })
      };

  void start() => {
        isStarted = true,
        timer = Timer.periodic(Duration(seconds: 1), (timer) {
          int localSeconds = seconds + 1;
          int localMinutes = minutes;
          int localHours = hours;

          setState(() {
            if (localSeconds > 59) {
              if (localMinutes > 59) {
                localHours++;
                localMinutes = 0;
              } else {
                localMinutes++;
                localSeconds = 0;
              }
            }
            seconds = localSeconds;
            minutes = localMinutes;
            hours = localHours;

            time = ((hours >= 10) ? hours.toString() : "0$hours") +
                ":" +
                ((minutes >= 10) ? minutes.toString() : "0$minutes") +
                ":" +
                ((seconds >= 10) ? seconds.toString() : "0$seconds");
          });
        })
      };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body:
            BlocBuilder<StopwatchCubit, StopwatchState>(builder: (ctx, state) {
          return Container(
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
                    child: Text(state.time,
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
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: _list.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Lap No: ${index + 1}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 20)),
                                Text(_list[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 20)),
                              ],
                            ),
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        color: Colors.blueAccent,
                        onPressed: () {
                          if (state.isStarted) {
                            ctx.read<StopwatchCubit>().stop();
                          } else {
                            ctx.read<StopwatchCubit>().start();
                          }
                        },
                        child: Text((state.isStarted) ? "Stop" : "Start"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      (state.isStarted)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    addLap();
                                  },
                                  child: Icon(Icons.flag),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                MaterialButton(
                                  color: Colors.red,
                                  onPressed: () {
                                    ctx.read<StopwatchCubit>().reset();
                                  },
                                  child: Text("Reset"),
                                ),
                              ],
                            )
                          : Container()
                    ],
                  ),
                  SizedBox()
                ]),
          );
        }));
  }
}
