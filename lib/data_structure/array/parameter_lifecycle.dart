void main() {
  print('🔄 Parameter Passing: Original Array จะหายไปไหม?');
  print('=' * 55);

  print('📋 คำถาม: functionA(List<int> array) รับค่าเข้ามา');
  print('   ตอนจบ function ค่า original ที่รับมาจะหายไปไหม?');

  // ทดสอบ Parameter Passing
  testParameterPassing();

  // ทดสอบ Reference vs Copy
  testReferenceVsCopy();

  // ทดสอบ Scope และ Lifetime
  testScopeAndLifetime();

  // แนวทางปลอดภัย
  safeParameterPractices();
}

void testParameterPassing() {
  print('\n1️⃣ ทดสอบ Parameter Passing');
  print('-' * 40);

  // สร้าง Original Array ใน main
  List<int> originalArray = [10, 20, 30, 40, 50];
  print('📊 สร้าง Original Array ใน main: $originalArray');
  print('   Memory Address: ${originalArray.hashCode}');

  print('\n🔄 เรียก functionA...');
  String result = functionA(originalArray);

  print('✅ กลับมาที่ main แล้ว');
  print('📤 ผลลัพธ์จาก function: $result');
  print('📊 Original Array หลัง function จบ: $originalArray');
  print('   Memory Address: ${originalArray.hashCode}');

  print('\n💡 สังเกต:');
  print('   ✅ Original Array ยังอยู่!');
  print('   ✅ Memory Address เหมือนเดิม');
  print('   ✅ ข้อมูลเปลี่ยนแปลงตาม (ถ้า function แก้ไข)');
}

String functionA(List<int> array) {
  print('   📍 Inside functionA()');
  print('   📥 รับ Parameter: $array');
  print('   📧 Memory Address: ${array.hashCode}');

  // ทดสอบแก้ไขข้อมูล
  print('   🔧 แก้ไข array[0] = 999');
  array[0] = 999;
  print('   📊 Array หลังแก้ไข: $array');

  // คำนวณผลลัพธ์
  int sum = array.reduce((a, b) => a + b);

  print('   ⏳ กำลังจะออกจาก function...');
  print('   💭 array parameter จะหายไป');
  print('   💭 แต่ข้อมูลจริงยังอยู่ที่เดิม!');

  return 'Sum: $sum';
  // 🚨 ตรงนี้! parameter 'array' หายไป
  // แต่ Original Array ยังอยู่ใน main!
}

void testReferenceVsCopy() {
  print('\n2️⃣ ทดสอบ Reference vs Copy');
  print('-' * 40);

  List<int> data = [1, 2, 3, 4, 5];
  print('📊 Original Data: $data (Address: ${data.hashCode})');

  print('\n🔗 ทดสอบ Reference:');
  passByReference(data);
  print('   หลัง passByReference: $data');

  print('\n📋 ทดสอบ Copy:');
  passByCopy(data);
  print('   หลัง passByCopy: $data');

  print('\n💡 สรุป:');
  print('   🔗 Reference: แก้ไข parameter = แก้ไข original');
  print('   📋 Copy: แก้ไข parameter ≠ แก้ไข original');
}

void passByReference(List<int> array) {
  print('   📍 passByReference() - Address: ${array.hashCode}');
  array[0] = 100; // แก้ไข original!
  print('   🔧 แก้ไข array[0] = 100');
}

void passByCopy(List<int> array) {
  print('   📍 passByCopy() - Address: ${array.hashCode}');
  List<int> copy = List.from(array); // สร้าง copy
  copy[0] = 200; // แก้ไขแค่ copy
  print('   📋 สร้าง copy และแก้ไข copy[0] = 200');
  print('   📊 Copy: $copy (Address: ${copy.hashCode})');
}

void testScopeAndLifetime() {
  print('\n3️⃣ ทดสอบ Scope และ Lifetime');
  print('-' * 40);

  print('📊 Scenario: สร้าง Array ใน function ย่อย');

  List<int>? result = createArrayInFunction();

  if (result != null) {
    print('✅ Array ที่สร้างใน function ยังอยู่: $result');
    print('   💡 เหตุผล: ถูก return ออกมา (มี reference)');
  }

  print('\n📊 Scenario: ไม่ return Array ออกมา');
  createAndLoseArray();

  print('\n📊 Scenario: เก็บ Array ใน Global');
  storeInGlobal();
}

List<int>? createArrayInFunction() {
  print('   📍 createArrayInFunction()');
  List<int> localArray = [100, 200, 300];
  print('   📊 สร้าง Local Array: $localArray');
  print('   📤 Return Array ออกไป');
  return localArray; // Array จะไม่หายเพราะมี reference
}

void createAndLoseArray() {
  print('   📍 createAndLoseArray()');
  List<int> localArray = [400, 500, 600];
  print('   📊 สร้าง Local Array: $localArray');
  print('   ❌ ไม่ return อะไร');
  // localArray จะหายไปเมื่อ function จบ!
}

List<List<int>> globalStorage = [];

void storeInGlobal() {
  print('   📍 storeInGlobal()');
  List<int> localArray = [700, 800, 900];
  print('   📊 สร้าง Local Array: $localArray');
  globalStorage.add(localArray);
  print('   💾 เก็บใน Global Storage');
  print('   ✅ Array จะไม่หายเพราะยังมี reference');
}

void safeParameterPractices() {
  print('\n💡 Best Practices สำหรับ Parameter');
  print('-' * 40);

  print('\n📚 สิ่งที่ควรรู้:');
  print('   1. 🔗 Dart ใช้ "Pass by Reference" สำหรับ Objects');
  print('   2. 📧 Parameter เป็นแค่ "ที่อยู่" ของข้อมูลจริง');
  print('   3. 🗑️  Parameter variable หายไป แต่ข้อมูลจริงไม่หาย');
  print('   4. ✅ ข้อมูลจริงหายเมื่อไม่มี reference ใดๆ');

  print('\n✅ การใช้งานที่ปลอดภัย:');
  demonstrateSafePractices();

  print('\n⚠️  สิ่งที่ต้องระวัง:');
  demonstrateDangerousPractices();
}

void demonstrateSafePractices() {
  List<int> data = [1, 2, 3, 4, 5];

  print('\n🔹 ปลอดภัย 1: อ่านข้อมูลอย่างเดียว');
  int sum = calculateSum(data);
  print('   📊 Data เดิม: $data (ไม่เปลี่ยน)');
  print('   📈 ผลลัพธ์: $sum');

  print('\n🔹 ปลอดภัย 2: สร้าง copy ก่อนแก้ไข');
  List<int> modified = safeModify(data);
  print('   📊 Data เดิม: $data (ไม่เปลี่ยน)');
  print('   📊 Data ใหม่: $modified');

  print('\n🔹 ปลอดภัย 3: แจ้งให้รู้ว่าจะแก้ไข');
  modifyInPlace(data); // แก้ไข original โดยตั้งใจ
  print('   📊 Data หลังแก้ไข: $data');
}

int calculateSum(List<int> array) {
  return array.reduce((a, b) => a + b);
}

List<int> safeModify(List<int> array) {
  List<int> copy = List.from(array);
  copy[0] = copy[0] * 10;
  return copy;
}

void modifyInPlace(List<int> array) {
  print('   ⚠️  Warning: Function นี้จะแก้ไข original array!');
  array[0] = array[0] + 1000;
}

void demonstrateDangerousPractices() {
  print('\n❌ อันตราย 1: แก้ไข parameter โดยไม่แจ้ง');
  print('''
   void dangerousFunction(List<int> data) {
     data.clear(); // ❌ ลบข้อมูลทั้งหมด!
     data.addAll([999, 888]);
   }
   
   // ปัญหา: ผู้เรียกไม่รู้ว่าข้อมูลจะถูกแก้ไข
  ''');

  print('\n❌ อันตราย 2: เก็บ reference ไว้ใน global');
  print('''
   List<List<int>> storage = [];
   
   void stealReference(List<int> data) {
     storage.add(data); // ❌ เก็บ reference!
   }
   
   // ปัญหา: data ไม่หายไปจาก memory
  ''');

  print('\n🎯 Memory Lifecycle สรุป:');
  print('   📥 Parameter เข้า Function → Reference ถูกสร้าง');
  print('   🔄 ใช้งานใน Function → ทำงานกับข้อมูลจริง');
  print('   📤 Function จบ → Parameter reference หายไป');
  print('   ✅ Original ยังอยู่ → ถ้ามี reference อื่นใน caller');
  print('   ❌ Original หายไป → ถ้าไม่มี reference ใดๆ');

  print('\n🏁 ตอบคำถาม:');
  print('   ❓ Original Array จะหายไปไหม?');
  print('   ✅ ไม่หายไป! เพราะยังมี reference ใน main()');
}
