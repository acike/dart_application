// ========================================
// ตัวอย่างฟังก์ชันแบบ Recursive สำหรับนักเรียน
// ========================================
// Recursive คือการที่ฟังก์ชันเรียกตัวเองซ้ำๆ จนกว่าจะถึงเงื่อนไขที่หยุด
// ประกอบด้วย 2 ส่วนสำคัญ:
// 1. Base Case (กรณีพื้นฐาน) - เงื่อนไขที่ทำให้หยุดเรียกตัวเอง
// 2. Recursive Case (กรณีเรียกตัวเอง) - เงื่อนไขที่ทำให้เรียกตัวเองต่อ

void main() {
  print('=== ตัวอย่างฟังก์ชัน Recursive ===\n');

  // ตัวอย่างที่ 1: การหาค่า Factorial
  print('1. การหาค่า Factorial:');
  print('5! = ${factorial(5)}');
  print('อธิบาย: 5! = 5 × 4 × 3 × 2 × 1 = 120\n');

  // ตัวอย่างที่ 2: การหาค่า Fibonacci
  print('2. การหาค่า Fibonacci:');
  print('Fibonacci(7) = ${fibonacci(7)}');
  print('ลำดับ: ${fibonacciSequence(7)}\n');

  // ตัวอย่างที่ 3: การหาค่า Sum ของ Array
  print('3. การหาค่า Sum ของ Array:');
  List<int> numbers = [1, 2, 3, 4, 5];
  print('Array: $numbers');
  print('Sum = ${arraySum(numbers)}\n');

  // ตัวอย่างที่ 4: การหา Maximum ใน Array
  print('4. การหา Maximum ใน Array:');
  print('Array: $numbers');
  print('Maximum = ${findMax(numbers)}\n');

  // ตัวอย่างที่ 5: การ Reverse String
  print('5. การ Reverse String:');
  String text = "Hello World";
  print('Original: $text');
  print('Reversed: ${reverseString(text)}\n');

  // ตัวอย่างที่ 6: การหา GCD (Greatest Common Divisor)
  print('6. การหา GCD:');
  print('GCD(48, 18) = ${gcd(48, 18)}');
  print('อธิบาย: 48 = 2×2×2×2×3, 18 = 2×3×3, GCD = 2×3 = 6\n');

  // ตัวอย่างที่ 7: การตรวจสอบ Palindrome
  print('7. การตรวจสอบ Palindrome:');
  print('"racecar" เป็น Palindrome: ${isPalindrome("racecar")}');
  print('"hello" เป็น Palindrome: ${isPalindrome("hello")}\n');

  // ตัวอย่างที่ 8: การหา Power
  print('8. การหา Power:');
  print('2^5 = ${power(2, 5)}');
  print('3^4 = ${power(3, 4)}\n');

  // ตัวอย่างที่ 9: การหา Sum ของ Digits
  print('9. การหา Sum ของ Digits:');
  print('Sum ของ 12345 = ${sumOfDigits(12345)}');
  print('อธิบาย: 1+2+3+4+5 = 15\n');

  // ตัวอย่างที่ 10: การหา Binary Representation
  print('10. การหา Binary Representation:');
  print('13 ในระบบ Binary = ${decimalToBinary(13)}');
  print('อธิบาย: 13 = 1101 (2^3 + 2^2 + 2^0 = 8 + 4 + 1 = 13)');
}

// ========================================
// ตัวอย่างที่ 1: Factorial
// ========================================
// n! = n × (n-1) × (n-2) × ... × 1
// Base Case: n = 0 หรือ n = 1 จะได้ 1
// Recursive Case: n! = n × (n-1)!
int factorial(int n) {
  // Base Case: หยุดเมื่อ n = 0 หรือ 1
  if (n <= 1) {
    return 1;
  }
  // Recursive Case: n! = n × (n-1)!
  // case1
  return n * factorial(n - 1);

  // case 2
  // var gg = factorial(n - 1);
  // var res = n * gg;
  // return res;

  // case 3
  // var gg = n * factorial(n - 1);
  // return gg;
}

// ========================================
// ตัวอย่างที่ 2: Fibonacci
// ========================================
// F(n) = F(n-1) + F(n-2)
// Base Case: F(0) = 0, F(1) = 1
// Recursive Case: F(n) = F(n-1) + F(n-2)
int fibonacci(int n) {
  // Base Case: หยุดเมื่อ n = 0 หรือ 1
  if (n <= 1) {
    return n;
  }
  // Recursive Case: F(n) = F(n-1) + F(n-2)
  return fibonacci(n - 1) + fibonacci(n - 2);
}

// ฟังก์ชันเสริมสำหรับแสดงลำดับ Fibonacci
List<int> fibonacciSequence(int n) {
  List<int> sequence = [];
  for (int i = 0; i <= n; i++) {
    sequence.add(fibonacci(i));
  }
  return sequence;
}

// ========================================
// ตัวอย่างที่ 3: Sum ของ Array
// ========================================
// Base Case: array ว่าง จะได้ 0
// Recursive Case: sum = ตัวแรก + sum ของส่วนที่เหลือ
int arraySum(List<int> arr) {
  // Base Case: หยุดเมื่อ array ว่าง
  if (arr.isEmpty) {
    return 0;
  }
  // Recursive Case: ตัวแรก + sum ของส่วนที่เหลือ
  return arr.first + arraySum(arr.sublist(1));
}

// ========================================
// ตัวอย่างที่ 4: หา Maximum ใน Array
// ========================================
// Base Case: array มี 1 ตัว จะได้ตัวนั้น
// Recursive Case: max = max(ตัวแรก, max ของส่วนที่เหลือ)
int findMax(List<int> arr) {
  // Base Case: หยุดเมื่อ array มี 1 ตัว
  if (arr.length == 1) {
    return arr.first;
  }
  // Recursive Case: เปรียบเทียบตัวแรกกับ max ของส่วนที่เหลือ
  int maxOfRest = findMax(arr.sublist(1));
  return arr.first > maxOfRest ? arr.first : maxOfRest;
}

// ========================================
// ตัวอย่างที่ 5: Reverse String
// ========================================
// Base Case: string ว่างหรือมี 1 ตัวอักษร
// Recursive Case: ตัวสุดท้าย + reverse ของส่วนที่เหลือ
String reverseString(String str) {
  // Base Case: หยุดเมื่อ string ว่างหรือมี 1 ตัวอักษร
  if (str.length <= 1) {
    return str;
  }
  // Recursive Case: ตัวสุดท้าย + reverse ของส่วนที่เหลือ
  return str[str.length - 1] + reverseString(str.substring(0, str.length - 1));
}

// ========================================
// ตัวอย่างที่ 6: GCD (Greatest Common Divisor)
// ========================================
// ใช้ Euclidean Algorithm
// Base Case: b = 0 จะได้ a
// Recursive Case: GCD(a, b) = GCD(b, a % b)
int gcd(int a, int b) {
  // Base Case: หยุดเมื่อ b = 0
  if (b == 0) {
    return a;
  }
  // Recursive Case: GCD(a, b) = GCD(b, a % b)
  return gcd(b, a % b);
}

// ========================================
// ตัวอย่างที่ 7: ตรวจสอบ Palindrome
// ========================================
// Base Case: string ว่างหรือมี 1 ตัวอักษร = true
// Recursive Case: ตัวแรก = ตัวสุดท้าย และ palindrome ของส่วนกลาง
bool isPalindrome(String str) {
  // Base Case: หยุดเมื่อ string ว่างหรือมี 1 ตัวอักษร
  if (str.length <= 1) {
    return true;
  }
  // Recursive Case: ตรวจสอบตัวแรกกับตัวสุดท้าย และส่วนกลาง
  if (str[0] != str[str.length - 1]) {
    return false;
  }
  return isPalindrome(str.substring(1, str.length - 1));
}

// ========================================
// ตัวอย่างที่ 8: Power
// ========================================
// Base Case: exponent = 0 จะได้ 1
// Recursive Case: base^exp = base × base^(exp-1)
int power(int base, int exponent) {
  // Base Case: หยุดเมื่อ exponent = 0
  if (exponent == 0) {
    return 1;
  }
  // Recursive Case: base^exp = base × base^(exp-1)
  return base * power(base, exponent - 1);
}

// ========================================
// ตัวอย่างที่ 9: Sum ของ Digits
// ========================================
// Base Case: number < 10 จะได้ number
// Recursive Case: sum = หลักสุดท้าย + sum ของหลักที่เหลือ
int sumOfDigits(int number) {
  // Base Case: หยุดเมื่อ number < 10
  if (number < 10) {
    return number;
  }
  // Recursive Case: หลักสุดท้าย + sum ของหลักที่เหลือ
  return (number % 10) + sumOfDigits(number ~/ 10);
}

// ========================================
// ตัวอย่างที่ 10: แปลง Decimal เป็น Binary
// ========================================
// Base Case: number = 0 จะได้ ""
// Recursive Case: binary = binary ของ number/2 + remainder
String decimalToBinary(int number) {
  // Base Case: หยุดเมื่อ number = 0
  if (number == 0) {
    return "";
  }
  // Recursive Case: binary ของ number/2 + remainder
  return decimalToBinary(number ~/ 2) + (number % 2).toString();
}
