void main() {
  print('🎯 เปรียบเทียบ Slice vs View ใน Array');
  print('=' * 50);

  // สร้าง Array ตัวอย่าง
  List<int> originalArray = List.generate(10, (i) => (i + 1) * 10);
  print('📊 Array เดิม: $originalArray');
  print('   ขนาด: ${originalArray.length} ตัว');

  print('\n🔍 ทดสอบ Slice vs View');
  print('-' * 30);

  // 1. Slice - การคัดลอก
  testSlice(originalArray);

  // 2. View - การอ้างอิง
  testView(originalArray);

  // 3. เปรียบเทียบประสิทธิภาพ
  performanceComparison();

  // 4. กรณีการใช้งาน
  useCaseExamples();

  // 5. ข้อควรระวัง
  safetyConsiderations();
}

void testSlice(List<int> original) {
  print('\n1️⃣ SLICE - การคัดลอกข้อมูล');
  print('   🔄 สร้าง Array ใหม่จากส่วนของเดิม');

  // สร้าง slice จากตำแหน่ง 2-5
  List<int> slice = original.getRange(2, 6).toList();

  print('   📋 Array เดิม: $original');
  print('   ✂️  Slice (ตำแหน่ง 2-5): $slice');
  print('   📏 ขนาด Slice: ${slice.length}');

  // ทดสอบการแก้ไข slice
  print('\n   🔧 ทดสอบแก้ไข Slice:');
  print('   ก่อนแก้ไข:');
  print('     - Array เดิม: $original');
  print('     - Slice: $slice');

  slice[0] = 999; // แก้ไข slice

  print('   หลังแก้ไข slice[0] = 999:');
  print('     - Array เดิม: $original');
  print('     - Slice: $slice');
  print('   ✅ Array เดิมไม่เปลี่ยน - ปลอดภัย!');
}

void testView(List<int> original) {
  print('\n2️⃣ VIEW - การอ้างอิงข้อมูล');
  print('   👁️  ดูข้อมูลจากของเดิมโดยไม่คัดลอก');

  // สร้าง view จากตำแหน่ง 2-5
  Iterable<int> view = original.getRange(2, 6);

  print('   📋 Array เดิม: $original');
  print('   👀 View (ตำแหน่ง 2-5): ${view.toList()}');
  print('   📏 ขนาด View: ${view.length}');

  // ทดสอบการแก้ไข original
  print('\n   🔧 ทดสอบแก้ไข Array เดิม:');
  print('   ก่อนแก้ไข:');
  print('     - Array เดิม: $original');
  print('     - View: ${view.toList()}');

  original[3] = 777; // แก้ไข array เดิม

  print('   หลังแก้ไข original[3] = 777:');
  print('     - Array เดิม: $original');
  print('     - View: ${view.toList()}');
  print('   ⚠️  View เปลี่ยนตาม - เชื่อมโยงกัน!');

  // คืนค่าเดิม
  original[3] = 40;
}

void performanceComparison() {
  print('\n⚡ เปรียบเทียบประสิทธิภาพ');

  // สร้าง Array ใหญ่สำหรับทดสอบ
  const int size = 1000000;
  List<int> bigArray = List.generate(size, (i) => i);

  print('   📏 ขนาด Array: ${formatNumber(size)} ตัว');
  print('   🎯 ตัดจาก 100,000 - 200,000 (100,000 ตัว)');

  // ทดสอบ Slice
  Stopwatch sw1 = Stopwatch()..start();
  List<int> slice = bigArray.getRange(100000, 200000).toList();
  sw1.stop();

  // ทดสอบ View
  Stopwatch sw2 = Stopwatch()..start();
  Iterable<int> view = bigArray.getRange(100000, 200000);
  // อ่านข้อมูลเพื่อให้เป็นธรรม
  int count = view.length;
  sw2.stop();

  print('   ⏱️  Slice (คัดลอก): ${sw1.elapsedMicroseconds} microseconds');
  print('   ⏱️  View (อ้างอิง): ${sw2.elapsedMicroseconds} microseconds');

  if (sw2.elapsedMicroseconds < sw1.elapsedMicroseconds) {
    double ratio = sw1.elapsedMicroseconds / sw2.elapsedMicroseconds;
    print('   🏆 View เร็วกว่า ${ratio.toStringAsFixed(1)} เท่า');
  }

  // เปรียบเทียบ Memory
  print('\n   💾 การใช้ Memory:');
  print(
    '     - Slice: ใช้ Memory เพิ่ม ${formatNumber(slice.length * 8)} bytes',
  );
  print('     - View: ใช้ Memory เพิ่ม ~100 bytes (เฉพาะ pointer)');
  print('   🏆 View ประหยัด Memory มากกว่า');
}

void useCaseExamples() {
  print('\n🌟 ตัวอย่างการใช้งานจริง');

  List<String> students = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Eve',
    'Frank',
    'Grace',
    'Henry',
    'Ivy',
    'Jack',
  ];

  print('\n📚 กรณี 1: แบ่งกลุ่มนักเรียน');
  print('   นักเรียนทั้งหมด: $students');

  // ใช้ Slice เมื่อต้องการแก้ไขแยก
  List<String> group1 = students.getRange(0, 5).toList();
  List<String> group2 = students.getRange(5, 10).toList();

  group1.add('NewStudent1'); // เพิ่มคนใหม่ในกลุ่ม 1

  print('   ✂️  กลุ่ม 1 (Slice): $group1');
  print('   ✂️  กลุ่ม 2 (Slice): $group2');
  print('   📋 รายชื่อเดิม: $students');
  print('   ✅ ข้อดี: แก้ไขกลุ่มไม่กระทบรายชื่อเดิม');

  print('\n📊 กรณี 2: ดูข้อมูลชั่วคราว');
  List<int> scores = [85, 92, 78, 96, 88, 91, 84, 89, 93, 87];

  // ใช้ View เมื่อแค่ดูข้อมูล
  Iterable<int> topScores = scores.getRange(0, 3);
  Iterable<int> bottomScores = scores.getRange(7, 10);

  print('   คะแนนทั้งหมด: $scores');
  print('   👀 Top 3 (View): ${topScores.toList()}');
  print('   👀 Bottom 3 (View): ${bottomScores.toList()}');
  print('   ✅ ข้อดี: ประหยัด Memory, เร็ว');
}

void safetyConsiderations() {
  print('\n⚠️  ข้อควรระวัง');

  List<int> data = [1, 2, 3, 4, 5];

  print('\n🚨 อันตรายของ View:');
  Iterable<int> dangerousView = data.getRange(1, 4);

  print('   Data เดิม: $data');
  print('   View: ${dangerousView.toList()}');

  // แก้ไข data เดิม
  data.clear();
  data.addAll([10, 20, 30]);

  print('   หลังแก้ไข data เดิม: $data');

  try {
    print('   View ตอนนี้: ${dangerousView.toList()}');
  } catch (e) {
    print('   ❌ Error: View อาจไม่ทำงานถ้า Array เดิมเปลี่ยนขนาด');
  }

  print('\n✅ แนวทางปลอดภัย:');
  print('   1. ใช้ Slice ถ้าจะแก้ไขข้อมูล');
  print('   2. ใช้ View เฉพาะการอ่านแบบชั่วคราว');
  print('   3. อย่าเก็บ View ไว้นาน ๆ');
  print('   4. ระวังการเปลี่ยนขนาด Array เดิม');
}

String formatNumber(int number) {
  return number.toString().replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (match) => '${match[1]},',
  );
}
