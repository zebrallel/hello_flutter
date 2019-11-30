import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class DemoB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DemoBState();
  }
}

class DemoBState extends State<DemoB> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 100).animate(controller);

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
              GradientBox(
                  animation: animation,
                  child: Center(
                    child: Text(
                      'Gradient Box',
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
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

  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

class GradientBox extends StatelessWidget {
  GradientBox({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Container(
                  height: 200,
                  width: 200,
                  color: Color.fromRGBO(100, (animation.value % 255).round(),
                      (animation.value % 255).round(), 1),
                  child: child,
                ),
            child: child),
      );
}
