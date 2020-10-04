part of 'util.dart';

class ImaginaryLine {
  Offset startOffsets;
  double length;
  int numberOfPoints;

  ImaginaryLine({
    this.startOffsets,
    this.length,
    this.numberOfPoints = 0,
  });

  List<Coordinate> get coordinates {
    List<Coordinate> coords = [];

    double pointDistance = length / numberOfPoints;
    double move = 0.0;

    for (int i = 0; i < numberOfPoints; i++) {
      coords.add(
        Coordinate(
          startOffsets.dx + move,
          startOffsets.dy,
        ),
      );
      move += pointDistance;
    }

    coords.add(Coordinate(startOffsets.dx + move, startOffsets.dy));

    return coords;
  }
}
