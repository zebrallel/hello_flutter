import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class VocabularyPage extends StatelessWidget {
  final int vocabValue = 3562;

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '我的词汇量',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF25222d)),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '重新测试',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF7c7a81)),
                    ),
                    Image.asset(
                      'assets/images/icon_actions_arrow_right_secondary_light_12@2x.png',
                      width: 12,
                      height: 12,
                    )
                  ],
                ))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 26),
              child: Row(
                children: <Widget>[
                  Text(vocabValue.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF25222d))),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child:
                        Text('比昨日', style: TextStyle(color: Color(0xFF7c7a81))),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 1, left: 3, right: 3),
                      child: Image.asset(
                          'assets/images/icon_glyphs_triangle_green_up_12@2x.png',
                          width: 12,
                          height: 12)),
                  Text(
                    '62',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF25222d),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 12),
                child: CustomPaint(
                    key: GlobalKey(),
                    size: Size(double.infinity, 6),
                    painter: _VocabProgressBar())),
            Padding(
                padding: EdgeInsets.only(top: 6),
                child: SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Text('3,500',
                            style: TextStyle(
                                color: Color(0xffbdbcc0),
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                        width: 46,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Color(0xfff8f8f8),
                            borderRadius: BorderRadius.circular(2)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text('4,000',
                            style: TextStyle(
                                color: Color(0xffbdbcc0),
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                        width: 46,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Color(0xfff8f8f8),
                            borderRadius: BorderRadius.circular(2)),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class _VocabProgressBar extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final backgroundLine = Paint()
      ..style = PaintingStyle.stroke
      ..color = Color(0xffe9e8ea)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;
    final totalLine = Paint()
      ..style = PaintingStyle.fill
      ..color = Color(0xffffca29);
    final todayLine = Paint()
      ..style = PaintingStyle.stroke
      ..color = Color(0xff26d07c)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    num degToRad(num deg) => deg * (pi / 180.0);

    canvas.drawLine(Offset(0, 0), Offset(size.width, 0), backgroundLine);
    canvas.drawLine(Offset(200, 0), Offset(220, 0), todayLine);
    canvas.drawPath(
        Path()
          ..moveTo(200, -3)
          ..lineTo(200, 3)
          ..lineTo(0, 3)
          ..arcTo(Rect.fromCircle(center: Offset(0, 0), radius: 3), degToRad(0),
              degToRad(270), false),
        totalLine);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
