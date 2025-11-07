void main(List<String> args) {
  final Map<String, List<String>> map = {};
  map['node'] = [];
  map['node']?.add('A');
  map['node']!.add('B');
  // map['node']!.add('C');
  print(map);
}
// สรุป
// Map<String, Object>
// ปลอดภัยกว่า, Dart จะช่วยเช็ค type ให้
// เหมาะกับกรณีที่รู้ว่า value ต้องเป็น object ที่ไม่ใช่ null
// Map<String, dynamic>
// ยืดหยุ่นสุด ใส่อะไรก็ได้ (รวมถึง null)
// เหมาะกับกรณีที่รับข้อมูลจาก JSON, API, หรือไม่รู้ type ล่วงหน้า