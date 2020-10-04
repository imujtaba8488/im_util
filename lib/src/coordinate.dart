part of 'util.dart';

// Creates a coordinate. The first argument sets [dx], the horizontal component, and the second sets [dy], the vertical component. The 3rd arguments sets the angle of the point on an arc.
class Coordinate {
  /// Represents the x-coordinate.
  double dx;

  /// Represents the y-coordinate.
  double dy;

  /// Represents the angle in __radians__ of the coordinate if on an arc.\
  /// Todo: See is the same holds true for figures other than circle or ellipse.
  double angle;

  Coordinate(this.dx, this.dy, {this.angle = 0});

  /// A convenience getter, which returns the Coordinate converted to Offset, except the angle.
  get toOffset => Offset(dx, dy);

  /// Return the angle in __degrees__ of the coordinate.
  get angleInDegrees => toDegrees(angle);
}
