printNumber(num aNumber)
{
  print('The number is $aNumber.');
  for (; aNumber < 1000; aNumber++);
  print('After incrementing, the number is $aNumber.');
}

doubleExamples() {
  // more precision than the Dart double type can handle
  var pi = 3.1415926535897932384626433832;
  print('π ≈ $pi');
  print('π is even more roughly ${pi.toStringAsPrecision(3)}');
}

dateTimeExamples() {
  DateTime myBirth = new DateTime.utc(1973, DateTime.AUGUST, 26, );
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
  doubleExamples();
  print("");
  dateTimeExamples();
}
