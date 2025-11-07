// แบบฝึกหัด: วงเล็บสมดุล (Balanced Parentheses)
// โจทย์: เขียนฟังก์ชันที่คืนค่า true ถ้าวงเล็บในสตริงสมดุล เช่น "({[]})" -> true, "([)]" -> false
// แนะนำให้ใช้ Stack<char>

import '../stack.dart';

bool isBalanced(String input) {
  // แนวคิด:
  // - เมื่อเจอวงเล็บเปิด: push เข้าสต็ก
  // - เมื่อเจอวงเล็บปิด: pop วงเล็บเปิดจากสแตกมาเช็คว่าจับคู่กันได้ไหม
  // - สุดท้ายสแตกต้องว่าง
  final Stack<String> openStack = Stack<String>();
  final Map<String, String> matching = <String, String>{
    ')': '(',
    ']': '[',
    '}': '{',
  };

  for (final String ch in input.split('')) {
    if (ch == '(' || ch == '[' || ch == '{') {
      openStack.push(ch);
    } else if (ch == ')' || ch == ']' || ch == '}') {
      if (openStack.isEmpty) return false;
      final String top = openStack.pop();
      if (matching[ch] != top) return false;
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
