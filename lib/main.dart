import 'dart:ui';

import 'package:flutter/material.dart';

import 'src/util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Icon Stepper Example'),
        ),
        body: AspectRatio(
          aspectRatio: 1,
          child: CustomPaint(
            size: Size.infinite,
            painter: TestPainter(),
          ),
        ),
      ),
    );
  }
}

class TestPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    ImaginaryArc imaginaryArc = ImaginaryArc(
      width: size.width,
      height: size.height,
      startAngle: 0,
      sweepAngle: 360,
      center: size.center(Offset(0.0, 0.0)),
      numberOfPoints: 500,
    );

    ImaginaryArc imaginaryArc2 = ImaginaryArc(
      width: size.width - 10,
      height: size.height - 100,
      startAngle: 0,
      sweepAngle: 360,
      center: size.center(Offset(0.0, 0.0)),
      numberOfPoints: 500,
    );

    print('xRadius: ${imaginaryArc.xRadius}');
    print('yRadius: ${imaginaryArc.yRadius}');

    for (int i = 0; i < imaginaryArc.offsets.length; i++) {
      canvas.drawLine(
        imaginaryArc.offsets[i],
        imaginaryArc2.offsets[i],
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = Colors.orange,
      );
    }
  }

  @override
  bool shouldRepaint(TestPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TestPainter oldDelegate) => false;
}
