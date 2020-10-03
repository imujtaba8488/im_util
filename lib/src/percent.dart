part of 'util.dart';

/// Returns the [percent] of the given [value]. You should read it as '% of value'
class Percent {
  final double _percent;

  Percent(this._percent);

  double of(double value) => (value / 100) * _percent;
}
