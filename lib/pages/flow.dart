import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class FlowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(padding: 20, child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(4)
      ),
      child: Row(
        children: <Widget>[
          CustomPaint(
            size: Size(100, double.infinity),
            key: GlobalKey(),
            painter: TimeLine(),
          )
        ],
      ),
    ));
  }
}

class TimeLine extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final line = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white
      ..strokeWidth = 2;

    canvas.drawCircle(Offset(50, 50), 10, line);
    canvas.drawLine(Offset(50, 50), Offset(50, 150), line);
    canvas.drawCircle(Offset(50, 150), 10, line);

    const int length = 100;

    for (double i = 0; i * 4 < length; i++) {
      canvas.drawLine(Offset(50, 150 + i * 4), Offset(50, 150 + i * 4 + 2), line);
    }
    canvas.drawCircle(Offset(50, 250), 5, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


