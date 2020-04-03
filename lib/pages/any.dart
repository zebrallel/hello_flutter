import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class AnyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print('any page createState invoked!');
    return AnyPageState();
  }
}

class AnyPageState extends State<AnyPage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
        padding: 20,
        child: Column(
          children: <Widget>[
            new Ink(
              decoration: new BoxDecoration(
                //背景色
                color: Colors.red,
                //shape圆角半径
              ),
              child: new InkResponse(
                child: new Container(
                  width: 100.0,
                  height: 100.0,
                  alignment: Alignment.center,
                  child: new Text(
                    '水波纹按钮',
                    textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.black, fontSize: 12.0),
                  ),
                ),
                onTap: () {
                  print('我点击了按钮了');
                },
                //点击或者toch控件高亮时显示的颜色在控件上层,水波纹下层
                highlightColor: Colors.transparent,
                //点击或者touch控件高亮的shape形状
                highlightShape: BoxShape.rectangle,
                //shape圆角半径
                radius: 150.0,
                //ripple水波纹半径
                //true表示要裁剪水波纹响应的边界,false就是不裁剪
                //如果控件是圆角的,不裁剪的话,水波纹出来的最终填充出来的效果是矩形
                containedInkWell: true,
                //水波纹颜色
                splashColor: Colors.black12,
              ),
            ),
            SizedBox(
              width: 100,
              height: 50,
            ),
            new Ink(
              decoration: new BoxDecoration(
                //背景色
                //shape圆角半径
              ),
              child: new InkResponse(
                child: Text(' lkjgaldflakjg'),
                onTap: () {
                  print('我点击了按钮了');
                },
                //点击或者toch控件高亮时显示的颜色在控件上层,水波纹下层
                highlightColor: Colors.transparent,
                //点击或者touch控件高亮的shape形状
                highlightShape: BoxShape.rectangle,
                //shape圆角半径
                radius: 150.0,
                //ripple水波纹半径
                //true表示要裁剪水波纹响应的边界,false就是不裁剪
                //如果控件是圆角的,不裁剪的话,水波纹出来的最终填充出来的效果是矩形
                containedInkWell: true,
                //水波纹颜色
                splashColor: Colors.black12,
              ),
            )
          ],
        ));
  }
}
