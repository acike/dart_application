// 🗺️ แผนการเรียนรู้: จาก Call Stack สู่ Recursion Master
// ================================================================

void main() {
  print('🗺️ แผนการเรียนรู้: จาก Call Stack สู่ Recursion Master');
  print('=' * 70);

  // แสดงแผนการเรียนรู้
  LearningRoadmap.showFullRoadmap();

  print('\n🎯 ทดสอบความเข้าใจ Call Stack ก่อนเรียน Recursion:');
  print('=' * 60);

  // ทดสอบความเข้าใจ
  testCallStackUnderstanding();
}

class LearningRoadmap {
  static void showFullRoadmap() {
    print('''
📚 ขั้นตอนการเรียนรู้ (ใช้เวลาประมาณ 2-3 สัปดาห์):

🔰 ขั้นที่ 1: Foundation (สัปดาห์ที่ 1)
├── 📖 Day 1-2: Function Basics
│   ├── ✅ การสร้างและเรียกใช้ Function
│   ├── ✅ Parameters และ Return Values
│   ├── ✅ Local vs Global Variables
│   └── ✅ Function Scope
│
├── 📖 Day 3-4: Memory Basics
│   ├── ✅ Stack vs Heap Memory
│   ├── ✅ การจัดสรร Memory
│   ├── ✅ Variable Lifetime
│   └── ✅ Memory Leak คืออะไร?
│
└── 📖 Day 5-7: Call Stack Deep Dive
    ├── ✅ Stack Frame คืออะไร?
    ├── ✅ การ Push/Pop Stack Frame
    ├── ✅ Return Address
    └── ✅ การเรียกฟังก์ชันซ้อนกัน

🚀 ขั้นที่ 2: Intermediate (สัปดาห์ที่ 2)
├── 📖 Day 8-10: Error Handling & Debugging
│   ├── ✅ การอ่าน Stack Trace
│   ├── ✅ การ Debug แบบ Step-by-Step
│   ├── ✅ Exception Handling
│   └── ✅ Stack Overflow คืออะไร?
│
├── 📖 Day 11-12: Performance Considerations
│   ├── ✅ Memory Usage ของ Function Calls
│   ├── ✅ Call Stack Limits
│   ├── ✅ เปรียบเทียบ Loop vs Function Calls
│   └── ✅ Optimization Techniques
│
└── 📖 Day 13-14: Advanced Concepts
    ├── ✅ Tail Call Optimization
    ├── ✅ Call Stack ใน Different Languages
    ├── ✅ Garbage Collection
    └── ✅ Memory Profiling

🎯 ขั้นที่ 3: Recursion Ready! (สัปดาห์ที่ 3)
├── 📖 Day 15-17: Pre-Recursion
│   ├── ✅ ทำไม Recursion ถึงทำงานได้?
│   ├── ✅ Base Case และ Recursive Case
│   ├── ✅ การวิเคราะห์ Call Stack ใน Recursion
│   └── ✅ Common Recursion Patterns
│
├── 📖 Day 18-19: Simple Recursion
│   ├── ✅ Factorial และ Fibonacci
│   ├── ✅ การ Debug Recursion
│   ├── ✅ Recursion vs Iteration
│   └── ✅ Time/Space Complexity
│
└── 📖 Day 20-21: Advanced Recursion
    ├── ✅ Tree Traversal
    ├── ✅ Backtracking (Maze Solving)
    ├── ✅ Divide and Conquer
    └── ✅ Dynamic Programming แนะนำ

💡 เครื่องมือที่แนะนำ:
   🔧 Debugger (Step Into/Over/Out)
   🔧 Memory Profiler
   🔧 Call Stack Visualizer
   🔧 Performance Monitor
   🔧 Code Tracing Tools

🎖️ เมื่อเรียนจบ คุณจะสามารถ:
   ✨ อธิบายการทำงานของ Call Stack ได้
   ✨ Debug Recursion ได้อย่างมีประสิทธิภาพ
   ✨ เขียน Recursive Algorithm ที่ Optimal
   ✨ วิเคราะห์ Performance ของ Recursive Code
   ✨ หลีกเลี่ยง Stack Overflow
   ✨ เลือกใช้ Recursion vs Iteration ได้ถูกต้อง
''');
  }
}

// ===============================================
// 🧪 ทดสอบความเข้าใจ Call Stack
// ===============================================

void testCallStackUnderstanding() {
  print('\n🧪 ทดสอบที่ 1: การติดตาม Call Stack');
  print('-' * 40);

  testOne();

  print('\n🧪 ทดสอบที่ 2: Memory Usage Analysis');
  print('-' * 40);

  testTwo();

  print('\n🧪 ทดสอบที่ 3: Error Tracing');
  print('-' * 40);

  testThree();

  print('\n📊 สรุปผล:');
  print('หากคุณเข้าใจทุกขั้นตอนข้างต้น = พร้อมเรียน Recursion แล้ว! 🎉');
  print('หากยังสับสน = ควรทบทวน Call Stack ก่อน 📚');
}

// ทดสอบที่ 1: การติดตาม Call Stack
void testOne() {
  print('❓ คำถาม: Call Stack จะเป็นยังไงในการเรียกนี้?');
  print('📝 ลองติดตาม Call Stack เอง แล้วเปรียบเทียบ:');

  print('\n🔄 เริ่มการเรียก:');
  trackCallStack();
}

void trackCallStack() {
  print('📍 ระดับ 1: trackCallStack()');
  print('   Stack: [main] → [testOne] → [trackCallStack]');

  levelA();

  print('📍 กลับมาที่ trackCallStack()');
}

void levelA() {
  print('   📍 ระดับ 2: levelA()');
  print('      Stack: [...] → [trackCallStack] → [levelA]');

  levelB();

  print('   📍 กลับมาที่ levelA()');
}

void levelB() {
  print('      📍 ระดับ 3: levelB()');
  print('         Stack: [...] → [levelA] → [levelB]');
  print('         💡 นี่คือจุดลึกที่สุด');
  print('      📤 ออกจาก levelB()');
}

// ทดสอบที่ 2: Memory Usage Analysis
void testTwo() {
  print('❓ คำถาม: Memory ใช้เพิ่มขึ้นยังไงในการเรียกซ้อน?');
  print('📝 ลองคิดว่าแต่ละ Frame ใช้ Memory เท่าไร:');

  analyzeMemory(1, 3);
}

void analyzeMemory(int current, int max) {
  int memoryUsed = current * 64; // สมมติ 64 bytes ต่อ frame
  print('📊 Frame $current: Memory = $memoryUsed bytes');
  print('   📋 Variables: current=$current, max=$max');
  print('   📍 Return address: analyzeMemory + $current');

  if (current < max) {
    analyzeMemory(current + 1, max);
  }

  print('🗑️ Frame $current: ถูกลบออกจาก Stack');
}

// ทดสอบที่ 3: Error Tracing
void testThree() {
  print('❓ คำถาม: เมื่อเกิด Error ลึกใน Call Stack จะเกิดอะไร?');
  print('📝 ลองวิเคราะห์ Stack Trace:');

  try {
    causeError(3);
  } catch (e, stackTrace) {
    print('\n🚨 เกิด Error แล้ว!');
    print('❌ $e');

    print('\n📋 Stack Trace Analysis:');
    var lines = stackTrace.toString().split('\n');
    for (int i = 0; i < 3 && i < lines.length; i++) {
      print('   Level ${i + 1}: ${lines[i]}');
    }

    print('\n💡 การอ่าน Stack Trace:');
    print('   🎯 Error เกิดที่ Level 1 (จุดลึกที่สุด)');
    print('   📞 Level 2-3 = ใครเรียกมา');
    print('   🗺️ ตามรอยได้ถึงต้นทาง');
  }
}

void causeError(int level) {
  print('📍 causeError($level)');

  if (level == 1) {
    print('💥 กำลังสร้าง Error...');
    throw Exception('Test Error at level $level');
  }

  causeError(level - 1);
}

// ===============================================
// 🎓 แบบฝึกหัดก่อนเรียน Recursion
// ===============================================

class PreRecursionExercises {
  // แบบฝึกหัดที่ 1: วิเคราะห์ Call Stack
  static void exercise1() {
    print('\n📝 แบบฝึกหัดที่ 1: วิเคราะห์ Call Stack');
    print('=' * 50);

    print('''
คำถาม: ในโค้ดนี้ Call Stack จะมีกี่ Frame สูงสุด?

void main() {
  a();
}

void a() {
  b();
  c();
}

void b() {
  d();
}

void c() {
  // empty
}

void d() {
  // empty
}

💡 เฉลย: 
   สูงสุด 3 Frames: [main] → [a] → [b] → [d]
   เพราะ b() และ c() ไม่ได้เรียกพร้อมกัน
''');
  }

  // แบบฝึกหัดที่ 2: Memory Calculation
  static void exercise2() {
    print('\n📝 แบบฝึกหัดที่ 2: คำนวณ Memory Usage');
    print('=' * 50);

    print('''
คำถาม: หากแต่ละ Stack Frame ใช้ 48 bytes
การเรียก function ซ้อน 5 ชั้น จะใช้ Memory เท่าไร?

💡 เฉลย:
   5 Frames × 48 bytes = 240 bytes
   
คำถามเพิ่มเติม: หาก Stack Limit = 1MB (1,048,576 bytes)
จะเรียกซ้อนได้สูงสุดกี่ชั้น?

💡 เฉลย:
   1,048,576 ÷ 48 = 21,845 ชั้น (ประมาณ)
''');
  }

  // แบบฝึกหัดที่ 3: หา Bug จาก Stack Trace
  static void exercise3() {
    print('\n📝 แบบฝึกหัดที่ 3: หา Bug จาก Stack Trace');
    print('=' * 50);

    print('''
Stack Trace:
#0 divide (line 15)
#1 calculate (line 8) 
#2 processData (line 4)
#3 main (line 1)

Error: Division by zero

คำถาม: Bug อยู่ที่ไหน? ใครเรียกใคร?

💡 เฉลย:
   🐛 Bug อยู่ที่ divide() line 15
   📞 การเรียก: main → processData → calculate → divide
   🔍 ต้องไปเช็ค divide() ที่ line 15 ว่าทำไมหารด้วย 0
''');
  }
}
