import 'package:clock_app/Provider/MenuInfo.dart';
import 'package:clock_app/Util/Enums.dart';
import 'package:flutter/widgets.dart';

import '../Provider/AlarmInfo.dart';
import 'CustomColors.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock, title: "Clock", imageResource: "assets/clock.png"),
  MenuInfo(MenuType.alarm,
      title: "Alarm", imageResource: "assets/alarm_clock.png"),
  MenuInfo(MenuType.timer, title: "Timer", imageResource: "assets/timer.png"),
  MenuInfo(MenuType.stopwatch,
      title: "Stopwatch", imageResource: "assets/stopwatch.png"),
];

List<AlarmInfo> alarmList = [
  AlarmInfo(DateTime.now().add(Duration(hours: 1)),
      description: "Office", gradientColors: GradientColors.sky),
  AlarmInfo(DateTime.now().add(Duration(hours: 2)),
      description: "Sport", gradientColors: GradientColors.sunset)
];
