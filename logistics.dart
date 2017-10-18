import "package:test/test.dart";

// logisticMap kata

logisticMap(width, height, xs, ys) {
  var map = [];

  for (int y = 0; y < height; y++) {
    var row = [];

    for (int x = 0; x < width; x++) {
      int minDistance = null;

      for (int pt = 0; pt < xs.length; pt++) {
        int dist = (xs[pt] - x).abs() + (ys[pt] - y).abs();
        if (minDistance == null) {
          minDistance = dist;
        } else {
          minDistance = minDistance < dist ? minDistance : dist;
        }
      }

      if (xs.length > 0) {
        row.add(minDistance);
      } else {
        row.add(null);
      }
    }
    map.add(row);
  }
  return map;
}

void main() {
  test('Basic tests', () {
    expect(
        logisticMap(3, 3, [0], [0]),
        equals([
          [0, 1, 2],
          [1, 2, 3],
          [2, 3, 4]
        ]));
    expect(
        logisticMap(3, 3, [2], [2]),
        equals([
          [4, 3, 2],
          [3, 2, 1],
          [2, 1, 0]
        ]));
    expect(
        logisticMap(1, 1, [0], [0]),
        equals([
          [0]
        ]));
    expect(
        logisticMap(5, 2, [0, 4], [0, 0]),
        equals([
          [0, 1, 2, 1, 0],
          [1, 2, 3, 2, 1]
        ]));
    expect(
        logisticMap(2, 2, [], []),
        equals([
          [null, null],
          [null, null]
        ]));
  });
}
