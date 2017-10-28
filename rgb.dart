import 'dart:math';
import "package:test/test.dart";

String toHex(int value) =>
    value.toRadixString(16).padLeft(2, '0').toUpperCase();

String rgb(int r, int g, int b) {
  return ''; // replace with your solution
}

String solution(int r, int g, int b) {
  if (r > 255) r = 255;
  if (g > 255) g = 255;
  if (b > 255) b = 255;
  if (r < 0) r = 0;
  if (g < 0) g = 0;
  if (b < 0) b = 0;

  return ("${toHex(r)}${toHex(g)}${toHex(b)}");
}

main() {
  // Sample test cases
  test('Basic tests', () {
    expect(rgb(255, 255, 255), equals('FFFFFF'));
    expect(rgb(255, 255, 300), equals('FFFFFF'));
    expect(rgb(0, 0, 0), equals('000000'));
    expect(rgb(148, 0, 211), equals('9400D3'));
    expect(rgb(148, -20, 211), equals('9400D3'));
    expect(rgb(144, 195, 212), equals('90C3D4'));
    expect(rgb(212, 53, 12), equals('D4350C'));
  });

  Random rng = new Random();
  test('Random tests (100 assertions)', () {
    final int tests = 100;
    int r, g, b;
    for (int i = 0; i < tests; i++) {
      r = rng.nextInt(450) - 50;
      g = rng.nextInt(450) - 50;
      b = rng.nextInt(450) - 50;
      expect(rgb(r, g, b), equals(solution(r, g, b)));
    }
  });
}
