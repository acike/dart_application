// ========================================
// ตัวอย่างฟังก์ชัน Recursive ขั้นสูง สำหรับนักเรียน
// ========================================
// ไฟล์นี้ประกอบด้วยตัวอย่างที่ซับซ้อนขึ้นและแบบฝึกหัดเพิ่มเติม

void main() {
  print('=== ตัวอย่างฟังก์ชัน Recursive ขั้นสูง ===\n');

  // ตัวอย่างที่ 1: การหา Minimum ใน Array
  print('1. การหา Minimum ใน Array:');
  List<int> numbers = [5, 1, 8, 2, 9, 3];
  print('Array: $numbers');
  print('Minimum = ${findMin(numbers)}\n');

  // ตัวอย่างที่ 2: การนับจำนวนตัวอักษรใน String
  print('2. การนับจำนวนตัวอักษรใน String:');
  String text = "Hello World";
  print('String: "$text"');
  print('จำนวนตัวอักษร = ${countCharacters(text)}\n');

  // ตัวอย่างที่ 3: การตรวจสอบ Prime Number
  print('3. การตรวจสอบ Prime Number:');
  print('17 เป็น Prime: ${isPrime(17)}');
  print('15 เป็น Prime: ${isPrime(15)}');
  print('2 เป็น Prime: ${isPrime(2)}\n');

  // ตัวอย่างที่ 4: การหา LCM (Least Common Multiple)
  print('4. การหา LCM:');
  print('LCM(12, 18) = ${lcm(12, 18)}');
  print('อธิบาย: LCM = (12 × 18) ÷ GCD(12, 18) = 216 ÷ 6 = 36\n');

  // ตัวอย่างที่ 5: การแปลง Decimal เป็น Octal
  print('5. การแปลง Decimal เป็น Octal:');
  print('25 ในระบบ Octal = ${decimalToOctal(25)}');
  print('อธิบาย: 25 = 31 (3×8¹ + 1×8⁰ = 24 + 1 = 25)\n');

  // ตัวอย่างที่ 6: การหา Sum ของ Array แบบ Recursive
  print('6. การหา Sum ของ Array แบบ Recursive:');
  print('Array: $numbers');
  print('Sum = ${sumArrayRecursive(numbers)}\n');

  // ตัวอย่างที่ 7: การ Reverse Array
  print('7. การ Reverse Array:');
  print('Original: $numbers');
  print('Reversed: ${reverseArray(numbers)}\n');

  // ตัวอย่างที่ 8: การหา Product ของ Array
  print('8. การหา Product ของ Array:');
  List<int> smallNumbers = [2, 3, 4];
  print('Array: $smallNumbers');
  print('Product = ${productArray(smallNumbers)}\n');

  // ตัวอย่างที่ 9: การตรวจสอบว่า Array เรียงลำดับหรือไม่
  print('9. การตรวจสอบว่า Array เรียงลำดับหรือไม่:');
  List<int> sortedArray = [1, 2, 3, 4, 5];
  List<int> unsortedArray = [3, 1, 4, 2, 5];
  print('$sortedArray เรียงลำดับ: ${isSorted(sortedArray)}');
  print('$unsortedArray เรียงลำดับ: ${isSorted(unsortedArray)}\n');

  // ตัวอย่างที่ 10: การหา Count ของ Element ใน Array
  print('10. การหา Count ของ Element ใน Array:');
  List<int> countArray = [1, 2, 2, 3, 2, 4];
  print('Array: $countArray');
  print('Count ของ 2 = ${countElement(countArray, 2)}');
  print('Count ของ 5 = ${countElement(countArray, 5)}\n');

  // แบบฝึกหัด
  print('=== แบบฝึกหัด ===\n');
  print('ลองเขียนฟังก์ชัน recursive สำหรับ:');
  print('1. การหา Average ของ Array');
  print('2. การตรวจสอบว่า String มีเฉพาะตัวอักษรหรือไม่');
  print('3. การหา Mode (ค่าที่ปรากฏบ่อยที่สุด) ใน Array');
  print('4. การแปลง Binary เป็น Decimal');
  print('5. การหา Sum ของ Even Numbers ใน Array');
}

// ========================================
// ตัวอย่างที่ 1: หา Minimum ใน Array
// ========================================
int findMin(List<int> arr) {
  // Base Case: array มี 1 ตัว
  if (arr.length == 1) {
    return arr.first;
  }
  // Recursive Case: เปรียบเทียบตัวแรกกับ min ของส่วนที่เหลือ
  int minOfRest = findMin(arr.sublist(1));
  print('minOfRest: $minOfRest');
  print('arr.first: ${arr.first}');
  print(
    'arr.first < minOfRest: ${arr.first < minOfRest ? arr.first : minOfRest}',
  );
  return arr.first < minOfRest ? arr.first : minOfRest;
}

// ========================================
// ตัวอย่างที่ 2: นับจำนวนตัวอักษรใน String
// ========================================
int countCharacters(String str) {
  // Base Case: string ว่าง
  if (str.isEmpty) {
    return 0;
  }
  // Base Case: ถ้าตัวแรกเป็น space ไม่นับ
  if (str.substring(0, 1) == ' ') {
    return 0 + countCharacters(str.substring(1));
  }
  // Recursive Case: 1 + นับส่วนที่เหลือ
  return 1 + countCharacters(str.substring(1));
}

// ========================================
// ตัวอย่างที่ 3: ตรวจสอบ Prime Number
// ========================================
bool isPrime(int n) {
  // Base Case: n < 2 ไม่ใช่ prime
  if (n < 2) {
    return false;
  }
  // Base Case: n = 2 เป็น prime
  if (n == 2) {
    return true;
  }
  // Recursive Case: ตรวจสอบหารด้วย 2 ถึง sqrt(n)
  return isPrimeHelper(n, 2);
}

bool isPrimeHelper(int n, int divisor) {
  // Base Case: ตรวจสอบครบแล้ว
  if (divisor * divisor > n) {
    return true;
  }
  // Base Case: หารลงตัว
  if (n % divisor == 0) {
    return false;
  }
  // Recursive Case: ตรวจสอบตัวถัดไป
  return isPrimeHelper(n, divisor + 1);
}

// ========================================
// ตัวอย่างที่ 4: หา LCM (Least Common Multiple)
// ========================================
int lcm(int a, int b) {
  // ใช้สูตร: LCM(a, b) = (a × b) ÷ GCD(a, b)
  return (a * b) ~/ gcd(a, b);
}

// ฟังก์ชัน GCD จากไฟล์ก่อนหน้า
int gcd(int a, int b) {
  if (b == 0) {
    return a;
  }
  return gcd(b, a % b);
}

// ========================================
// ตัวอย่างที่ 5: แปลง Decimal เป็น Octal
// ========================================
String decimalToOctal(int number) {
  // Base Case: number = 0
  if (number == 0) {
    return "";
  }
  // Recursive Case: octal ของ number/8 + remainder
  return decimalToOctal(number ~/ 8) + (number % 8).toString();
}

// ========================================
// ตัวอย่างที่ 6: Sum ของ Array แบบ Recursive
// ========================================
int sumArrayRecursive(List<int> arr) {
  // Base Case: array ว่าง
  if (arr.isEmpty) {
    return 0;
  }
  // Recursive Case: ตัวแรก + sum ของส่วนที่เหลือ
  return arr.first + sumArrayRecursive(arr.sublist(1));
}

// ========================================
// ตัวอย่างที่ 7: Reverse Array
// ========================================
List<int> reverseArray(List<int> arr) {
  // Base Case: array ว่างหรือมี 1 ตัว
  if (arr.length <= 1) {
    return arr;
  }
  // Recursive Case: ตัวสุดท้าย + reverse ของส่วนที่เหลือ
  return [arr.last] + reverseArray(arr.sublist(0, arr.length - 1));
}

// ========================================
// ตัวอย่างที่ 8: Product ของ Array
// ========================================
int productArray(List<int> arr) {
  // Base Case: array ว่าง
  if (arr.isEmpty) {
    return 1;
  }
  // Recursive Case: ตัวแรก × product ของส่วนที่เหลือ
  return arr.first * productArray(arr.sublist(1));
}

// ========================================
// ตัวอย่างที่ 9: ตรวจสอบว่า Array เรียงลำดับหรือไม่
// ========================================
bool isSorted(List<int> arr) {
  // Base Case: array ว่างหรือมี 1 ตัว
  if (arr.length <= 1) {
    return true;
  }
  // Base Case: ตัวแรก > ตัวที่สอง
  if (arr[0] > arr[1]) {
    return false;
  }
  // Recursive Case: ตรวจสอบส่วนที่เหลือ
  return isSorted(arr.sublist(1));
}

// ========================================
// ตัวอย่างที่ 10: นับจำนวน Element ใน Array
// ========================================
int countElement(List<int> arr, int target) {
  // Base Case: array ว่าง
  if (arr.isEmpty) {
    return 0;
  }
  // Recursive Case: ตรวจสอบตัวแรก + นับส่วนที่เหลือ
  int count = arr.first == target ? 1 : 0;
  return count + countElement(arr.sublist(1), target);
}

// ========================================
// แบบฝึกหัดเพิ่มเติม
// ========================================

// แบบฝึกหัดที่ 1: หา Average ของ Array
double averageArray(List<int> arr) {
  // TODO: เขียนโค้ดที่นี่
  // ใช้ sumArrayRecursive และ countCharacters
  return 0.0; // เปลี่ยนเป็นโค้ดจริง
}

// แบบฝึกหัดที่ 2: ตรวจสอบว่า String มีเฉพาะตัวอักษรหรือไม่
bool isAlphabetic(String str) {
  // TODO: เขียนโค้ดที่นี่
  // ตรวจสอบว่าแต่ละตัวอักษรเป็น a-z หรือ A-Z
  return false; // เปลี่ยนเป็นโค้ดจริง
}

// แบบฝึกหัดที่ 3: หา Mode (ค่าที่ปรากฏบ่อยที่สุด) ใน Array
int findMode(List<int> arr) {
  // TODO: เขียนโค้ดที่นี่
  // ใช้ countElement เพื่อหาค่าที่ปรากฏบ่อยที่สุด
  return 0; // เปลี่ยนเป็นโค้ดจริง
}

// แบบฝึกหัดที่ 4: แปลง Binary เป็น Decimal
int binaryToDecimal(String binary) {
  // TODO: เขียนโค้ดที่นี่
  // แปลงจาก binary string เป็น decimal
  return 0; // เปลี่ยนเป็นโค้ดจริง
}

// แบบฝึกหัดที่ 5: หา Sum ของ Even Numbers ใน Array
int sumEvenNumbers(List<int> arr) {
  // TODO: เขียนโค้ดที่นี่
  // หาผลรวมของเลขคู่ใน array
  return 0; // เปลี่ยนเป็นโค้ดจริง
}
