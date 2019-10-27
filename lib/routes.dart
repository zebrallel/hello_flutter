import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world/config.dart';

final routeKeys = routeConfigs.keys.toList().reversed.toList();

class RoutePage extends StatelessWidget {
  _onItemClick(BuildContext context, WidgetBuilder builder) {
    Navigator.push(context, MaterialPageRoute(builder: builder));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: routeKeys.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () {
              this._onItemClick(context, routeConfigs[routeKeys[index]]);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey,
                          width: 1,
                          style: BorderStyle.solid))),
              height: 60,
              child: Text(routeKeys[index]),
            ));
      },
    );
  }
}
