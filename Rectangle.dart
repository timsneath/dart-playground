import "dart:math";

class Rectangle {
  Point origin;
  int width;
  int height;

  Rectangle({
    this.origin = const Point(0,0), 
    this.width = 0,
    this.height = 0});

  @override
  String toString() => "Origin(${origin.x}, ${origin.y}), ${width}w x ${height}h";
}

void main() {
  var rect = new Rectangle(origin: const Point(30, 300), width: 0, height: 20);
  rect.origin = const Point(50, 100);
  rect.width += rect.height * 2;
  print(rect);

  print(new Rectangle(origin: const Point(10, 20), width: 100, height: 200));
  print(new Rectangle(width: 200));
  print(new Rectangle());
}