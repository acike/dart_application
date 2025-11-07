void main() {
  // 1. ฟังก์ชันพื้นฐาน
  greet('สมชาย');

  // 2. ฟังก์ชันที่มีการคืนค่า
  int sum = add(5, 3);
  print('ผลรวม: $sum');

  // 3. ฟังก์ชันแบบ Optional Parameters
  printUserInfo('สมชาย');
  printUserInfo('สมชาย', 25);
  printUserInfo('สมชาย', 25, 'กรุงเทพ');

  // 4. ฟังก์ชันแบบ Named Parameters
  printProductInfo(name: 'สมาร์ทโฟน', price: 15000, inStock: true);

  // 5. ฟังก์ชันแบบ Arrow Syntax
  int doubleNumber(int x) => x * 2;
  print('สองเท่าของ 5: ${doubleNumber(5)}');

  // 6. ฟังก์ชันแบบ Anonymous
  var numbers = [1, 2, 3, 4, 5];
  var doubled = numbers.map((number) => number * 2);
  print('ตัวเลขสองเท่า: $doubled');

  // 7. ฟังก์ชันแบบ Recursive
  int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
  }

  print('5! = ${factorial(5)}');
}

// 1. ฟังก์ชันพื้นฐาน
void greet(String name) {
  print('สวัสดี $name');
}

// 2. ฟังก์ชันที่มีการคืนค่า
int add(int a, int b) {
  return a + b;
}

// 3. ฟังก์ชันแบบ Optional Parameters
void printUserInfo(String name, [int? age, String? city]) {
  print('ชื่อ: $name');
  if (age != null) print('อายุ: $age');
  if (city != null) print('เมือง: $city');
}

// 4. ฟังก์ชันแบบ Named Parameters
void printProductInfo({
  required String name,
  required int price,
  bool inStock = false,
}) {
  print('ชื่อสินค้า: $name');
  print('ราคา: $price บาท');
  print('มีสินค้า: ${inStock ? 'มี' : 'ไม่มี'}');
}
