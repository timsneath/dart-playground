main() {
  var ints = [1, 2, 3];
  var fibonacci = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];

  // this adds a list as third element
  ints.add([1, 2, 3]);

  // this doesn't work - can't add to itself
  // ints.addAll(ints);

  // and note that this also doesn't work - identical object (same hashcode)
  // var tempInts = ints;
  // tempInts.addAll(ints);

  var tempInts = new List.from(ints);
  print(tempInts.hashCode == ints.hashCode); // different object
  tempInts.addAll(ints);
  ints = tempInts;
  
  ints.addAll([1, 2, 3]);

  ints.add(4);

  print('\$ints: $ints -- length ${ints.length}');

  print('${ints[3]}');

  // cascade can be used like with / end with in VB
  fibonacci
  ..add(55 + 89)
  ..add(89 + (55 + 89));

  print('\$fibonacci: $fibonacci');

  // mapping converts a List to a MappedListIterable - why?
  final fibonacci2 = fibonacci.map((x) => x * 2);
  print('\$fibonacci2: $fibonacci2');

  print(fibonacci.runtimeType);
  print(fibonacci2.runtimeType);

  
}