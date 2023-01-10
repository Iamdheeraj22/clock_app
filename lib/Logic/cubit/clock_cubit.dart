import 'dart:async';

import 'package:clock_app/Logic/cubit/clock_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ClockCubit extends Cubit<ClockState> {
  ClockCubit()
      : super(ClockState(
            time: "Current Time",
            date: "Current Date",
            timeZone: "Current TimeZone"));
  var now = DateTime.now();
  var offSetSign = "";

  void currentTime() => emit(ClockState(
      time: getCurrentTime()[0],
      date: getCurrentTime()[1],
      timeZone: getCurrentTime()[2]));

  List<String> getCurrentTime() {
    var formattedTime = DateFormat("HH:mm").format(now);
    var formattedDate = DateFormat("EEE, d MMM").format(now);
    var timeString = now.timeZoneOffset.toString().split(".").first;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      emit(ClockState(
          time: formattedTime, date: formattedDate, timeZone: timeString));
    });

    return [formattedTime, formattedDate, timeString];
  }
}
