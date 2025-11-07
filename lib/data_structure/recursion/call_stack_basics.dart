// 📚 Call Stack Basics - ก่อนเรียน Recursion
// ===================================================

// 🎯 เป้าหมาย: เข้าใจการทำงานของ Call Stack ให้ดีก่อนเรียน Recursion

void main() {
  print('🚀 เริ่มต้น main() function');
  print('📚 ตัวอย่างการทำงานของ Call Stack\n');

  // ตัวอย่างที่ 1: Simple Function Calls
  print('=' * 50);
  print('📖 ตัวอย่างที่ 1: การเรียกฟังก์ชันปกติ');
  print('=' * 50);

  demonstrateBasicCalls();

  // ตัวอย่างที่ 2: Nested Function Calls
  print('\n${'=' * 50}');
  print('📖 ตัวอย่างที่ 2: การเรียกฟังก์ชันซ้อนกัน');
  print('=' * 50);

  startNestedCalls();

  // ตัวอย่างที่ 3: Function Parameters & Return Values
  print('\n${'=' * 50}');
  print('📖 ตัวอย่างที่ 3: Parameters และ Return Values');
  print('=' * 50);

  demonstrateParametersAndReturn();

  // ตัวอย่างที่ 4: Call Stack ใน Error
  print('\n${'=' * 50}');
  print('📖 ตัวอย่างที่ 4: Call Stack ใน Error');
  print('=' * 50);

  demonstrateErrorStack();

  print('\n🏁 จบ main() function');
}

// ===============================================
// ตัวอย่างที่ 1: การเรียกฟังก์ชันปกติ
// ===============================================

void demonstrateBasicCalls() {
  print('📍 เข้าสู่ demonstrateBasicCalls()');
  print('   Stack: [main] → [demonstrateBasicCalls]');

  // เรียกฟังก์ชันย่อย
  greetUser();

  print('📍 กลับมาที่ demonstrateBasicCalls()');
  print('   Stack: [main] → [demonstrateBasicCalls]');
  print('📤 ออกจาก demonstrateBasicCalls()');
}

void greetUser() {
  print('   📍 เข้าสู่ greetUser()');
  print('      Stack: [main] → [demonstrateBasicCalls] → [greetUser]');
  print('      🗣️ สวัสดีครับ!');
  print('   📤 ออกจาก greetUser()');
}

// ===============================================
// ตัวอย่างที่ 2: การเรียกฟังก์ชันซ้อนกัน
// ===============================================

void startNestedCalls() {
  print('📍 เข้าสู่ startNestedCalls()');
  print('   Stack: [main] → [startNestedCalls]');

  levelOne();

  print('📍 กลับมาที่ startNestedCalls()');
  print('📤 ออกจาก startNestedCalls()');
}

void levelOne() {
  print('   📍 เข้าสู่ levelOne()');
  print('      Stack: [main] → [startNestedCalls] → [levelOne]');

  levelTwo();

  print('   📍 กลับมาที่ levelOne()');
  print('   📤 ออกจาก levelOne()');
}

void levelTwo() {
  print('      📍 เข้าสู่ levelTwo()');
  print(
    '         Stack: [main] → [startNestedCalls] → [levelOne] → [levelTwo]',
  );

  levelThree();

  print('      📍 กลับมาที่ levelTwo()');
  print('      📤 ออกจาก levelTwo()');
}

void levelThree() {
  print('         📍 เข้าสู่ levelThree()');
  print(
    '            Stack: [main] → [...] → [levelOne] → [levelTwo] → [levelThree]',
  );
  print('            🎯 นี่คือจุดลึกที่สุด!');
  print('         📤 ออกจาก levelThree()');
}

// ===============================================
// ตัวอย่างที่ 3: Parameters และ Return Values
// ===============================================

void demonstrateParametersAndReturn() {
  print('📍 เข้าสู่ demonstrateParametersAndReturn()');

  String name = "สมชาย";
  int age = 25;

  print('📤 เรียก createGreeting("$name", $age)');
  String greeting = createGreeting(name, age);

  print('📥 ได้รับค่ากลับ: "$greeting"');
  print('📤 ออกจาก demonstrateParametersAndReturn()');
}

String createGreeting(String name, int age) {
  print('   📍 เข้าสู่ createGreeting()');
  print('      📨 ได้รับ parameters: name="$name", age=$age');
  print(
    '      Stack: [main] → [demonstrateParametersAndReturn] → [createGreeting]',
  );

  String result = "สวัสดี $name อายุ $age ปี";

  print('      📦 สร้างผลลัพธ์: "$result"');
  print('   📤 return "$result" และออกจาก createGreeting()');

  return result;
}

// ===============================================
// ตัวอย่างที่ 4: Call Stack ใน Error
// ===============================================

void demonstrateErrorStack() {
  print('📍 เข้าสู่ demonstrateErrorStack()');

  try {
    functionA();
  } catch (e, stackTrace) {
    print('🚨 จับ Error ได้!');
    print('❌ Error: $e');
    print('📋 Stack Trace:');
    print(stackTrace.toString());
  }

  print('📤 ออกจาก demonstrateErrorStack()888');
}

void functionA() {
  print('   📍 เข้าสู่ functionA()');
  print('      Stack: [main] → [demonstrateErrorStack] → [functionA]');

  functionB();

  print('   📤 ออกจาก functionA()');
}

void functionB() {
  print('      📍 เข้าสู่ functionB()');
  print('         Stack: [main] → [...] → [functionA] → [functionB]');

  functionC();

  print('      📤 ออกจาก functionB()');
}

void functionC() {
  print('         📍 เข้าสู่ functionC()');
  print('            Stack: [main] → [...] → [functionB] → [functionC]');
  print('            💥 กำลังจะเกิด Error...');

  // สร้าง Error จงใจ
  throw Exception('💥 Error ที่จุดลึกที่สุด!');

  print('         📤 ออกจาก functionC()'); // บรรทัดนี้จะไม่ทำงาน
}

// ===============================================
// 🎓 ความรู้เพิ่มเติม: Stack Frame
// ===============================================

class StackFrameDemo {
  static void explainStackFrame() {
    print('\n📚 ความรู้เพิ่มเติม: Stack Frame คืออะไร?');
    print('=' * 60);

    print('''
🔍 Stack Frame ประกอบด้วย:
   📋 1. Function Name        - ชื่อฟังก์ชัน
   📨 2. Parameters           - ค่าที่ส่งเข้ามา  
   📦 3. Local Variables      - ตัวแปรในฟังก์ชัน
   📍 4. Return Address       - ที่อยู่ที่จะกลับไป
   📊 5. Previous Frame       - Frame ก่อนหน้า

📊 ตัวอย่าง Stack Frame:
   ┌─────────────────────────┐ ← Top of Stack
   │ functionC()             │
   │ - No parameters         │
   │ - No local variables    │
   │ - Return to functionB() │
   ├─────────────────────────┤
   │ functionB()             │
   │ - No parameters         │
   │ - No local variables    │
   │ - Return to functionA() │
   ├─────────────────────────┤
   │ functionA()             │
   │ - No parameters         │
   │ - No local variables    │
   │ - Return to main()      │
   ├─────────────────────────┤
   │ main()                  │
   │ - No parameters         │
   │ - Local variables       │
   │ - Return to OS          │
   └─────────────────────────┘ ← Bottom of Stack

💡 เมื่อฟังก์ชันจบ → Stack Frame ถูกลบออก (Pop)
💡 เมื่อเรียกฟังก์ชันใหม่ → Stack Frame ใหม่ถูกเพิ่ม (Push)
    ''');
  }
}
