// เฉลย: Balanced Parentheses

import '../stack.dart';

bool isBalanced(String input) {
  final Stack<String> openStack = Stack<String>();
  final Map<String, String> matching = <String, String>{
    ')': '(',
    ']': '[',
    '}': '{',
  };

  for (final String ch in input.split('')) {
    switch (ch) {
      case '(':
      case '[':
      case '{':
        openStack.push(ch);
        break;
      case ')':
      case ']':
      case '}':
        if (openStack.isEmpty) return false;
        final String top = openStack.pop();
        if (matching[ch] != top) return false;
        break;
      default:
        // ไม่ใช่วงเล็บ ข้ามได้
        break;
    }
  }

  return openStack.isEmpty;
}

void main() {
  final List<String> samples = <String>[
    '({[]})',
    '([)]',
    '(((())))',
    '([{}]){}',
    '([)',
  ];

  for (final s in samples) {
    print('$s => ${isBalanced(s)}');
  }
}
