import 'dart:math';

class Point {
  final num x;
  final num y;
  final num distanceFromOrigin;

  Point(x, y)
      : x = x,
        y = y,
        distanceFromOrigin = sqrt(x * x + y * y);
}

void main(List<String> args) {
  var p = Point(2, 3);
  print(p.distanceFromOrigin);
}
