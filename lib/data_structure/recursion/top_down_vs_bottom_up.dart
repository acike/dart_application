// 🎯 Recursion: Top-Down vs Bottom-Up Approach
// =============================================

void main() {
  print('🎯 Recursion: Top-Down vs Bottom-Up');
  print('=' * 50);
  print('');

  // ตัวอย่างที่ 1: Factorial
  print('📚 ตัวอย่างที่ 1: Factorial (5!)');
  print('=' * 40);
  demonstrateFactorial();

  print('\n${'=' * 60}');

  // ตัวอย่างที่ 2: Fibonacci
  print('\n📚 ตัวอย่างที่ 2: Fibonacci');
  print('=' * 40);
  demonstrateFibonacci();

  print('\n${'=' * 60}');

  // ตัวอย่างที่ 3: Sum Array
  print('\n📚 ตัวอย่างที่ 3: รวมตัวเลขใน Array');
  print('=' * 40);
  demonstrateArraySum();

  print('\n${'=' * 60}');

  // สรุปความแตกต่าง
  print('\n🎓 สรุปความแตกต่าง');
  print('=' * 40);
  showSummary();
}

// =============================================
// 📚 ตัวอย่างที่ 1: Factorial
// =============================================

void demonstrateFactorial() {
  print('🎯 คำนวณ 5! = 5 × 4 × 3 × 2 × 1 = 120\n');

  // Top-Down Approach
  print('🔽 TOP-DOWN: เริ่มจากปัญหาใหญ่ → แบ่งเป็นปัญหาเล็ก');
  print('   💭 "5! = 5 × 4!" → "4! = 4 × 3!" → ... → "1! = 1"');

  int resultTopDown = factorialTopDown(5);
  print('   📊 ผลลัพธ์: $resultTopDown\n');

  // Bottom-Up Approach
  print('🔼 BOTTOM-UP: เริ่มจากปัญหาเล็ก → สร้างขึ้นเป็นปัญหาใหญ่');
  print('   💭 "1! = 1" → "2! = 2×1" → "3! = 3×2×1" → ... → "5!"');

  int resultBottomUp = factorialBottomUp(5);
  print('   📊 ผลลัพธ์: $resultBottomUp');
}

// 🔽 TOP-DOWN: เริ่มจากปัญหาใหญ่
int factorialTopDown(int n) {
  print('   🔄 คำนวณ $n!');

  // Base Case: หยุดที่นี่
  if (n <= 1) {
    print('   ✅ Base Case: $n! = 1');
    return 1;
  }

  // Recursive Case: แบ่งปัญหา
  print('   📝 $n! = $n × ${n - 1}!');
  int smallerResult = factorialTopDown(n - 1); // เรียกตัวเอง

  int result = n * smallerResult;
  print('   📊 $n! = $n × $smallerResult = $result');
  return result;
}

// 🔼 BOTTOM-UP: เริ่มจากปัญหาเล็ก
int factorialBottomUp(int n) {
  print('   🔄 คำนวณ $n! แบบ Bottom-Up');

  // เริ่มจาก Base Case
  if (n <= 1) {
    print('   ✅ Base Case: 1! = 1');
    return 1;
  }

  // สร้างผลลัพธ์ขึ้นมาทีละขั้น
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result = result * i;
    print('   📊 $i! = $result');
  }

  return result;
}

// =============================================
// 📚 ตัวอย่างที่ 2: Fibonacci
// =============================================

void demonstrateFibonacci() {
  print('🎯 คำนวณ Fibonacci(5) = 0,1,1,2,3,5...\n');

  // Top-Down Approach
  print('🔽 TOP-DOWN: fib(5) = fib(4) + fib(3)');
  print('   💭 แบ่งปัญหาใหญ่เป็นปัญหาเล็ก');

  int resultTopDown = fibonacciTopDown(5);
  print('   📊 ผลลัพธ์: $resultTopDown\n');

  // Bottom-Up Approach
  print('🔼 BOTTOM-UP: เริ่มจาก fib(0), fib(1) → สร้างขึ้นมา');
  print('   💭 สร้างผลลัพธ์ทีละขั้น');

  int resultBottomUp = fibonacciBottomUp(5);
  print('   📊 ผลลัพธ์: $resultBottomUp');
}

// 🔽 TOP-DOWN Fibonacci
int fibonacciTopDown(int n, {String indent = '   '}) {
  print('$indent🔄 คำนวณ fib($n)');

  // Base Cases
  if (n <= 1) {
    print('$indent✅ Base Case: fib($n) = $n');
    return n;
  }

  // Recursive Case
  print('$indent📝 fib($n) = fib(${n - 1}) + fib(${n - 2})');

  int fib1 = fibonacciTopDown(n - 1, indent: '$indent  ');
  int fib2 = fibonacciTopDown(n - 2, indent: '$indent  ');

  int result = fib1 + fib2;
  print('$indent📊 fib($n) = $fib1 + $fib2 = $result');
  return result;
}

// 🔼 BOTTOM-UP Fibonacci
int fibonacciBottomUp(int n) {
  print('   🔄 คำนวณ fib($n) แบบ Bottom-Up');

  if (n <= 1) {
    print('   ✅ Base Case: fib($n) = $n');
    return n;
  }

  // เริ่มจาก Base Cases และสร้างขึ้นมา
  int prev2 = 0; // fib(0)
  int prev1 = 1; // fib(1)

  print('   📊 fib(0) = $prev2');
  print('   📊 fib(1) = $prev1');

  int current = 0;
  for (int i = 2; i <= n; i++) {
    current = prev1 + prev2;
    print(
      '   📊 fib($i) = fib(${i - 1}) + fib(${i - 2}) = $prev1 + $prev2 = $current',
    );

    // เลื่อนค่าไปข้างหน้า
    prev2 = prev1;
    prev1 = current;
  }

  return current;
}

// =============================================
// 📚 ตัวอย่างที่ 3: Sum Array
// =============================================

void demonstrateArraySum() {
  List<int> numbers = [1, 2, 3, 4, 5];
  print('🎯 รวมตัวเลข: ${numbers.join(', ')} = 15\n');

  // Top-Down Approach
  print('🔽 TOP-DOWN: sum([1,2,3,4,5]) = 1 + sum([2,3,4,5])');
  print('   💭 เอาตัวแรกออก → แก้ปัญหาที่เหลือ');

  int resultTopDown = sumArrayTopDown(numbers);
  print('   📊 ผลลัพธ์: $resultTopDown\n');

  // Bottom-Up Approach
  print('🔼 BOTTOM-UP: เริ่มจาก 0 → เพิ่มทีละตัว');
  print('   💭 สะสมผลลัพธ์ไปเรื่อยๆ');

  int resultBottomUp = sumArrayBottomUp(numbers);
  print('   📊 ผลลัพธ์: $resultBottomUp');
}

// 🔽 TOP-DOWN Array Sum
int sumArrayTopDown(List<int> numbers, {String indent = '   '}) {
  print('$indent🔄 รวม [${numbers.join(', ')}]');

  // Base Case: array ว่าง
  if (numbers.isEmpty) {
    print('$indent✅ Base Case: [] = 0');
    return 0;
  }

  // Base Case: เหลือตัวเดียว
  if (numbers.length == 1) {
    print('$indent✅ Base Case: [${numbers[0]}] = ${numbers[0]}');
    return numbers[0];
  }

  // Recursive Case: เอาตัวแรก + ผลรวมที่เหลือ
  int first = numbers[0];
  List<int> rest = numbers.sublist(1);

  print('$indent📝 [${numbers.join(', ')}] = $first + [${rest.join(', ')}]');

  int restSum = sumArrayTopDown(rest, indent: '$indent  ');
  int result = first + restSum;

  print('$indent📊 ผลลัพธ์: $first + $restSum = $result');
  return result;
}

// 🔼 BOTTOM-UP Array Sum
int sumArrayBottomUp(List<int> numbers) {
  print('   🔄 รวม [${numbers.join(', ')}] แบบ Bottom-Up');

  // เริ่มจาก 0
  int sum = 0;
  print('   📊 เริ่มต้น: sum = $sum');

  // เพิ่มทีละตัว
  for (int i = 0; i < numbers.length; i++) {
    sum += numbers[i];
    print('   📊 เพิ่ม ${numbers[i]}: sum = $sum');
  }

  return sum;
}

// =============================================
// 🎓 สรุปความแตกต่าง
// =============================================

void showSummary() {
  print('''
🔽 TOP-DOWN APPROACH (Divide & Conquer):
   🎯 เริ่มจากปัญหาใหญ่
   📝 แบ่งเป็นปัญหาเล็กๆ
   🔄 เรียกตัวเองด้วยปัญหาที่เล็กลง
   ⚡ ใช้ Call Stack เก็บสถานะ
   
   ✅ ข้อดี:
      • เข้าใจง่าย (ตรงกับวิธีคิดธรรมชาติ)
      • เขียนโค้ดสั้น เรียบง่าย
      • แก้ปัญหาซับซ้อนได้ดี
   
   ❌ ข้อเสีย:
      • ใช้ Memory มาก (Call Stack)
      • อาจช้า (เรียกฟังก์ชันหลายครั้ง)
      • อาจ Stack Overflow

🔼 BOTTOM-UP APPROACH (Build Solution):
   🎯 เริ่มจากปัญหาเล็ก
   📈 สร้างผลลัพธ์ขึ้นมาทีละขั้น
   🔄 ใช้ Loop แทน Recursion
   💾 ใช้ตัวแปรเก็บสถานะ
   
   ✅ ข้อดี:
      • ประหยัด Memory (ไม่ใช้ Call Stack)
      • เร็วกว่า (ไม่เรียกฟังก์ชัน)
      • ไม่มี Stack Overflow
   
   ❌ ข้อเสีย:
      • คิดยากกว่า (ต้องคิดจากล่างขึ้นบน)
      • โค้ดยาวกว่า บางทีซับซ้อนกว่า

🤔 เลือกใช้เมื่อไหร่?

🔽 TOP-DOWN เหมาะกับ:
   • เรียนรู้ Recursion
   • แก้ปัญหาที่คิดแบบแบ่งย่อย
   • Tree/Graph traversal
   • Divide & Conquer algorithms

🔼 BOTTOM-UP เหมาะกับ:
   • ต้องการประสิทธิภาพสูง
   • Memory จำกัด
   • Dynamic Programming
   • Production Code

💡 จำไว้: ทั้งสองวิธีให้ผลลัพธ์เดียวกัน!
   แต่ใช้ Memory และเวลาต่างกัน
  ''');
}

// =============================================
// 🚀 การเปรียบเทียบ Performance
// =============================================

class PerformanceComparison {
  static void comparePerformance() {
    print('\n🚀 เปรียบเทียบประสิทธิภาพ');
    print('=' * 40);

    print('\n📊 Factorial(10):');

    // วัดเวลา Top-Down
    Stopwatch stopwatch = Stopwatch()..start();
    int topDown = factorialTopDownSilent(10);
    stopwatch.stop();
    int topDownTime = stopwatch.elapsedMicroseconds;

    // วัดเวลา Bottom-Up
    stopwatch.reset();
    stopwatch.start();
    int bottomUp = factorialBottomUpSilent(10);
    stopwatch.stop();
    int bottomUpTime = stopwatch.elapsedMicroseconds;

    print('🔽 Top-Down: $topDown ($topDownTimeμs)');
    print('🔼 Bottom-Up: $bottomUp ($bottomUpTimeμs)');

    if (bottomUpTime < topDownTime) {
      double faster = topDownTime / bottomUpTime;
      print('💨 Bottom-Up เร็วกว่า ${faster.toStringAsFixed(1)}x');
    }
  }

  // ฟังก์ชันเงียบ (ไม่ print) สำหรับวัดเวลา
  static int factorialTopDownSilent(int n) {
    if (n <= 1) return 1;
    return n * factorialTopDownSilent(n - 1);
  }

  static int factorialBottomUpSilent(int n) {
    int result = 1;
    for (int i = 1; i <= n; i++) {
      result *= i;
    }
    return result;
  }
}
