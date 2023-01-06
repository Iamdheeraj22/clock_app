import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'stopwatch_state.dart';

class StopwatchCubit extends Cubit<StopwatchState> {
  int seconds = 0, minutes = 0, hours = 0;
  String time = "";
  Timer? timer;
  bool isStarted = false;
  StopwatchCubit() : super(StopwatchState(time: "00:00:00", isStarted: false));

  void start() => emit(StopwatchState(
      time: startFun()[0], isStarted: startFun()[1] == "t" ? true : false));
  void stop() => emit(StopwatchState(
      time: stopFun()[0], isStarted: stopFun()[1] == "t" ? true : false));
  void reset() => emit(StopwatchState(
      time: resetFun()[0], isStarted: resetFun()[1] == "t" ? true : false));

  List resetFun() {
    timer?.cancel();
    seconds = 0;
    minutes = 0;
    hours = 0;
    time = "00:00:00";
    isStarted = false;
    return [time, isStarted ? "t" : "f"];
  }

  List stopFun() {
    timer?.cancel();
    isStarted = false;
    return [time, isStarted ? "t" : "f"];
  }

  List startFun() {
    isStarted = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

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
      print(time);
    });
    return [time, isStarted ? "t" : "f"];
  }
}
