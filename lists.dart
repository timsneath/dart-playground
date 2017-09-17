main() {
  var ints = [1, 2, 3];
  var fibonacci = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];

  ints.add(ints);
  ints.add(4);

  print('\$ints: $ints -- length ${ints.length}');
  
  // why does this not print [1, 2, 3]?
  print('${ints[3]}');
  
  print('\$fibonacci: $fibonacci');
}