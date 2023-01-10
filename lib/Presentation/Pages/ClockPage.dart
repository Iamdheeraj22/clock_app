import 'dart:async';
import 'dart:math';

import 'package:clock_app/Logic/cubit/clock_cubit.dart';
import 'package:clock_app/Logic/cubit/clock_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../Logic/Util/Common.dart';
import '../widgets/ClockView.dart';

class ClockPage extends StatelessWidget {
  ClockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClockCubit()..currentTime(),
      child: _ClockPageState(),
    );
  }
}

class _ClockPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClockCubit, ClockState>(builder: (clockContext, state) {
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
                children: const [
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
                      state.time.toString(),
                      style: const TextStyle(fontSize: 64, color: Colors.white),
                    ),
                    Text(
                      state.date.toString(),
                      style: const TextStyle(fontSize: 32, color: Colors.white),
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
                  const Text(
                    "Timezone",
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "UTC   ${state.timeZone}",
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
