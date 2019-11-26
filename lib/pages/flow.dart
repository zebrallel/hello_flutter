import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class FlowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> tasks = [];

    for (var i = 0; i < 10; i++) {
      tasks.add(
        SizedBox(
          width: double.infinity,
          height: 100,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(4)),
            ),
          ),
        ),
      );
    }
    return Layout(
        padding: 20,
        child: Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              children: <Widget>[
                CustomPaint(
                  size: Size(100, double.infinity),
                  key: GlobalKey(),
                  painter: TimeLine(),
                ),
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(width: 1, color: Colors.white),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(children: tasks),
                      )),
                )
              ],
            )));
  }
}

class TimeLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final line = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white
      ..strokeWidth = 2;

    canvas.drawCircle(Offset(50, 50), 10, line);
    canvas.drawLine(Offset(50, 50), Offset(50, 150), line);
    canvas.drawCircle(Offset(50, 150), 5, line);

    const int length = 100;

    for (double i = 0; i * 4 < length; i++) {
      canvas.drawLine(
          Offset(50, 150 + i * 4), Offset(50, 150 + i * 4 + 2), line);
    }
    canvas.drawCircle(Offset(50, 250), 5, line);
    canvas.drawLine(Offset(50, 250), Offset(50, 350), line);
    canvas.drawCircle(Offset(50, 350), 5, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
