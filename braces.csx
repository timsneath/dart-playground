// C# implementation of braces.dart for comparison purposes

using System;
bool openBrace(char brace) => brace == '(' || brace == '[' || brace == '{';
bool closeBrace(char brace) => brace == ')' || brace == ']' || brace == '}';

bool bracesMatch(char open, char close) =>
    open == '{' && close == '}' ||
    open == '[' && close == ']' ||
    open == '(' && close == ')';

bool validBraces(string braces)
{
    var stack = new Stack<char>();

    foreach (char brace in braces)
    {
        if (openBrace(brace))
        {
            stack.Push(brace);
        }
        else if (closeBrace(brace))
        {
            if ((stack.Count == 0) || (!bracesMatch(stack.Pop(), brace)))
            {
                return false;
            }
        }
        else
        {
            return false; // not a brace character at all
        }
    }

    // if nothing failed and there's nothing left on the stack, 
    // then all braces match
    return (stack.Count == 0);
}

String s = "{(((){}({})(([{{[]}}]))))}";
// String s = '';
Console.WriteLine(validBraces(s));

Debug.Assert(validBraces("()"));
Debug.Assert(validBraces("(){}[]"));
Debug.Assert(validBraces("([{}])"));
Debug.Assert(!validBraces("(}"));
Debug.Assert(!validBraces("[(])"));
Debug.Assert(!validBraces("[({})](]"));