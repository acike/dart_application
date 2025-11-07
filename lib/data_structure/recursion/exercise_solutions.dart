// ========================================
// เฉลยแบบฝึกหัด Recursive
// ========================================
// ไฟล์นี้ประกอบด้วยเฉลยของแบบฝึกหัดใน advanced_recursive_examples.dart

void main() {
  print('=== เฉลยแบบฝึกหัด Recursive ===\n');

  // ทดสอบเฉลยแบบฝึกหัดที่ 1
  print('1. การหา Average ของ Array:');
  List<int> numbers = [1, 2, 3, 4, 5];
  print('Array: $numbers');
  print('Average = ${averageArray(numbers)}\n');

  // ทดสอบเฉลยแบบฝึกหัดที่ 2
  print('2. การตรวจสอบว่า String มีเฉพาะตัวอักษรหรือไม่:');
  print('"Hello123" มีเฉพาะตัวอักษร: ${isAlphabetic("Hello123")}');
  print('"Hello" มีเฉพาะตัวอักษร: ${isAlphabetic("Hello")}\n');

  // ทดสอบเฉลยแบบฝึกหัดที่ 3
  print('3. การหา Mode (ค่าที่ปรากฏบ่อยที่สุด) ใน Array:');
  List<int> modeArray = [1, 2, 2, 3, 2, 4, 4, 4];
  print('Array: $modeArray');
  print('Mode = ${findMode(modeArray)}\n');

  // ทดสอบเฉลยแบบฝึกหัดที่ 4
  print('4. การแปลง Binary เป็น Decimal:');
  print('Binary "1101" = Decimal ${binaryToDecimal("1101")}');
  print('Binary "1010" = Decimal ${binaryToDecimal("1010")}\n');

  // ทดสอบเฉลยแบบฝึกหัดที่ 5
  print('5. การหา Sum ของ Even Numbers ใน Array:');
  List<int> evenArray = [1, 2, 3, 4, 5, 6, 7, 8];
  print('Array: $evenArray');
  print('Sum ของ Even Numbers = ${sumEvenNumbers(evenArray)}\n');

  // ตัวอย่างเพิ่มเติม
  print('=== ตัวอย่างเพิ่มเติม ===\n');

  // การหา Factorial แบบ Tail Recursive
  print('Factorial แบบ Tail Recursive:');
  print('5! = ${factorialTail(5)}\n');

  // การหา Fibonacci แบบ Tail Recursive
  print('Fibonacci แบบ Tail Recursive:');
  print('Fibonacci(10) = ${fibonacciTail(10)}\n');

  // การ Merge Sort แบบ Recursive
  print('Merge Sort แบบ Recursive:');
  List<int> unsorted = [64, 34, 25, 12, 22, 11, 90];
  print('Original: $unsorted');
  print('Sorted: ${mergeSort(unsorted)}\n');

  // การหา Permutations
  print('Permutations ของ "ABC":');
  List<String> perms = permutations("ABC");
  print('Permutations: $perms');
  print('จำนวน Permutations: ${perms.length}\n');

  // การหา Subsets
  print('Subsets ของ [1, 2, 3]:');
  List<List<int>> subsets = findSubsets([1, 2, 3]);
  print('Subsets: $subsets');
  print('จำนวน Subsets: ${subsets.length}');
}

// ========================================
// เฉลยแบบฝึกหัดที่ 1: หา Average ของ Array
// ========================================
double averageArray(List<int> arr) {
  // ใช้ sumArrayRecursive และ countCharacters
  if (arr.isEmpty) {
    return 0.0;
  }

  int sum = sumArrayRecursive(arr);
  int count = countCharacters(arr.join('')); // แปลง array เป็น string แล้วนับ

  // หรือใช้ arr.length แทน
  // int count = arr.length;

  return sum / count;
}

// ฟังก์ชันช่วย
int sumArrayRecursive(List<int> arr) {
  if (arr.isEmpty) {
    return 0;
  }
  return arr.first + sumArrayRecursive(arr.sublist(1));
}

int countCharacters(String str) {
  if (str.isEmpty) {
    return 0;
  }
  return 1 + countCharacters(str.substring(1));
}

// ========================================
// เฉลยแบบฝึกหัดที่ 2: ตรวจสอบว่า String มีเฉพาะตัวอักษรหรือไม่
// ========================================
bool isAlphabetic(String str) {
  // Base Case: string ว่าง
  if (str.isEmpty) {
    return true;
  }

  // ตรวจสอบตัวอักษรแรก
  String firstChar = str[0];
  bool isLetter =
      (firstChar.codeUnitAt(0) >= 65 && firstChar.codeUnitAt(0) <= 90) || // A-Z
      (firstChar.codeUnitAt(0) >= 97 && firstChar.codeUnitAt(0) <= 122); // a-z

  // ถ้าตัวแรกไม่ใช่ตัวอักษร
  if (!isLetter) {
    return false;
  }

  // Recursive Case: ตรวจสอบส่วนที่เหลือ
  return isAlphabetic(str.substring(1));
}

// ========================================
// เฉลยแบบฝึกหัดที่ 3: หา Mode (ค่าที่ปรากฏบ่อยที่สุด) ใน Array
// ========================================
int findMode(List<int> arr) {
  if (arr.isEmpty) {
    return 0;
  }

  // หาค่าที่ปรากฏบ่อยที่สุด
  int maxCount = 0;
  int mode = arr[0];

  for (int i = 0; i < arr.length; i++) {
    int count = countElement(arr, arr[i]);
    if (count > maxCount) {
      maxCount = count;
      mode = arr[i];
    }
  }

  return mode;
}

int countElement(List<int> arr, int target) {
  if (arr.isEmpty) {
    return 0;
  }
  int count = arr.first == target ? 1 : 0;
  return count + countElement(arr.sublist(1), target);
}

// ========================================
// เฉลยแบบฝึกหัดที่ 4: แปลง Binary เป็น Decimal
// ========================================
int binaryToDecimal(String binary) {
  return binaryToDecimalHelper(binary, 0);
}

int binaryToDecimalHelper(String binary, int index) {
  // Base Case: ตรวจสอบครบทุกตัวอักษร
  if (index >= binary.length) {
    return 0;
  }

  // รับค่าของตัวอักษรปัจจุบัน
  int currentDigit = int.parse(binary[index]);

  // คำนวณค่าของตำแหน่งปัจจุบัน
  int position = binary.length - 1 - index;
  int currentValue = currentDigit * (1 << position); // 2^position

  // Recursive Case: ค่าปัจจุบัน + ค่าของส่วนที่เหลือ
  return currentValue + binaryToDecimalHelper(binary, index + 1);
}

// ========================================
// เฉลยแบบฝึกหัดที่ 5: หา Sum ของ Even Numbers ใน Array
// ========================================
int sumEvenNumbers(List<int> arr) {
  // Base Case: array ว่าง
  if (arr.isEmpty) {
    return 0;
  }

  // ตรวจสอบตัวแรก
  int first = arr.first;
  int sum = first % 2 == 0 ? first : 0; // ถ้าเป็นเลขคู่ให้บวก

  // Recursive Case: sum ของตัวแรก + sum ของส่วนที่เหลือ
  return sum + sumEvenNumbers(arr.sublist(1));
}

// ========================================
// ตัวอย่างเพิ่มเติม: Tail Recursion
// ========================================

// Tail Recursive Factorial
int factorialTail(int n) {
  return factorialTailHelper(n, 1);
}

int factorialTailHelper(int n, int accumulator) {
  // Base Case
  if (n <= 1) {
    return accumulator;
  }
  // Tail Recursive Case: ส่งค่าไปยังการเรียกครั้งถัดไป
  return factorialTailHelper(n - 1, n * accumulator);
}

// Tail Recursive Fibonacci
int fibonacciTail(int n) {
  return fibonacciTailHelper(n, 0, 1);
}

int fibonacciTailHelper(int n, int a, int b) {
  // Base Case
  if (n == 0) {
    return a;
  }
  if (n == 1) {
    return b;
  }
  // Tail Recursive Case
  return fibonacciTailHelper(n - 1, b, a + b);
}

// ========================================
// ตัวอย่างเพิ่มเติม: Merge Sort
// ========================================
List<int> mergeSort(List<int> arr) {
  // Base Case: array ว่างหรือมี 1 ตัว
  if (arr.length <= 1) {
    return arr;
  }

  // แบ่ง array เป็น 2 ส่วน
  int mid = arr.length ~/ 2;
  List<int> left = arr.sublist(0, mid);
  List<int> right = arr.sublist(mid);

  // Recursive Case: sort ส่วนซ้ายและขวา แล้ว merge
  return merge(mergeSort(left), mergeSort(right));
}

List<int> merge(List<int> left, List<int> right) {
  List<int> result = [];
  int i = 0, j = 0;

  // รวม array ทั้งสองแบบเรียงลำดับ
  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }

  // เพิ่มส่วนที่เหลือ
  result.addAll(left.sublist(i));
  result.addAll(right.sublist(j));

  return result;
}

// ========================================
// ตัวอย่างเพิ่มเติม: Permutations
// ========================================
List<String> permutations(String str) {
  List<String> result = [];
  if (str.length <= 1) {
    result.add(str);
    return result;
  }

  for (int i = 0; i < str.length; i++) {
    String currentChar = str[i];
    String remainingChars = str.substring(0, i) + str.substring(i + 1);

    List<String> perms = permutations(remainingChars);
    for (String perm in perms) {
      result.add(currentChar + perm);
    }
  }

  return result;
}

// ========================================
// ตัวอย่างเพิ่มเติม: Subsets
// ========================================
List<List<int>> findSubsets(List<int> arr) {
  List<List<int>> result = [];
  findSubsetsHelper(arr, 0, <int>[], result);
  return result;
}

void findSubsetsHelper(
  List<int> arr,
  int index,
  List<int> current,
  List<List<int>> result,
) {
  // Base Case: ตรวจสอบครบทุกตัว
  if (index >= arr.length) {
    result.add(List.from(current));
    return;
  }

  // ไม่รวมตัวปัจจุบัน
  findSubsetsHelper(arr, index + 1, current, result);

  // รวมตัวปัจจุบัน
  current.add(arr[index]);
  findSubsetsHelper(arr, index + 1, current, result);
  current.removeLast(); // backtrack
}
