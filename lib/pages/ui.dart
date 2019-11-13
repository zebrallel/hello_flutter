import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class UIPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
        padding: 10,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1)),
            child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      'w: 100, h: 100',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: 200,
                      maxWidth: 200,
                      minHeight: 150,
                      minWidth: 150),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'w: 150, h: 150',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Text(
                    'Container：1. 不指定宽高和没有boxConstraints限制的情况下，不展示。2. 不指定宽高，有boxConstraints，尽可能得大满足constraints。 3. 指定宽高，同时有boxConstraints，根据constraints进行缩放'),
                ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: double.infinity,
                        maxWidth: double.infinity,
                        minHeight: 200,
                        maxHeight: 200),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1)),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              color: Colors.pink,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                  width: 50, height: 50, color: Colors.yellow),
                            ),
                            Positioned(
                              left: 20,
                              top: 60,
                              child: Container(
                                width: 300,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Text(
                                  'Stack: 堆叠区域，子元素可以使用positioned指定位置，未指定位置的元素，将会根据alignment进行排列。',
                                ),
                              ),
                            )
                          ],
                        ))),
                Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      height: 500,
                      color: Colors.blueGrey,
                      child: Text(
                        '解决界面溢出问题，可以在最外层包裹一个SingleChildScrollView组件',
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
