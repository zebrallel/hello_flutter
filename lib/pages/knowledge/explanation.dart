import 'package:flutter/widgets.dart';
import 'package:hello_world/components/layout.dart';
import 'package:flutter/material.dart';

class ExplanationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('词汇掌握度演示图例',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff25222d))),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Flex(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                      child: Icon(
                        Icons.lens,
                        size: 6,
                        color: Color(0xffbdbcc0),
                      ),
                    ),
                    Text(
                      '未掌握',
                      style: TextStyle(color: Color(0xff7c7a81), fontSize: 15),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    SizedBox(
                      width: 60,
                      child: CustomPaint(
                        painter: _MasteryBar(Color(0xffffca29)),
                      ),
                    )
                  ],
                  direction: Axis.horizontal,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Flex(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                      child: Icon(
                        Icons.lens,
                        size: 6,
                        color: Color(0xffbdbcc0),
                      ),
                    ),
                    Text(
                      '基本掌握',
                      style: TextStyle(color: Color(0xff7c7a81), fontSize: 15),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    SizedBox(
                      width: 60,
                      child: CustomPaint(
                        painter: _MasteryBar(Color(0xfff79e00)),
                      ),
                    )
                  ],
                  direction: Axis.horizontal,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Flex(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                      child: Icon(
                        Icons.lens,
                        size: 6,
                        color: Color(0xffbdbcc0),
                      ),
                    ),
                    Text(
                      '掌握得不错',
                      style: TextStyle(color: Color(0xff7c7a81), fontSize: 15),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    SizedBox(
                      width: 60,
                      child: CustomPaint(
                        painter: _MasteryBar(Color(0xffbd6400)),
                      ),
                    )
                  ],
                  direction: Axis.horizontal,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Flex(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                      child: Icon(
                        Icons.lens,
                        size: 6,
                        color: Color(0xffbdbcc0),
                      ),
                    ),
                    Text(
                      '完全掌握',
                      style: TextStyle(color: Color(0xff7c7a81), fontSize: 15),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    SizedBox(
                      width: 60,
                      child: CustomPaint(
                        painter: _MasteryBar(Color(0xff602800)),
                      ),
                    )
                  ],
                  direction: Axis.horizontal,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  children: <Widget>[
                    Text('词汇掌握度是怎么来的',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff25222d))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Wrap(
                  children: <Widget>[
                    Text(
                      '我们会根据您的每日学习情况，对您重点学习的词汇进行掌握度追踪。您学习习惯、学习行为、答题情况都将影响我们对您词汇掌握度的评估。',
                      style: TextStyle(fontSize: 15, color: Color(0xff7c7a81)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  children: <Widget>[
                    Text('如何提升词汇掌握度',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff25222d))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Wrap(
                  children: <Widget>[
                    Text(
                      '坚持每日阅读，勤听音频、完成每日单词练习都有助于提升词汇掌握度哦～',
                      style: TextStyle(fontSize: 15, color: Color(0xff7c7a81)),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class _MasteryBar extends CustomPainter {
  final Color color;

  _MasteryBar(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final bar = Paint()
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    canvas.drawLine(Offset(0, 3), Offset(size.width, 3), bar);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
