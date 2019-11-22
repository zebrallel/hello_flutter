import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';
import 'package:provider/provider.dart';

class ContentModel with ChangeNotifier {
  String _content = '';
  String get value => _content;

  void update(String content) {
    _content = content;
    notifyListeners();
  }
}

class UIPage extends StatelessWidget {
  ContentModel cm = ContentModel();
  @override
  Widget build(BuildContext context) {
    print('bbbb');
    return ChangeNotifierProvider<ContentModel>.value(
        value: cm,
        child: Layout(
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
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(8)),
                          child: TextField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            onChanged: (_) {
                              cm.update(_);
                            },
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Consumer<ContentModel>(
                            builder: (content, model, child) {
                              return AutoSizeText(
                                model._content,
                                style: TextStyle(fontSize: 40),
                                maxLines: 1,
                              );
                            },
                          )),
                    ),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                            padding:
                                EdgeInsets.only(top: 25, left: 10, bottom: 25),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xffdddddd),
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('定一个学习目标，加入Flag计划',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: <Widget>[
                                        Text('最后',
                                            style:
                                                TextStyle(color: Colors.black)),
                                        Text(' 2 ',
                                            style:
                                                TextStyle(color: Colors.red)),
                                        Text('天,',
                                            style:
                                                TextStyle(color: Colors.black)),
                                        Text(' 790,100 ',
                                            style:
                                                TextStyle(color: Colors.red)),
                                        Text('人已参加',
                                            style:
                                                TextStyle(color: Colors.black))
                                      ],
                                    )
                                  ],
                                ),
                                Expanded(
                                    child: Center(
                                        child: Container(
                                  alignment: Alignment.center,
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text('GO',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                )))
                              ],
                            ))),
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
                                border:
                                    Border.all(color: Colors.black, width: 1)),
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
                                      width: 50,
                                      height: 50,
                                      color: Colors.yellow),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20, top: 50),
                                  child: Container(
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
            )));
  }
}
