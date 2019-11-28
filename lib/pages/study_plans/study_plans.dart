import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class StudyPlans extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StudyPlansState();
  }
}

class StudyPlansState extends State<StudyPlans> {
  @override
  Widget build(BuildContext context) {
    return Layout(
        child: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 200,
          color: Color(0xffaabbcc),
          child: Center(
            child: Text('我们的学习计划', style: TextStyle(color: Colors.black)),
          ),
        ),
        TasksTimeline()
      ],
    )));
  }
}

class TasksTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomPaint(
          key: GlobalKey(),
          size: Size(100, 500),
          painter: TimeLine(),
        ),
        Expanded(child: Container(color: Colors.lightBlue, child: Text('123')))
      ],
    );
  }
}

class TimeLine extends CustomPainter {
  double gapLen = 150;
  double radius = 10;

  void drawDashedLine(
      Canvas canvas, Paint pen, double x, double startY, double endY) {
    const density = 2;
    double len = endY - startY;

    for (double i = 0; i * 2 * density < len; i++) {
      canvas.drawLine(Offset(x, startY + i * 2 * density),
          Offset(x, startY + i * 2 * density + density), pen);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    double half = size.width / 2;
    double lineEnd = 100;

    Paint pen = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white
      ..strokeWidth = 2;

    canvas.drawLine(
        Offset(size.width, 0), Offset(size.width, size.height), pen);

    canvas.drawCircle(Offset(half, lineEnd), radius, pen);
    drawDashedLine(canvas, pen, half, lineEnd, lineEnd + gapLen);
    canvas.drawCircle(Offset(half, lineEnd + gapLen), radius, pen);
    drawDashedLine(canvas, pen, half, lineEnd, lineEnd + gapLen * 2);
    canvas.drawCircle(Offset(half, lineEnd + gapLen * 2), radius, pen);
    drawDashedLine(canvas, pen, half, lineEnd, lineEnd + gapLen * 3);
    canvas.drawCircle(Offset(half, lineEnd + gapLen * 3), radius, pen);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
