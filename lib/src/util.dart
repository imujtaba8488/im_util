import 'dart:math';

import 'package:flutter/material.dart';

part 'circle.dart';
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

/// Returns the offsets of points when an arc is divided into [numberOfPoints] in XY Cartesian Coordinate System.
///
/// [center] Where the center of the arc is located.\
/// [radius] The radius of the arc.\
/// [startAngle] Angle __in degrees__ at which the arc should start.\
/// [sweepAngle] Angle __in degrees__ at which the arc should move.\
/// [numberOfPoints] The number of points into which to divide the arc.
///
/// __Note:__ startAngle and sweepAngle must be greater than or equal to 0.0 and less than or equal to 360.0 degrees.
///
/// The idea behind this helper function is to provide the coordinates of points in XY cartesian system, if you were to draw an imaginary arc and divide the arc into 'n' parts. __Note:__ This function in no way draws anything on the screen. All it does is to given you the coordinates of points on an arc. It is upto the user of this function to use these coordinates in whatever ways required.
List<Offset> pointsOffsetsOnArc({
  @required Offset center,
  @required double radius,
  @required double startAngle,
  @required double sweepAngle,
  @required int numberOfPoints,
}) {
  assert(
    startAngle >= 0.0 && startAngle <= 360.0,
    'The value of startAngle be from 0.0 to 360.0',
  );

  assert(
    sweepAngle >= 0.0 && sweepAngle <= 360.0,
    'The value of sweepAngle must be from 0.0 to 360.0',
  );

  assert(
    numberOfPoints >= 0,
    'The value of points must be greater than or equal to 0',
  );

  assert(radius > 0.0, 'The value of radius must be greater than 0');

  List<Offset> coordinates = [];

  // This one is manual, since the moveAngle is always going to start past the startAngle.
  coordinates.add(
    pointOffsetOnArc(
      center: center,
      radius: radius,
      sweepAngle: toRadians(startAngle),
    ),
  );

  // Distance in angle between each coordinate.
  final double divisionAngle = toRadians(sweepAngle / numberOfPoints);

  // Determines how points should be placed along the arc and how their coordinates should be calculated.
  double moveAngle = toRadians(startAngle) + divisionAngle;

  for (int i = 0; i < numberOfPoints; i++) {
    coordinates.add(
      pointOffsetOnArc(
        center: center,
        radius: radius,
        sweepAngle: moveAngle,
      ),
    );

    // To moveAngle add the divisionAngle i.e. the distance in angle between each coordinate.
    moveAngle += divisionAngle;
  }

  return coordinates;
}

/// Returns the offset of a single point on an arc.
Offset pointOffsetOnArc({
  Offset center,
  double radius,
  double sweepAngle,
}) {
  double xCoord = center.dx + (radius - center.dx) * cos(sweepAngle);
  double yCoord = center.dy + (radius - center.dy) * sin(sweepAngle);

  return Offset(xCoord, yCoord);
}

double arcLength(double sweepAngle, double radius) {
  return sweepAngle / toRadians(360) * 2 * pi * radius;
}
