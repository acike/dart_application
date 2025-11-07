void main() {
  print('🔄 Parameter Passing Mechanisms ใน Dart');
  print('=' * 50);

  print('❓ คำถาม: Dart มี Pass by Reference และ Pass by Value ไหม?');
  print('✅ ตอบ: มีทั้งคู่! ขึ้นอยู่กับประเภทข้อมูล');

  // ทดสอบ Pass by Value (Primitive Types)
  testPassByValue();

  // ทดสอบ Pass by Reference (Objects)
  testPassByReference();

  // // เปรียบเทียบความแตกต่าง
  comparePassingMechanisms();

  // // กรณีพิเศษ
  specialCases();

  // // สรุปกฎการทำงาน
  summarizeRules();
}

void testPassByValue() {
  print('\n1️⃣ PASS BY VALUE - Primitive Types');
  print('-' * 45);

  print('📊 ประเภทข้อมูลที่ใช้ Pass by Value:');
  print('   • int, double, bool, String (immutable)');
  print('   • enum values');

  // ทดสอบ int
  print('\n🔢 ทดสอบ int:');
  int originalInt = 100;
  print('   Original int: $originalInt');

  modifyInt(originalInt);
  print('   หลัง modifyInt(): $originalInt');
  print('   💡 ค่าไม่เปลี่ยน - Pass by Value!');

  // ทดสอบ String
  print('\n📝 ทดสอบ String:');
  String originalString = 'Hello';
  print('   Original String: "$originalString"');

  modifyString(originalString);
  print('   หลัง modifyString(): "$originalString"');
  print('   💡 ค่าไม่เปลี่ยน - Pass by Value!');

  // ทดสอบ bool
  print('\n✅ ทดสอบ bool:');
  bool originalBool = true;
  print('   Original bool: $originalBool');

  modifyBool(originalBool);
  print('   หลัง modifyBool(): $originalBool');
  print('   💡 ค่าไม่เปลี่ยน - Pass by Value!');
}

void modifyInt(int number) {
  print('   📍 Inside modifyInt() - รับค่า: $number');
  number = 999; // แก้ไขแค่ copy
  print('   🔧 แก้ไข number = 999 (ใน function)');
  print('   📊 number ใน function: $number');
}

void modifyString(String text) {
  print('   📍 Inside modifyString() - รับค่า: "$text"');
  text = 'Modified'; // แก้ไขแค่ copy
  print('   🔧 แก้ไข text = "Modified" (ใน function)');
  print('   📊 text ใน function: "$text"');
}

void modifyBool(bool flag) {
  print('   📍 Inside modifyBool() - รับค่า: $flag');
  flag = false; // แก้ไขแค่ copy
  print('   🔧 แก้ไข flag = false (ใน function)');
  print('   📊 flag ใน function: $flag');
}

void testPassByReference() {
  print('\n2️⃣ PASS BY REFERENCE - Objects');
  print('-' * 45);

  print('📊 ประเภทข้อมูลที่ใช้ Pass by Reference:');
  print('   • List, Set, Map');
  print('   • Custom Classes');
  print('   • Functions');

  // ทดสอบ List
  print('\n📋 ทดสอบ List:');
  List<int> originalList = [1, 2, 3];
  print('   Original List: $originalList (Address: ${originalList.hashCode})');

  modifyList(originalList);
  print('   หลัง modifyList(): $originalList');
  print('   💡 ค่าเปลี่ยน - Pass by Reference!');

  // ทดสอบ Map
  print('\n🗺️  ทดสอบ Map:');
  Map<String, int> originalMap = {'a': 1, 'b': 2};
  print('   Original Map: $originalMap (Address: ${originalMap.hashCode})');

  modifyMap(originalMap);
  print('   หลัง modifyMap(): $originalMap');
  print('   💡 ค่าเปลี่ยน - Pass by Reference!');

  // ทดสอบ Custom Class
  print('\n👤 ทดสอบ Custom Class:');
  Person originalPerson = Person('Alice', 25);
  print(
    '   Original Person: ${originalPerson.toString()} (Address: ${originalPerson.hashCode})',
  );

  modifyPerson(originalPerson);
  print('   หลัง modifyPerson(): ${originalPerson.toString()}');
  print('   💡 ค่าเปลี่ยน - Pass by Reference!');
}

void modifyList(List<int> list) {
  print('   📍 Inside modifyList() - รับ reference: $list');
  print('   📧 Address: ${list.hashCode}');
  list[0] = 999; // แก้ไข original!
  print('   🔧 แก้ไข list[0] = 999');
  print('   📊 list ใน function: $list');
}

void modifyMap(Map<String, int> map) {
  print('   📍 Inside modifyMap() - รับ reference: $map');
  print('   📧 Address: ${map.hashCode}');
  map['c'] = 999; // แก้ไข original!
  print('   🔧 เพิ่ม map["c"] = 999');
  print('   📊 map ใน function: $map');
}

void modifyPerson(Person person) {
  print('   📍 Inside modifyPerson() - รับ reference: ${person.toString()}');
  print('   📧 Address: ${person.hashCode}');
  person.age = 999; // แก้ไข original!
  print('   🔧 แก้ไข person.age = 999');
  print('   📊 person ใน function: ${person.toString()}');
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  @override
  String toString() => 'Person(name: $name, age: $age)';
}

void comparePassingMechanisms() {
  print('\n3️⃣ เปรียบเทียบ Pass by Value vs Pass by Reference');
  print('-' * 55);

  print('\n📊 สรุปการทำงาน:');

  // สร้างข้อมูลทดสอบ
  int primitiveValue = 42;
  List<int> objectValue = [1, 2, 3];

  print('\n🔢 Primitive (Pass by Value):');
  print('   ก่อน: primitiveValue = $primitiveValue');

  // ส่งไป function
  int result1 = testPrimitive(primitiveValue);

  print('   หลัง: primitiveValue = $primitiveValue');
  print('   ผลลัพธ์จาก function: $result1');
  print('   💡 Original ไม่เปลี่ยน, function return ค่าใหม่');

  print('\n📋 Object (Pass by Reference):');
  print('   ก่อน: objectValue = $objectValue');

  // ส่งไป function
  testObject(objectValue);

  print('   หลัง: objectValue = $objectValue');
  print('   💡 Original เปลี่ยนตาม function');
}

int testPrimitive(int value) {
  print('   📍 testPrimitive() - รับ copy: $value');
  value = value * 2;
  print('   🔧 แก้ไข value = $value');
  return value; // ต้อง return เพื่อส่งค่าใหม่ออกไป
}

void testObject(List<int> list) {
  print('   📍 testObject() - รับ reference: $list');
  list.add(999);
  print('   🔧 เพิ่ม list.add(999)');
  // ไม่ต้อง return เพราะแก้ไข original ตรงๆ
}

void specialCases() {
  print('\n4️⃣ กรณีพิเศษ');
  print('-' * 20);

  print('\n🎯 String - กรณีพิเศษ:');
  print('   • String เป็น Object แต่ทำตัวเป็น Pass by Value');
  print('   • เหตุผล: String เป็น Immutable (แก้ไขไม่ได้)');

  String text = 'Hello';
  print('   Original: "$text"');

  tryModifyString(text);
  print('   หลัง tryModifyString(): "$text"');
  print('   💡 ไม่เปลี่ยนเพราะ String immutable');

  print('\n📝 StringBuffer - Mutable String:');
  StringBuffer buffer = StringBuffer('Hello');
  print('   Original: "${buffer.toString()}"');

  modifyStringBuffer(buffer);
  print('   หลัง modifyStringBuffer(): "${buffer.toString()}"');
  print('   💡 เปลี่ยนเพราะ StringBuffer mutable');

  print('\n🔄 Null กับ Nullable Types:');
  List<int>? nullableList;
  print('   Original: $nullableList');

  assignNullableList(nullableList);
  print('   หลัง assignNullableList(): $nullableList');
  print('   💡 null assignment ไม่กระทบ original');
}

void tryModifyString(String str) {
  print('   📍 tryModifyString() - รับ: "$str"');
  str = '$str World'; // สร้าง String ใหม่
  print('   🔧 พยายามแก้ไข: "$str"');
  print('   💭 จริงๆ สร้าง String object ใหม่');
}

void modifyStringBuffer(StringBuffer buffer) {
  print('   📍 modifyStringBuffer() - รับ reference');
  buffer.write(' World'); // แก้ไข original buffer
  print('   🔧 เพิ่ม " World"');
}

void assignNullableList(List<int>? list) {
  print('   📍 assignNullableList() - รับ: $list');
  list = [1, 2, 3]; // แค่เปลี่ยน local reference
  print('   🔧 กำหนด list = [1, 2, 3] (ใน function)');
}

void summarizeRules() {
  print('\n💡 สรุปกฎการทำงาน');
  print('-' * 25);

  print('\n📚 กฎง่าย ๆ:');
  print('   1. 🔢 Primitive Types → Pass by Value');
  print('      (int, double, bool, String*)');
  print('   2. 📦 Object Types → Pass by Reference');
  print('      (List, Map, Set, Classes)');

  print('\n🎯 จำง่าย ๆ:');
  print('   • ถ้าแก้ไขใน function แล้วค่าเดิมเปลี่ยน = Pass by Reference');
  print('   • ถ้าแก้ไขใน function แล้วค่าเดิมไม่เปลี่ยน = Pass by Value');

  print('\n⚠️  ข้อยกเว้น:');
  print('   • String เป็น Object แต่ทำตัวเป็น Pass by Value');
  print('   • เพราะ String immutable (แก้ไขไม่ได้จริง ๆ)');

  print('\n🔍 วิธีเช็ค:');
  print('   • ดู hashCode ถ้าเหมือนกัน = Pass by Reference');
  print('   • ดูพฤติกรรมการแก้ไข = รู้ทันที');

  print('\n🏁 สรุปไฟล์ parameter_lifecycle.dart:');
  print('   ✅ มี Pass by Reference: List<int> ใน functionA()');
  print('   ❌ ไม่มี Pass by Value example ในไฟล์นั้น');
  print('   💡 เพราะ List เป็น Object = Pass by Reference เสมอ');
}
