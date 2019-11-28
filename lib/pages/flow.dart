import 'package:flutter/material.dart';
import 'package:hello_world/components/box.dart';
import 'package:hello_world/components/layout.dart';

class FlowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
        padding: 20,
        child: Box(
            width: double.infinity,
            bordered: true,
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Box(
                    width: double.infinity,
                    height: 80,
                    bordered: true,
                  ),
                );
              },
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
