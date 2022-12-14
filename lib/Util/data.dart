import 'package:clock_app/Provider/MenuInfo.dart';
import 'package:clock_app/Util/Enums.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock, title: "Clock", imageResource: "assets/clock.png"),
  MenuInfo(MenuType.alarm,
      title: "Alarm", imageResource: "assets/alarm_clock.png"),
  MenuInfo(MenuType.timer, title: "Timer", imageResource: "assets/timer.png"),
  MenuInfo(MenuType.stopwatch,
      title: "Stopwatch", imageResource: "assets/stopwatch.png"),
];
