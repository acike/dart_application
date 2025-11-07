// 🧠 ทำไมต้องเข้าใจ Call Stack ก่อนเรียน Recursion?
// =========================================================

void main() {
  print('🎯 ทำไมต้องเข้าใจ Call Stack ก่อนเรียน Recursion?');
  print('=' * 60);

  print('\n📚 สาเหตุที่ต้องเรียน Call Stack ก่อน:');
  print('1. 🧠 เข้าใจการทำงานของ Memory');
  print('2. 🔄 เข้าใจการเรียกฟังก์ชันซ้อนกัน');
  print('3. 🐛 Debug ได้ดีขึ้น (Stack Trace)');
  print('4. ⚡ เข้าใจ Performance (Stack Overflow)');
  print('5. 🎯 เตรียมพร้อมสำหรับ Recursion');

  // ตัวอย่างที่ 1: การเข้าใจ Memory
  demonstrateMemoryUnderstanding();

  // ตัวอย่างที่ 2: เปรียบเทียบ Loop vs Recursion
  compareLoopAndRecursion();

  // ตัวอย่างที่ 3: Stack Overflow
  demonstrateStackOverflow();

  // ตัวอย่างที่ 4: การ Debug ที่ดีขึ้น
  demonstrateDebuggingBenefit();
}

// ===============================================
// ตัวอย่างที่ 1: การเข้าใจ Memory
// ===============================================

void demonstrateMemoryUnderstanding() {
  print('\n${'=' * 50}');
  print('📖 ตัวอย่างที่ 1: การเข้าใจ Memory Usage');
  print('=' * 50);

  print('🔍 แต่ละครั้งที่เรียกฟังก์ชัน:');
  print('   📋 สร้าง Stack Frame ใหม่');
  print('   📦 เก็บ Local Variables');
  print('   📍 เก็บ Return Address');
  print('   💾 ใช้ Memory เพิ่มขึ้น');

  showMemoryUsage(1);
}

void showMemoryUsage(int level) {
  print('📊 Level $level - Memory Stack Frame:');
  print('   📋 Function: showMemoryUsage()');
  print('   📦 Parameter: level = $level');
  print('   💾 Memory Used: ${level * 32} bytes (ประมาณ)');

  if (level < 3) {
    showMemoryUsage(level + 1);
  }

  print('📤 Level $level - ออกจาก Stack Frame');
}

// ===============================================
// ตัวอย่างที่ 2: เปรียบเทียบ Loop vs Recursion
// ===============================================

void compareLoopAndRecursion() {
  print('\n${'=' * 50}');
  print('📖 ตัวอย่างที่ 2: เปรียบเทียบ Loop vs Recursion');
  print('=' * 50);

  // Loop Version
  print('🔄 แบบ Loop (ไม่ใช้ Call Stack มาก):');
  int sumLoop = calculateSumLoop(5);
  print('   ผลลัพธ์: $sumLoop');
  print('   💾 Memory: เรียบร้อย (ใช้ Loop)');

  // Recursion Version
  print('\n🔄 แบบ Recursion (ใช้ Call Stack เยอะ):');
  int sumRecursion = calculateSumRecursion(5);
  print('   ผลลัพธ์: $sumRecursion');
  print('   💾 Memory: ใช้ 5 Stack Frames!');
}

// แบบ Loop - ไม่ใช้ Call Stack มาก
int calculateSumLoop(int n) {
  print('   📍 Loop: คำนวณ 1+2+3+...+$n');
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    sum += i;
    print('      Step $i: sum = $sum');
  }
  return sum;
}

// แบบ Recursion - ใช้ Call Stack เยอะ
int calculateSumRecursion(int n) {
  print('   📍 Recursion: calculateSumRecursion($n)');
  print('      Stack: [...] → [calculateSumRecursion($n)]');

  if (n <= 1) {
    print('      ✅ Base Case: return $n');
    return n;
  }

  print('      🔄 เรียก calculateSumRecursion(${n - 1})');
  int result = n + calculateSumRecursion(n - 1);
  print('      📤 return $n + ... = $result');

  return result;
}

// ===============================================
// ตัวอย่างที่ 3: Stack Overflow
// ===============================================

void demonstrateStackOverflow() {
  print('\n${'=' * 50}');
  print('📖 ตัวอย่างที่ 3: Stack Overflow ทำไมเกิด?');
  print('=' * 50);

  print('⚠️  ตัวอย่าง Infinite Recursion (อันตราย!):');
  print('💡 เข้าใจ Call Stack แล้ว → รู้ทันทีว่าทำไมมัน Overflow');

  try {
    // จำกัดการเรียกเพื่อป้องกัน Stack Overflow จริง
    infiniteRecursionDemo(1, 10); // จำกัดแค่ 10 ครั้ง
  } catch (e) {
    print('🚨 Error: $e');
  }

  print('\n💡 หากไม่เข้าใจ Call Stack:');
  print('   ❓ "ทำไม Error Stack overflow?"');
  print('   ❓ "Memory หมดยังไง?"');
  print('   ❓ "ฟังก์ชันเรียกตัวเองได้หรอ?"');

  print('\n✅ หากเข้าใจ Call Stack แล้ว:');
  print('   💡 "Stack Frame สร้างไม่หยุด → Memory เต็ม"');
  print('   💡 "ต้องมี Base Case เพื่อหยุด"');
  print('   💡 "แต่ละครั้งใช้ Memory เพิ่มขึ้น"');
}

void infiniteRecursionDemo(int count, int limit) {
  print('   📍 infiniteRecursionDemo($count)');
  print('      Stack Frames: $count');
  print('      Memory: ${count * 32} bytes');

  if (count >= limit) {
    print('   ⚠️  หยุดที่ $limit เพื่อป้องกัน Stack Overflow');
    return;
  }

  // ในความเป็นจริง จะเรียกไปเรื่อยๆ จนกว่า Stack จะเต็ม
  infiniteRecursionDemo(count + 1, limit);
}

// ===============================================
// ตัวอย่างที่ 4: การ Debug ที่ดีขึ้น
// ===============================================

void demonstrateDebuggingBenefit() {
  print('\n${'=' * 50}');
  print('📖 ตัวอย่างที่ 4: การ Debug ที่ดีขึ้น');
  print('=' * 50);

  print('🐛 เมื่อเกิด Error ใน Recursion:');

  try {
    recursiveFunction(3);
  } catch (e, stackTrace) {
    print('\n🚨 Error เกิดขึ้น!');
    print('❌ Error: $e');

    print('\n📋 Stack Trace (ใครเรียกใครบ้าง):');
    var lines = stackTrace.toString().split('\n');
    for (int i = 0; i < 4 && i < lines.length; i++) {
      print('   ${i + 1}. ${lines[i]}');
    }

    print('\n💡 การอ่าน Stack Trace:');
    print('   📍 #0 = Error เกิดที่นี่ (จุดลึกที่สุด)');
    print('   📍 #1 = ใครเรียกมาก่อนหน้า');
    print('   📍 #2 = ใครเรียกมาก่อนหน้านั้น');
    print('   📍 ... = ต้นทางการเรียก');
  }
}

void recursiveFunction(int n) {
  print('   📍 recursiveFunction($n)');

  if (n == 1) {
    // จำลอง Error
    throw Exception('💥 Error at n = $n');
  }

  recursiveFunction(n - 1);
}

// ===============================================
// 🎓 สรุป: Learning Path ที่ถูกต้อง
// ===============================================

class LearningPath {
  static void showRecommendedPath() {
    print('\n📚 แนวทางการเรียนรู้ที่แนะนำ:');
    print('=' * 60);

    print('''
🎯 ขั้นตอนการเรียนรู้:

📖 ขั้นที่ 1: Function Basics
   ✅ การสร้าง Function
   ✅ Parameters และ Return Values
   ✅ Scope ของ Variables

📖 ขั้นที่ 2: Call Stack Understanding
   ✅ Stack Frame คืออะไร?
   ✅ การเรียกฟังก์ชันซ้อนกัน
   ✅ Memory Management
   ✅ Stack Trace การอ่าน Error

📖 ขั้นที่ 3: Recursion Ready!
   ✅ Base Case และ Recursive Case
   ✅ การ Debug Recursion
   ✅ Performance Consideration
   ✅ ทำ Project จริง

💡 เมื่อเข้าใจ Call Stack ดีแล้ว:
   🚀 เรียน Recursion จะง่ายขึ้นมาก!
   🚀 Debug ได้เร็วขึ้น!
   🚀 เขียน Code ที่มี Performance ดีขึ้น!
   🚀 เข้าใจ Algorithm ลึกขึ้น!

⭐ Recursion แค่การใช้ Call Stack อย่างชาญฉลาด!
    ''');
  }
}
