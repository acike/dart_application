void main() {
  // 1. List - เมธอดขั้นสูง
  print('=== List เมธอดขั้นสูง ===');
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  // 1.1 map - แปลงค่าในลิสต์
  print('\n-- map --');
  List<int> doubled = numbers.map((n) => n * 2).toList();
  print('เลขคูณสอง: $doubled');

  // 1.2 where - กรองข้อมูล
  print('\n-- where --');
  List<int> evens = numbers.where((n) => n % 2 == 0).toList();
  print('เลขคู่: $evens');

  // 1.3 firstWhere - หาข้อมูลแรกที่ตรงเงื่อนไข
  print('\n-- firstWhere --');
  int firstEven = numbers.firstWhere((n) => n % 2 == 0);
  print('เลขคู่ตัวแรก: $firstEven');

  // 1.4 any - ตรวจสอบว่ามีข้อมูลที่ตรงเงื่อนไขหรือไม่
  print('\n-- any --');
  bool hasEven = numbers.any((n) => n % 2 == 0);
  print('มีเลขคู่หรือไม่: $hasEven');

  // 1.5 every - ตรวจสอบว่าข้อมูลทั้งหมดตรงเงื่อนไขหรือไม่
  print('\n-- every --');
  bool allEven = numbers.every((n) => n % 2 == 0);
  print('เป็นเลขคู่ทั้งหมดหรือไม่: $allEven');

  // 1.6 reduce - รวมข้อมูลให้เหลือค่าเดียว
  print('\n-- reduce --');
  int sum = numbers.reduce((a, b) => a + b);
  print('ผลรวม: $sum');

  // 1.7 fold - เหมือน reduce แต่กำหนดค่าเริ่มต้นได้
  print('\n-- fold --');
  int sumPlus100 = numbers.fold(100, (a, b) => a + b);
  print('ผลรวม + 100: $sumPlus100');

  // 1.8 sort - เรียงลำดับ
  print('\n-- sort --');
  List<int> unsorted = [5, 3, 8, 1, 7, 9, 2];
  unsorted.sort();
  print('เรียงจากน้อยไปมาก: $unsorted');

  unsorted.sort((a, b) => b.compareTo(a));
  print('เรียงจากมากไปน้อย: $unsorted');

  // 1.9 take และ skip
  print('\n-- take/skip --');
  print('3 ตัวแรก: ${numbers.take(3).toList()}');
  print('ข้ามไป 5 ตัว: ${numbers.skip(5).toList()}');

  // 2. Map - เมธอดขั้นสูง
  print('\n\n=== Map เมธอดขั้นสูง ===');
  Map<String, double> prices = {
    'แอปเปิ้ล': 25.0,
    'กล้วย': 15.0,
    'ส้ม': 20.0,
    'มะม่วง': 30.0,
  };

  // 2.1 entries
  print('\n-- entries --');
  for (var entry in prices.entries) {
    print('${entry.key}: ${entry.value} บาท');
  }

  // 2.2 keys และ values
  print('\n-- keys/values --');
  print('สินค้า: ${prices.keys.toList()}');
  print('ราคา: ${prices.values.toList()}');

  // 2.3 map จาก Map
  print('\n-- map จาก Map --');
  Map<String, double> discounted = Map.fromEntries(
    prices.entries.map((entry) => MapEntry(entry.key, entry.value * 0.9)),
  );
  print('ราคาหลังลด 10%: $discounted');

  // 3. Set - เมธอดขั้นสูง
  print('\n\n=== Set เมธอดขั้นสูง ===');
  Set<int> set1 = {1, 2, 3, 4, 5};
  Set<int> set2 = {4, 5, 6, 7, 8};

  // 3.1 union - รวม
  print('\n-- union --');
  Set<int> union = set1.union(set2);
  print('รวมทั้งหมด: $union');

  // 3.2 intersection - หาค่าที่ซ้ำกัน
  print('\n-- intersection --');
  Set<int> intersection = set1.intersection(set2);
  print('ค่าที่ซ้ำกัน: $intersection');

  // 3.3 difference - หาค่าที่ต่างกัน
  print('\n-- difference --');
  Set<int> difference = set1.difference(set2);
  print('ค่าที่อยู่ใน set1 แต่ไม่อยู่ใน set2: $difference');

  // 4. ตัวอย่างการใช้งานจริง
  print('\n\n=== ตัวอย่างการใช้งานจริง ===');

  // 4.1 การกรองและวิเคราะห์ข้อมูลนักเรียน
  List<Map<String, dynamic>> students = [
    {'name': 'สมชาย', 'score': 85, 'grade': 'A', 'active': true},
    {'name': 'สมหญิง', 'score': 92, 'grade': 'A', 'active': true},
    {'name': 'สมศักดิ์', 'score': 76, 'grade': 'B', 'active': false},
    {'name': 'สมใจ', 'score': 68, 'grade': 'C', 'active': true},
    {'name': 'สมปอง', 'score': 55, 'grade': 'D', 'active': false},
  ];

  print('\n-- นักเรียนที่ผ่านเกรด A และ B --');
  students
      .where((student) => student['grade'] == 'A' || student['grade'] == 'B')
      .forEach((student) => print('${student['name']}: ${student['grade']}'));

  print('\n-- คะแนนเฉลี่ยของนักเรียนที่ยังแอคทีฟอยู่ --');
  List<Map<String, dynamic>> activeStudents =
      students.where((s) => s['active'] == true).toList();
  double avgScore =
      activeStudents.map((s) => s['score'] as num).reduce((a, b) => a + b) /
      activeStudents.length;
  print('คะแนนเฉลี่ย: ${avgScore.toStringAsFixed(2)}');

  print('\n-- สร้างรายงานคะแนน --');
  Map<String, int> gradeCount = {};

  for (var student in students) {
    String grade = student['grade'] as String;
    gradeCount[grade] = (gradeCount[grade] ?? 0) + 1;
  }

  print('สรุปเกรด: $gradeCount');

  // 4.2 การจัดการตะกร้าสินค้าโดยใช้ Collection ขั้นสูง
  print('\n-- ตะกร้าสินค้า --');
  List<Map<String, dynamic>> cart = [
    {'product': 'แอปเปิ้ล', 'quantity': 3, 'price': 25.0},
    {'product': 'กล้วย', 'quantity': 2, 'price': 15.0},
    {'product': 'ส้ม', 'quantity': 5, 'price': 20.0},
  ];

  // คำนวณราคารวมของแต่ละสินค้า
  List<Map<String, dynamic>> itemizedCart =
      cart.map((item) {
        return {
          'product': item['product'],
          'quantity': item['quantity'],
          'price': item['price'],
          'total': (item['quantity'] as int) * (item['price'] as double),
        };
      }).toList();

  for (var item in itemizedCart) {
    print(
      '${item['product']}: ${item['quantity']} x ${item['price']} = ${item['total']} บาท',
    );
  }

  // คำนวณราคารวมทั้งหมด
  double cartTotal = itemizedCart
      .map((item) => item['total'] as double)
      .reduce((a, b) => a + b);
  print('ราคารวมทั้งหมด: $cartTotal บาท');

  // สินค้าที่ราคาแพงที่สุด
  var mostExpensiveItem = itemizedCart.reduce(
    (a, b) => (a['total'] as double) > (b['total'] as double) ? a : b,
  );
  print(
    'สินค้าที่ราคารวมแพงที่สุด: ${mostExpensiveItem['product']} (${mostExpensiveItem['total']} บาท)',
  );
}
