void main() {
  // 1. Numbers
  int age = 25; // จำนวนเต็ม
  double height = 175.5; // จำนวนทศนิยม
  print('อายุ: $age ปี');
  print('ส่วนสูง: $height ซม.');

  // 2. Strings
  String name = 'สมชาย';
  String message = 'สวัสดี $name'; // String interpolation
  print(message);

  // 3. Booleans
  bool isActive = true;
  bool isAdult = age >= 20;
  print('สถานะ: $isActive');
  print('เป็นผู้ใหญ่: $isAdult');

  // 4. Lists
  List<String> fruits = ['แอปเปิ้ล', 'กล้วย', 'ส้ม'];
  List<int> numbers = [1, 2, 3, 4, 5];
  print('ผลไม้: $fruits');
  print('ตัวเลข: $numbers');

  // 5. Maps
  Map<String, dynamic> person = {'name': 'สมชาย', 'age': 25, 'isStudent': true};
  print('ข้อมูลบุคคล: $person');

  // 6. Runes (Unicode)
  String heart = '\u2665';
  String thumbsUp = '\u{1F44D}';
  print('หัวใจ: $heart');
  print('ยกนิ้ว: $thumbsUp');

  // ตัวอย่างการใช้งานในชีวิตจริง
  // 1. การคำนวณค่าเฉลี่ย
  List<double> scores = [85.5, 90.0, 78.5, 92.0];
  double average = scores.reduce((a, b) => a + b) / scores.length;
  print('คะแนน: $scores');
  print('ค่าเฉลี่ย: $average');

  // 2. ข้อมูลสินค้า
  Map<String, dynamic> product = {
    'id': 'P001',
    'name': 'สมาร์ทโฟน',
    'price': 15000.0,
    'inStock': true,
    'colors': ['ดำ', 'ขาว', 'ทอง'],
  };
  print('ข้อมูลสินค้า: $product');
}
