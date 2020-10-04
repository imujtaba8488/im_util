import 'dart:math';

import 'package:flutter/material.dart';

part 'circle.dart';
part 'coordinate.dart';
part 'imaginary_arc.dart';
part 'imaginary_line.dart';
part 'imaginary_rect.dart';
part 'percent.dart';

/// Converts an angle in degrees to radians.
///
/// A radian is the measure of an angle that, when drawn as a central angle of a circle, intercepts an arc whose length is equal to the length of the radius of the circle.
double toRadians(double degrees) => degrees * (pi / 180);

/// Converts an angle in radians to degrees.
double toDegrees(double radians) => (radians * (180 / pi)).roundToDouble();

/// Returns the center of any shape with a given height and width.
/// Based on Pythagoras Theorem: (altitude) square = (breadth) square + (length) square.
/// TEMP: Write detailed doc later.
/// Co-author: 'ISRA ITRAT RAFIQI' on September, 2019.
double centerOf(double height, double width) {
  assert(
    height > 0.0 && width > 0,
    'height and width must be greater than 0.0',
  );

  return sqrt((height * height) + (width * width)) / 2.0;
}

/// Gets the given part [whichPart] of a shape which is divided into [howManyParts].
/// Formula: which part / total parts * length.
/// Co-author: 'ISRA ITRAT RAFIQI' on 20th February, 2020.
double partOf({
  @required double length,
  @required double howManyParts,
  @required double whichPart,
}) {
  assert(
    whichPart >= 0 && whichPart <= howManyParts,
    'whichPart must be greater than or equal to 0 and less than or equal to howManyParts.',
  );

  return whichPart / howManyParts * length;
}
