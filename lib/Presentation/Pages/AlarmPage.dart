import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../Util/CustomColors.dart';
import '../../Util/data.dart';

class AlarmPage extends StatefulWidget {
  AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Alarm",
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.white, fontSize: 24),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: alarmList.map((alarmInfo) {
                return Container(
                  margin: EdgeInsets.only(bottom: 25),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: alarmInfo.gradientColors),
                      boxShadow: [
                        BoxShadow(
                            color:
                                alarmInfo.gradientColors.last.withOpacity(0.4),
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: Offset(4, 4))
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.label,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Office",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Spacer(),
                          Switch(
                            value: true,
                            onChanged: (v) {},
                            activeColor: Colors.white,
                          )
                        ],
                      ),
                      Text(
                        "Mon-Fri",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "07:00am",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 36,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }).followedBy([
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 25,
                  ),
                  decoration: BoxDecoration(
                      color: CustomColors.clockBG,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                        style: BorderStyle.solid,
                      )),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.blueAccent, width: 3),
                              borderRadius: BorderRadius.circular(15)),
                          child: Icon(
                            Icons.add,
                            color: Colors.blueAccent,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Add More",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ]).toList(),
            ),
          )
        ],
      ),
    );
  }
} //
