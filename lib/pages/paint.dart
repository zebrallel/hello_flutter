import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world/components/layout.dart';

class ProgressCirclePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProgressCircleState();
  }
}

class ProgressCircleState extends State<ProgressCirclePage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
        child: Column(
      children: <Widget>[
        ProgressCirclePaint(),
        CustomPaint(
          size: Size(double.infinity, 100),
          key: GlobalKey(),
          painter: VocabProgressBar(),
        ),
      ],
    ));
  }
}

class VocabProgressBar extends CustomPainter {
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

    canvas.drawLine(Offset(20, 0), Offset(size.width - 20, 0), backgroundLine);
    canvas.drawLine(Offset(200, 0), Offset(220, 0), todayLine);
    canvas.drawPath(
        Path()
          ..moveTo(200, -3)
          ..lineTo(200, 3)
          ..lineTo(20, 3)
          ..arcTo(Rect.fromCircle(center: Offset(20, 0), radius: 3),
              degToRad(0), degToRad(270), false),
        totalLine);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: listen data change
    return false;
  }
}

class ProgressCirclePaint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, 300),
      key: GlobalKey(),
      painter: ProgressCircle(),
    );
  }
}

class ProgressCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final offsetCenter = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.grey
      ..strokeWidth = 12;

    canvas.drawCircle(offsetCenter, 100, paint);

    final angle = 360 * 0.4;
    final double radians = degToRad(angle);

    final Rect arcRect = Rect.fromCircle(center: offsetCenter, radius: 100);

    final Gradient gradient = new SweepGradient(
      endAngle: radians,
      colors: [
        Colors.grey,
        Colors.orange,
      ],
    );
    final progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12
      ..shader = gradient.createShader(arcRect);

    canvas.drawArc(arcRect, 0.0, degToRad(angle), false, progressPaint);
  }

  num degToRad(num deg) => deg * (pi / 180.0);
  num radToDeg(num rad) => rad * (180.0 / pi);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/**
  
// 绘制弧线
drawArc(Rect rect, double startAngle, double sweepAngle, bool useCenter, Paint paint)
// 绘制图片
drawImage(Image image, Offset p, Paint paint) 
// 绘制圆
drawCircle(Offset c, double radius, Paint paint) 
// 绘制线条
drawLine(Offset p1, Offset p2, Paint paint) 
// 绘制椭圆
drawOval(Rect rect, Paint paint)
// 绘制文字
drawParagraph(Paragraph paragraph, Offset offset)
// 绘制路径
drawPath(Path path, Paint paint) 
// 绘制点
drawPoints(PointMode pointMode, List<Offset> points, Paint paint)
// 绘制Rect
drawRect(Rect rect, Paint paint) 
// 绘制阴影
drawShadow(Path path, Color color, double elevation, bool transparentOccluder)

color：画笔颜色
style：绘制模式，画线 or 充满
maskFilter：绘制完成，还没有被混合到布局上时，添加的遮罩效果，比如blur效果
strokeWidth：线条宽度
strokeCap：线条结束时的绘制样式
shader：着色器，一般用来绘制渐变效果或ImageShader

 */
