part of 'util.dart';


//! WORK IN PROGRESS....
class ImaginaryRect {
  double width;
  double height;
  Offset center;
  int numberOfPoints;

  ImaginaryRect({this.width, this.height, this.center, this.numberOfPoints});

  List<Coordinate> get coordinates {
    List<Coordinate> coords = [];

    Offset initialOffset = Offset(0.0, 0.0);

    double perimeter = 2 * width * height;

    double pointDistance = perimeter / numberOfPoints;

    for (int i = 0; i < numberOfPoints; i++) {
      coords.add(
        Coordinate(
          initialOffset.translate(pointDistance, 0.0).dx,
          initialOffset.translate(pointDistance, 0.0).dy,
        ),
      );

      pointDistance += pointDistance;

      print('Point Distance: $pointDistance');
    }

    return coords;
  }

  Coordinate _singlePointCoordinate() {}
}
