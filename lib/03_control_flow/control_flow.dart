void main() {
  // 1. If-Else Statement
  int age = 20;
  if (age >= 20) {
    print('คุณเป็นผู้ใหญ่');
  } else {
    print('คุณยังเป็นเด็ก');
  }

  // 2. Ternary Operator
  String status = age >= 20 ? 'ผู้ใหญ่' : 'เด็ก';
  print('สถานะ: $status');

  // 3. Switch Statement
  String grade = 'B';
  switch (grade) {
    case 'A':
      print('ยอดเยี่ยม');
      break;
    case 'B':
      print('ดีมาก');
      continue goodGrade;
    goodGrade:
    case 'E':
      print('EEEEE');
      continue goodGrade2;
    goodGrade2:
    case 'C':
      print('ผ่าน - เป็นเกรดที่ยอมรับได้');
      break;
    default:
      print('ไม่ผ่าน');
  }

  // 4. For Loop
  print('For Loop:');
  for (int i = 1; i <= 5; i++) {
    print('รอบที่ $i');
  }

  // 5. While Loop
  print('While Loop:');
  int count = 1;
  while (count <= 3) {
    print('นับ: $count');
    count++;
  }

  // 6. Do-While Loop
  print('Do-While Loop:');
  int number = 1;
  do {
    print('ตัวเลข: $number');
    number++;
  } while (number <= 3);

  // 7. For-In Loop with List
  print('For-In Loop:');
  List<String> fruits = ['แอปเปิ้ล', 'กล้วย', 'ส้ม'];
  for (String fruit in fruits) {
    print('ผลไม้: $fruit');
  }

  // 8. Break and Continue
  print('Break and Continue:');
  for (int i = 1; i <= 10; i++) {
    if (i == 3) continue; // ข้ามรอบที่ 3
    if (i == 2) continue;
    if (i == 8) break; // ออกจากลูปเมื่อถึง 8
    print('ค่า: $i');
  }
}

String getMessage(String grade) {
  return switch (grade) {
    'A' => 'ยอดเยี่ยม',
    'B' => 'ดีมาก',
    'C' => 'พอใช้',
    _ => 'ต้องปรับปรุง', // _ คือ default
  };
}
