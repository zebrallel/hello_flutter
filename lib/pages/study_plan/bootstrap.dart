import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class StudyPlanBootstrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        padding: EdgeInsets.only(top: 140),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/images/200@2x.png', width: 200, height: 200),
            AutoSizeText(
              '制定学习计划，\n开启高效提升英语之旅吧！',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(124, 122, 129, 1), fontSize: 16),
            ),
            Padding(
              padding: EdgeInsets.only(top: 165),
              child: Container(
                width: 200,
                height: 48,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 202, 41, 1),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text('开始制定',
                        style: TextStyle(
                            color: Color.fromRGBO(37, 34, 45, 1),
                            fontSize: 18))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
