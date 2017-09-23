class Bicycle {
  int cadence;
  int _speed;
  int gear;

  Bicycle(this.cadence, this._speed, this.gear);

  int get speed => _speed;

  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int increment) {
    _speed += increment;
  }
 
  @override
  String toString() => "Bicycle: $_speed mph";
}


void main() {
  var bike = new Bicycle(2, 0, 1);
  print(bike);
}