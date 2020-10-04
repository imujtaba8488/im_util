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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AspectRatio(
            aspectRatio: 1,
            child: Transform.rotate(
              angle: toRadians(90),
              child: CustomPaint(
                size: Size.infinite,
                painter: TestPainter(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TestPainter extends CustomPainter {
  int nPoints = 50;

  @override
  void paint(Canvas canvas, Size size) {
    ImaginaryLine il = ImaginaryLine(
      startOffsets: Offset(0.0, size.width),
      length: size.width,
      numberOfPoints: nPoints,
    );

    ImaginaryLine il2 = ImaginaryLine(
      startOffsets: Offset(100, 0.0),
      length: size.width,
      numberOfPoints: nPoints,
    );

    for (int i = 0; i < il.coordinates.length; i++) {
      canvas.drawCircle(
        il.coordinates[i].toOffset,
        size.width / (nPoints * 3),
        Paint(),
      );

      canvas.drawLine(
        il.coordinates[i].toOffset,
        il2.coordinates[i].toOffset,
        Paint()..strokeWidth = 1,
      );

      canvas.drawCircle(
        il2.coordinates[i].toOffset,
        size.width / (nPoints * 3),
        Paint(),
      );
    }

    // ImaginaryArc imaginaryArc = ImaginaryArc(
    //   width: size.width,
    //   height: size.height,
    //   startAngle: 0,
    //   sweepAngle: 360,
    //   center: size.center(Offset(0.0, 0.0)),
    //   numberOfPoints: 10,
    // );

    // ImaginaryArc imaginaryArc2 = ImaginaryArc(
    //   width: size.width - 10,
    //   height: size.height - 10,
    //   startAngle: 0,
    //   sweepAngle: 360,
    //   center: size.center(Offset(0.0, 0.0)),
    //   numberOfPoints: 10,
    // );

    // print('xRadius: ${imaginaryArc.xRadius}');
    // print('yRadius: ${imaginaryArc.yRadius}');

    // for (int i = 0; i < imaginaryArc.coordinates.length; i++) {
    //   canvas.drawLine(
    //     imaginaryArc.coordinates[i].toOffset,
    //     imaginaryArc2.coordinates[i].toOffset,
    //     // Offset(imaginaryArc.offsets[i].dx, imaginaryArc.offsets[i].dy),
    //     // Offset(imaginaryArc2.offsets[i].dx, imaginaryArc2.offsets[i].dy),
    //     Paint()
    //       ..style = PaintingStyle.stroke
    //       ..strokeWidth = 2
    //       ..color = Colors.orange,
    //   );

    //   print('Angle: ${imaginaryArc.coordinates[i].angleInDegrees}');
    // }
  }

  @override
  bool shouldRepaint(TestPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TestPainter oldDelegate) => false;
}
