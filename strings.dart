String reverse(String str) {
  String str2 = '';

  for (var i = str.length - 1; i >= 0; i--) {
    str2 += str[i];
  }
  return str2;
}

String createPhoneNumber(List numbers) =>
    '(${numbers.sublist(0,3).join()}) ${numbers.sublist(3,6).join()}-${numbers.sublist(6,10).join()}';

main() {
  print(reverse('Hello world'));
  print(createPhoneNumber(
      [1, 2, 3, 4, 5, 6, 7, 8, 9, 0])); // => returns "(123) 456-7890"
}
