import 'dart:math';
import 'package:test/test.dart';

String brainLuck(String code, String input) {
  var data = new List<int>();
  int dataPtr = 0;
  int instPtr = 0;
  int inputPtr = 0;
  String output = '';

  while (instPtr < code.length) {
    switch (code[instPtr]) {
      case '>': // increment data pointer
        dataPtr++;
        while (dataPtr >= data.length) {
          // add space as necessary so dataPtr doesn't overflow
          data.add(0);
        }
        break;

      case '<': // decrement data pointer
        dataPtr--;
        break;

      case '+': // increment byte at data pointer
        data[dataPtr]++;
        if (data[dataPtr] > 255) {
          data[dataPtr] = 0;
        }
        break;

      case '-': // decrement byte at data pointer
        if (dataPtr >= data.length) {
          throw new Exception(
              "Segmentation fault at '-' instruction: attempted to read location ${dataPtr} from data buffer length ${data.length}");
        }
        data[dataPtr]--;
        if (data[dataPtr] < 0) {
          data[dataPtr] = 255;
        }
        break;

      case '.': // write one byte from data pointer to output
        output += new String.fromCharCode(data[dataPtr]);
        break;

      case ',': // move one byte of input to data pointer
        while (dataPtr >= data.length) {
          // add space as necessary so dataPtr doesn't overflow
          data.add(0);
        }
        // TODO - convert from UTF-16 to ASCII?
        data[dataPtr] = input[inputPtr++].codeUnitAt(0);
        break;

      case '[': // if byte at data pointer is 0, jump to ']' + 1
        if (dataPtr >= data.length) {
          throw new Exception(
              "Segmentation fault at '[' instruction - attempted to read location ${dataPtr} from data buffer length ${data.length}");
        }
        if (data[dataPtr] == 0) {
          // find matching brace
          int nestingLevel = -1;
          while (code[instPtr] != ']' || nestingLevel > 0) {
            if (code[instPtr] == '[') nestingLevel++;
            if (code[instPtr] == ']') nestingLevel--;

            instPtr++;
            if (instPtr >= code.length) {
              throw new Exception(
                  "Segmentation fault - attempted to step beyond address ${code.length}.");
            }
          }
        }
        break;

      case ']': // if byte at data pointer != 0, jump back to '[' + 1
        if (data[dataPtr] != 0) {
          // find matching brace
          int nestingLevel = -1;
          while (code[instPtr] != '[' || nestingLevel > 0) {
            if (code[instPtr] == ']') nestingLevel++;
            if (code[instPtr] == '[') nestingLevel--;

            instPtr--;
            if (instPtr < 0) {
              throw new Exception(
                  "Segmentation fault - attempted to step before address 0.");
            }
          }
        }
        break;

      default:
        throw new Exception(
            "Unsupported instruction: ${code[instPtr]} at index ${instPtr}.");
    }

    instPtr++;
  }

  return output;
}

main() {
  Random r = new Random();
  var output, expectedOutput;

  do {
    List<int> nums = [
      r.nextInt(sqrt(255).toInt()),
      r.nextInt(sqrt(255).toInt())
    ];

    // List<int> nums = [0, 0];
    print("Input: ${nums}");
    output = brainLuck(',>,<[>[->+>+<<]>>[-<<+>>]<<<-]>>.',
        new String.fromCharCodes([nums[0], nums[1]]));
    expectedOutput = new String.fromCharCode(nums[0] * nums[1]);
    print("Output: ${output} | Expected output: ${expectedOutput}");
  } while (output == expectedOutput);

  // test(
  //     "test echo until byte 255 encountered",
  //     () => expect(
  //         brainLuck(",+[-.,+]", "Codewars${new String.fromCharCode(255)}"),
  //         equals("Codewars")));
  // test(
  //     "hello world",
  //     () => expect(
  //         brainLuck(
  //             '++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.',
  //             ''),
  //         equals('Hello World!')));

  // test("multiplying", () {
  //   List<int> nums = [
  //     r.nextInt(sqrt(255).toInt()),
  //     r.nextInt(sqrt(255).toInt())
  //   ];
  //   expect(
  //       brainLuck(',>,<[>[->+>+<<]>>[-<<+>>]<<<-]>>.',
  //           new String.fromCharCodes([nums[0], nums[1]])),
  //       new String.fromCharCode(nums[0] * nums[1]));
  // });
}
