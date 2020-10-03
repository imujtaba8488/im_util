import 'package:flutter/material.dart';
import 'package:im_shapes/src/drop.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Animation animation2;

  double height = 0.0;

  bool inflated = false;

  double value = 0.0;

  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(seconds: 20),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animation = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 100.0), weight: 1),
        // TweenSequenceItem(tween: Tween(begin: 20.0, end: 0.0), weight: 1),
      ],
    ).animate(CurvedAnimation(
      curve: Curves.ease,
      parent: controller,
    ));

    // height = animation.isCompleted ? 100.0 : 130;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Icon Stepper Example'),
        ),
      ),
    );
  }

  Widget unknown() {
    return Container(
      height: height,
      width: 100,
      child: Stack(
        children: [
          Positioned(
            top: animation.value,
            child: Container(
              height: 100,
              width: 100,
              child: Drop(),
            ),
          ),
        ],
      ),
    );
  }
}
