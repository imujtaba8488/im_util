part of 'util.dart';

// Copyright @ im8488. All rights reserved.
// Author: iMujtaba Nazki
// Mathematical Contribution: Isra Itrat Rafiqi & Google.com.
// Dated: October, 2020

/// A class that represents an imaginary arc enclosed within a rectangular or square path. You feed it with the requisite information and it spits out data that may require complex mathematical calculations for an arc.
///
/// Inside a rectangular path, the arc is on an elliptical path and if inside a square, the arc is on a circular path.
///
///  __Note:__
/// * The object of this class does not draw anything on the screen.
/// * [startAngle] and [sweepAngle] must be specified in degrees.
///
/// __Explanation:__
/// One case is when it may be required to get the offsets/coordinates of a given point along an arc (or a circle if [startAngle] is 0 degrees, sweepAngle is 360 degrees, and aspect ratio is 1). In these cases, calculating these offsets may involve complex Mathematical calculations. The goal of an object of this class is to perform and hide these complex Mathematical calculations and conveniently provide the offsets of points of on an arc.
/// 
/// __Usage Note:__ 
/// * I typically used this to create gauges [here](https://github.com/imujtaba8488), however, the applicability dependents totally on imagination and requirement.
/// * The fields are not marked as immutable (final), hence, can be altered progressive if needed. 
class ImaginaryArc {
  /// The width of the rectangle enclosing the arc.
  double width;

  /// The height of the rectangle enclosing the arc.
  double height;

  /// Angle in __degrees__ at which the arc should start.
  double startAngle;

  /// Angle in __degrees__ at which the arc should move i.e. the arcAngle.
  double sweepAngle;

  /// Where the center of the arc is located.
  Offset center;

  /// The number of points to define on the arc, who's offsets may be needed.
  int numberOfPoints;

  ImaginaryArc({
    this.width = 10.0,
    this.height = 10.0,
    this.startAngle = 0.0,
    this.sweepAngle = 360.0,
    @required this.center,
    this.numberOfPoints = 0,
  }) {
    assert(
      width > 0.0 && height > 0.0,
      'width & height must be greater than 0.0',
    );

    assert(
      startAngle >= 0.0 && startAngle <= 360.0,
      'The value of startAngle must be from 0.0 to 360.0',
    );

    assert(
      sweepAngle >= 0.0 && sweepAngle <= 360.0,
      'The value of sweepAngle must be from 0.0 to 360.0',
    );

    assert(
      numberOfPoints >= 0,
      'The numberOfPoints must be greater than or equal to 0',
    );
  }

  /// Returns the coordinates and angle of [numberOfPoints] on an arc.
  List<Coordinate> get coordinates {
    // Temporary list that holds all the coordinates.
    List<Coordinate> coords = [];

    // Since the moveAngle is always going to start past the startAngle, startAngle defines the initial coordinate.
    coords.add(_singlePointCoordinate(sweepAngle: toRadians(startAngle)));

    // Distance in angle between each coordinate (point on the arc).
    final double divisionAngle = toRadians(sweepAngle / numberOfPoints);

    // Determines how points should be placed along the arc and how their coordinates should be calculated.
    double moveAngle = toRadians(startAngle) + divisionAngle;

    for (int i = 0; i < numberOfPoints; i++) {
      coords.add(_singlePointCoordinate(sweepAngle: moveAngle));

      // To moveAngle add the divisionAngle i.e. the distance in angle between each coordinate.
      moveAngle += divisionAngle;
    }

    return coords;
  }

  /// Returns the coordinate and angle of a single point on an arc.
  Coordinate _singlePointCoordinate({@required double sweepAngle}) {
    double xCoord = center.dx + (width - center.dx) * cos(sweepAngle);
    double yCoord = center.dy + (height - center.dy) * sin(sweepAngle);

    return Coordinate(xCoord, yCoord, angle: sweepAngle);
  }

  /// Returns the xRadius (i.e. along the x-axis or width of the rectangle) of the arc. The reason to have xRadius rather than just the radius is because the arc may be in elliptical path. However, if arc is in a circular path both [xRadius] and [yRadius] yeild the same result.
  double get xRadius => width / 2;

  /// Returns the yRadius (i.e. along the y-axis or height of the rectangle) of the arc. The reason to have yRadius rather than just the radius is because the arc may be in elliptical path.However, if the arc is in a circular path both [xRadius] and [yRadius] yeild the same result.
  double get yRadius => height / 2;
}
