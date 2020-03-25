import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListViewPageState();
  }
}

class ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
        child: ListView.builder(
            padding: EdgeInsets.all(10),
            controller: null,
            itemCount: 100,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1)),
                child: Center(child: Text(index.toString())),
              );
            }));
  }
}
