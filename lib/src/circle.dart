part of 'util.dart';

class Circle {
  /// The radius of the circle.
  double radius;

  /// The location of the center of the circle in X, Y plane.
  Offset center;

  Circle({@required this.radius, @required this.center});

  /// Returns the circumference of a circle.
  double get circumference => 2 * pi * radius;

  /// Returns the diameter of the circle.
  double get diameter => radius * radius;

  /// Returns the area of a circle.
  double get area => pi * radius * radius;

  /// Returns a list of coordinates representing the coordinates of sectors, when a circle is divided into [numberOfSectors] sectors.
  ///
  /// [numberOfSectors]: The number of sectors into which to divide the circle.
  List<Point<double>> sectorCoordinates({@required int numberOfSectors}) {
    double angle = 0;
    List<Point<double>> coordinates = List();

    for (int i = 0; i < numberOfSectors; i++) {
      angle = i * (360 / numberOfSectors);

      Point<double> coordinate = Point(
        center.dx + (radius * (cos(toRadians(angle)))),
        center.dy + (radius * (sin(toRadians(angle)))),
      );

      coordinates.add(coordinate);
    }

    return coordinates;
  }

  List<Point<double>> sectorCoordinatesBasedOnAngleOfDivision({
    @required double angle,
  }) {
    int numberOfSectors = 360 ~/ angle;

    double internalAngle = 0;

    List<Point<double>> coordinates = List();

    for (int i = 0; i < numberOfSectors; i++) {
      internalAngle = i * (360 / numberOfSectors);

      Point<double> coordinate = Point(
        center.dx + (radius * (cos(toRadians(internalAngle)))),
        center.dy + (radius * (sin(toRadians(internalAngle)))),
      );

      coordinates.add(coordinate);
    }

    return coordinates;
  }

  List<Point<double>> triangleCoordinates(
    double angle1,
    double angle2,
    double angle3,
  ) {
    List<double> angles = [angle1, angle2, angle3];

    List<Point<double>> coordinates = List();

    for (int i = 0; i < 3; i++) {

      Point<double> coordinate = Point(
        center.dx + (radius * (cos(toRadians(angles[i])))),
        center.dy + (radius * (sin(toRadians(angles[i])))),
      );

      coordinates.add(coordinate);
    }

    return coordinates;
  }

  /// Returns the radius of the circle with the given circumference.
  static double radiusFromCircumference(double circumference) =>
      circumference / (2 * pi);
}
