import 'dart:collection';
import "package:test/test.dart";

bool openBrace(brace) => brace == '(' || brace == '[' || brace == '{';
bool closeBrace(brace) => brace == ')' || brace == ']' || brace == '}';

bool bracesMatch(open, close) =>
    open == '{' && close == '}' ||
    open == '[' && close == ']' ||
    open == '(' && close == ')';

bool validBraces(String braces) {
  var stack = new Queue();

  for (var brace in braces.split('')) {
    if (openBrace(brace)) {
      stack.add(brace);
    } else if (closeBrace(brace)) {
      if ((stack.length == 0) || (!bracesMatch(stack.removeLast(), brace))) {
        return false;
      }
    } else {
      return false; // not a brace character at all
    }
  }

    // if nothing failed and there's nothing left on the stack, 
    // then all braces match
    return (stack.length == 0);
}

main() {
  String s = '{(((){}({})(([{{}}]))))}';
  // String s = '';
  print(validBraces(s));

  test('Example tests', () {
  expect(validBraces( '()' ), isTrue);
  expect(validBraces("(){}[]"), isTrue);
  expect(validBraces("([{}])"), isTrue);
  expect(validBraces("(}"), isFalse);
  expect(validBraces( '[(])' ), isFalse);
  expect(validBraces("[({})](]"), isFalse);
  });
}
