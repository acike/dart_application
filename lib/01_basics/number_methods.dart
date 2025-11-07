// ตัวอย่าง method ของตัวเลขใน Dart
void main() {
  // 1. การแปลง String เป็นตัวเลข
  final strNumber = '42';
  final intNumber = int.parse(strNumber);
  final doubleNumber = double.parse('3.14');
  print('แปลง String เป็นตัวเลข:');
  print('int: $intNumber, type: ${intNumber.runtimeType}');
  print('double: $doubleNumber, type: ${doubleNumber.runtimeType}');

  // 2. การแปลงตัวเลขเป็น String
  final number = 42;
  final str = number.toString();
  print('\nแปลงตัวเลขเป็น String:');
  print('str: $str, type: ${str.runtimeType}');

  // 3. การบีบค่าให้อยู่ในช่วง (clamp)
  final value = 15;
  final clamped = value.clamp(10, 20);
  print('\nการบีบค่า:');
  print('ค่าเดิม: $value');
  print('ค่าหลังบีบ: $clamped');

  // 4. การปัดเศษ
  final pi = 3.14159;
  print('\nการปัดเศษ:');
  print('ceil: ${pi.ceil()}'); // ปัดขึ้น
  print('floor: ${pi.floor()}'); // ปัดลง
  print('round: ${pi.round()}'); // ปัดตามปกติ

  // 5. การหาร
  print('\nการหาร:');
  print('หารปกติ (/) : ${10 / 3}'); // ได้ double
  print('หารแบบไม่มีเศษ (~/) : ${10 ~/ 3}'); // ได้ int

  // ตัวอย่างการใช้งานจริง
  print('\nตัวอย่างการใช้งานจริง:');

  // แปลงอุณหภูมิจาก String
  final tempStr = '36.5';
  final temp = double.parse(tempStr);
  print('อุณหภูมิ: $temp°C');

  // บีบอุณหภูมิให้อยู่ในช่วงปกติ
  final normalTemp = temp.clamp(35.0, 42.0);
  print('อุณหภูมิปกติ: $normalTemp°C');

  // คำนวณค่าเฉลี่ย
  final scores = [85, 90, 78, 92, 88];
  final average = scores.reduce((a, b) => a + b) / scores.length;
  print('จำนวนคะแนน ${scores.length}');

  print('คะแนนเฉลี่ย: ${average.round()}'); // ปัดเศษเป็นจำนวนเต็ม
  int accum = 0;
  for (final score in scores) {
    accum = score + accum;
  }
  print('ผลรวมคะแนน: $accum');
  print('คะแนนเฉลี่ย: ${(accum / scores.length).round()}');
}
