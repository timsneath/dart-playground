printNumber(num aNumber) {
  print('The number is $aNumber.');
  for (; aNumber < 1000; aNumber++);
  print('After incrementing, the number is $aNumber.');
}

String evenOrOdd(int number) => number % 2 == 0 ? 'Even' : 'Odd';

int squareSum(List numbers) => numbers.isEmpty
    ? 0
    : numbers.map((x) => x * x).reduce((total, x) => total + x);

int squareSum2(List numbers) => numbers.fold(0, (total, x) => total + x * x);

int squareSum3(List numbers) {
  int sum = 0;
  for (int x in numbers) sum += x * x;
  return sum;
}

intExamples() {
  // choose a function, any function
  const func = squareSum2;

  print(func([1, 2]));
  print(func([0, 3, 4, 5]));
  print(func([]));
  print(func([-1, -2]));
  print(func([-1, 0, 1]));
}

doubleExamples() {
  // more precision than the Dart double type can handle
  var pi = 3.1415926535897932384626433832;
  print('π ≈ $pi');
  print('π is even more roughly ${pi.toStringAsPrecision(3)}');
}

dateTimeExamples() {
  DateTime myBirth = new DateTime.utc(
    1973,
    DateTime.AUGUST,
    26,
  );
  print('I was born on ${myBirth.toString()}');
  print('Was I born on a Sunday? ${myBirth.weekday == 7 ? 'Yes' : 'No'}');
  print('The type of \$myBirth is ${myBirth.runtimeType}');

  DateTime myBirth2 = new DateTime.utc(1973, DateTime.AUGUST, 26);
  print('\$myBirth == \$myBirth2? ${myBirth == myBirth2}');

  var tenThousand = myBirth.add(new Duration(days: 10000));
  print("Ten thousand days later: $tenThousand");
}

main() {
  var number = 42;
  printNumber(number);
  print('Numbers are passed by value. The number is still $number.');
  print("");
  intExamples();
  print("");
  doubleExamples();
  print("");
  dateTimeExamples();
}
