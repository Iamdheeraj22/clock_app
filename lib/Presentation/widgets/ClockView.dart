import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  final double s;
  ClockView({Key? key, required this.s}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.s,
      width: widget.s,
      child: CustomPaint(painter: ClockPainter()),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = Color(0xFF444974);
    var outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    var centerFillBrush = Paint()..color = Color(0xFFEAECFF);
    var dashBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    //Seconds , hour & minutes

    var secondHandBrush = Paint()
      ..color = Colors.orange[300]!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    var minutesHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77DDFF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;
    canvas.drawCircle(center, radius - 30, fillBrush);
    canvas.drawCircle(center, radius - 30, outlineBrush);
    //For Hours
    var hourX = centerX +
        40 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourY = centerX +
        40 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourX, hourY), hourHandBrush);

    //For Minutes
    var minutesX = centerX + 55 * cos(dateTime.minute * 6 * pi / 180);
    var minutesY = centerX + 55 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minutesX, minutesY), minutesHandBrush);

    //For seconds
    var secondX = centerX + 65 * cos(dateTime.second * 6 * pi / 180);
    var secondY = centerX + 65 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secondX, secondY), secondHandBrush);

    canvas.drawCircle(center, 16, centerFillBrush);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;

    for (double i = 0; i < 360; i += 6) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
