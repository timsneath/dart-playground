import 'dart:math';


abstract class Shape {

  factory Shape(String type) {
    if (type == 'circle') return new Circle(2);
    if (type == 'square') return new Square(2);
    if (type == 'rectangle') return new Rectangle(4, 8);
    if (type == 'oval') return new Oval(4, 4);
    throw ("Can't create $type.");
  }

  num get area;
}

class Oval implements Shape {
  final num width;
  final num height;

  Oval(this.width, this.height);

  num get area => PI * (width / 2) * (height / 2);
}

class Circle implements Oval {
  final num radius;
  num get width => radius * 2;
  num get height => radius * 2;

  Circle(this.radius);

  num get area => PI * pow(radius, 2);
}

class Rectangle implements Shape {
  final num width;
  final num height;

  Rectangle(this.width, this.height);

  num get area => width * height;
}

class Square implements Rectangle {
  final num side;
  num get width => side;
  num get height => side;

  Square(this.side);

  num get area => pow(side, 2);
}

main() {
  var oval = new Shape('oval');
  var circle = new Shape('circle');
  var square = new Shape('square');
  var rectangle = new Shape('rectangle');

  print(oval.area);
  print(circle.area);
  print(square.area);
  print(rectangle.area);
}