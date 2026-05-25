void main() {
  // 1. forEach กับ List
  print('==== forEach กับ List ====');
  List<String> fruits = ['แอปเปิ้ล', 'กล้วย', 'ส้ม', 'มะม่วง', 'ทุเรียน'];

  print('วิธีที่ 1: ใช้ forEach พื้นฐาน');
  for (var fruit in fruits) {
    print('ผลไม้: $fruit');
  }

  print('\nวิธีที่ 2: ใช้ forEach แบบ arrow function');
  for (var fruit in fruits) {
    print('ผลไม้ (arrow): $fruit');
  }

  // 2. forEach กับ Map
  print('\n==== forEach กับ Map ====');
  Map<String, double> prices = {
    'แอปเปิ้ล': 25.0,
    'กล้วย': 15.0,
    'ส้ม': 20.0,
    'มะม่วง': 30.0,
    'ทุเรียน': 150.0,
  };

  print('วิธีที่ 1: ใช้ forEach แสดงค่า key และ value');
  prices.forEach((key, value) {
    print('$key: $value บาท');
  });

  print('\nวิธีที่ 2: ใช้ forEach แบบ entries');
  for (var entry in prices.entries) {
    print('${entry.key}: ${entry.value} บาท (ใช้ entries)');
  }

  // 3. forEach กับ Set
  print('\n==== forEach กับ Set ====');
  Set<int> uniqueNumbers = {1, 2, 3, 4, 5};
  for (var number in uniqueNumbers) {
    print('เลข: $number');
  }

  // 4. เปรียบเทียบ forEach กับ for-in
  print('\n==== เปรียบเทียบ forEach กับ for-in ====');
  print('ใช้ forEach:');
  for (var fruit in fruits) {
    print('- $fruit');
  }

  print('\nใช้ for-in:');
  for (var fruit in fruits) {
    print('- $fruit');
  }

  // 5. ใช้ forEach กับ index
  print('\n==== forEach กับ index ====');
  fruits.asMap().forEach((index, fruit) {
    print('ลำดับที่ $index: $fruit');
  });

  // 6. where (กรองข้อมูล) + forEach
  print('\n==== where + forEach ====');
  var a = fruits.where((fruit) => fruit.length > 3).toList();
  var b = fruits.where((fruit) => fruit.length > 3);
  fruits
      .where((fruit) => fruit.length > 3)
      .forEach((fruit) => print('ผลไม้ที่ชื่อยาวกว่า 3 ตัวอักษร: $fruit'));

  // 7. map (แปลงข้อมูล) + forEach
  print('\n==== map + forEach ====');
  fruits
      .map((fruit) => '${fruit.toUpperCase()} dw')
      .forEach((fruit) => print('ผลไม้ (ตัวใหญ่): $fruit'));

  // 8. ตัวอย่างการใช้งานจริง: การคำนวณภาษี
  print('\n==== ตัวอย่างการใช้งานจริง ====');
  Map<String, double> cart = {
    'แอปเปิ้ล': 2, // จำนวน 2 กิโล
    'กล้วย': 1.5, // จำนวน 1.5 กิโล
    'ส้ม': 3, // จำนวน 3 กิโล
  };

  double total = 0;
  // Map<String, double> prices = {
  //   'แอปเปิ้ล': 25.0,
  //   'กล้วย': 15.0,
  //   'ส้ม': 20.0,
  //   'มะม่วง': 30.0,
  //   'ทุเรียน': 150.0,
  // };
  cart.forEach((item, quantity) {
    double itemPrice = prices[item] ?? 0;
    double itemTotal = itemPrice * quantity;
    total += itemTotal;
    print('$item: $quantity กิโล x $itemPrice บาท = $itemTotal บาท');
  });

  print('ราคารวม: $total บาท');
  print('ภาษี 7%: ${total * 0.07} บาท');
  print('ราคารวมภาษี: ${total * 1.07} บาท');
}
