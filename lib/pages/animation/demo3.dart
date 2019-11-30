import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class DemoC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DemoCState();
  }
}

class DemoCState extends State<DemoC> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        padding: 20,
        child: Center(
          child: Column(
            children: <Widget>[
              AnimatedLogo(
                animation: animation,
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 100);

  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
        child: Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: _sizeTween.evaluate(animation),
        width: _sizeTween.evaluate(animation),
        child: FlutterLogo(),
      ),
    ));
  }
}
