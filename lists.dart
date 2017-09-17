main() {
  var ints = [1, 2, 3];
  var fibonacci = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];

  ints.add(ints);
  ints.add(4);

  print('\$ints: $ints -- length ${ints.length}');
  
  // why does this not print [1, 2, 3]?
  print('${ints[3]}');

  // TODO: map a list to double its value

  // cascade can be used like with / end with in VB
  fibonacci
  ..add(55 + 89)
  ..add(89 + (55 + 89));

  print('\$fibonacci: $fibonacci');
}