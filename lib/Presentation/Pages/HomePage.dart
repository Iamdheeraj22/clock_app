import 'package:clock_app/Presentation/Pages/ClockPage.dart';
import 'package:clock_app/Presentation/Pages/StopwatchPage.dart';
import 'package:clock_app/Presentation/widgets/TimerPage.dart';
import 'package:clock_app/Provider/MenuInfo.dart';
import 'package:clock_app/Util/Enums.dart';
import 'package:clock_app/Util/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Util/Common.dart';
import 'AlarmPage.dart';
import 'TimerScreenPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: menuItems
                  .map((currentMenuInfo) => itemButton(currentMenuInfo))
                  .toList()),
          const VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(child: Consumer<MenuInfo>(
            builder: (context, value, child) {
              if (value.menuType == MenuType.clock) {
                return ClockPage();
              } else if (value.menuType == MenuType.alarm) {
                return AlarmPage();
              } else if (value.menuType == MenuType.timer) {
                return TimerScreenPage();
              } else if (value.menuType == MenuType.stopwatch) {
                return StopwatchPage();
              }
              return Container();
            },
          )),
        ],
      ),
    );
  }

  Widget itemButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (context, value, child) {
        return InkWell(
          onTap: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenu(currentMenuInfo);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 5, right: 5.0),
            width: width(context) / 5.7,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: currentMenuInfo.menuType == value.menuType
                    ? Colors.red
                    : Colors.transparent),
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  currentMenuInfo.imageResource.toString(),
                  scale: 11.5,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  currentMenuInfo.title.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
