// การเข้าถึงค่าของฟิลด์และเมธอดใน Dart
void main() {
  print('=== 1. การเข้าถึงค่าพื้นฐาน ===');

  // สร้างอ็อบเจ็กต์
  var user = User('สมชาย', 30);

  // 1.1 การเข้าถึงฟิลด์โดยตรง
  print('ชื่อ: ${user.name}');
  print('อายุ: ${user.age}');

  // 1.2 การเข้าถึงผ่าน getter
  print('สถานะ: ${user.status}');

  // 1.3 การกำหนดค่าผ่าน setter
  user.emailAddress = 'somchai@example.com';
  print('อีเมล: ${user.emailAddress}');

  // 1.4 การเรียกใช้เมธอด
  user.celebrateBirthday();
  print('อายุหลังวันเกิด: ${user.age}');

  // 2. Cascade Notation (..)
  print('\n=== 2. Cascade Notation (..) ===');

  // 2.1 การกำหนดหลายค่าด้วย cascade
  var product =
      Product()
        ..name = 'สมาร์ทโฟน'
        ..price = 15000
        ..inStock = true
        ..description = 'สมาร์ทโฟนรุ่นใหม่ล่าสุด';

  print('สินค้า: ${product.name}, ราคา: ${product.price}');

  // 2.2 cascade กับเมธอด
  var cart =
      ShoppingCart()
        ..addItem('สมาร์ทโฟน', 15000)
        ..addItem('หูฟัง', 2500)
        ..applyDiscount(10)
        ..printItems();

  print('ราคารวม: ${cart.total} บาท');

  // 3. Null-Aware Operators
  print('\n=== 3. Null-Aware Operators ===');

  // 3.1 ?. (null-safe access)
  User? nullableUser = getUser(isLoggedIn: true);
  print('ผู้ใช้ที่เข้าสู่ระบบ: ${nullableUser?.name}');

  nullableUser = getUser(isLoggedIn: false);
  print('ผู้ใช้ที่ไม่ได้เข้าสู่ระบบ: ${nullableUser?.name}');

  // 3.2 ?? (null-coalescing operator)
  String? username = nullableUser?.name;
  print('ชื่อผู้ใช้: ${username ?? "ไม่ได้เข้าสู่ระบบ"}');

  // 3.3 ??= (null-aware assignment)
  Order order = Order();
  order.customerName ??= 'ลูกค้าทั่วไป';
  print('ชื่อลูกค้า: ${order.customerName}');

  order.customerName ??= 'ลูกค้า VIP'; // ไม่เปลี่ยน เพราะค่าไม่ใช่ null
  print('ชื่อลูกค้า (หลังพยายามเปลี่ยน): ${order.customerName}');

  // 3.4 ?.. (null-aware cascade)
  User? potentialUser = getUser(isLoggedIn: true);
  potentialUser
    ?..name = 'สมหญิง'
    ..age = 25
    ..emailAddress = 'somying@example.com';

  print('ข้อมูลผู้ใช้: ${potentialUser?.name}, ${potentialUser?.age}');

  // 4. Type Promotion และ Type Casting
  print('\n=== 4. Type Promotion และ Type Casting ===');

  // 4.1 is และ type promotion
  Object obj = 'Hello';
  if (obj is String) {
    // ตอนนี้ compiler รู้ว่า obj เป็น String แน่นอน
    print('ความยาวข้อความ: ${obj.length}');
  }

  // 4.2 as (type casting)
  try {
    Object number = 42;
    int intValue = number as int;
    print('ค่า int: $intValue');

    Object notString = 123;
    // String stringValue = notString as String; // จะเกิด error
    // print(stringValue);
  } catch (e) {
    print('เกิด error จาก type casting: $e');
  }

  // 5. Conditional Access & Collections
  print('\n=== 5. Conditional Access & Collections ===');

  // 5.1 การใช้งานกับ List
  List<String>? names = ['สมชาย', 'สมหญิง', 'สมศักดิ์'];
  print('ชื่อแรก: ${names.first}');
  print('จำนวนชื่อ: ${names.length}');

  names = null;
  print('เมื่อ names เป็น null: ${names?.first ?? "ไม่มีชื่อ"}');

  // 5.2 การใช้งานกับ Map
  Map<String, dynamic>? userData = {
    'name': 'สมชาย',
    'age': 30,
    'address': {'city': 'กรุงเทพฯ', 'zipcode': '10330'},
  };

  // การเข้าถึง nested data โดยป้องกัน null
  String? city = userData['address']?['city'] as String?;
  print('เมือง: $city');

  // 6. Spread Operator (...) และ Collection If/For
  print('\n=== 6. Spread Operator (...) และ Collection If/For ===');

  // 6.1 Spread operator กับ null-aware
  List<int>? extraNumbers = [4, 5, 6];
  List<int> allNumbers = [1, 2, 3, ...extraNumbers];
  print('ตัวเลขทั้งหมด: $allNumbers');

  extraNumbers = null;
  allNumbers = [1, 2, 3, ...?extraNumbers]; // ไม่เกิด error
  print('ตัวเลขทั้งหมด (เมื่อ extraNumbers เป็น null): $allNumbers');

  // 6.2 Collection if
  bool hasAccess = true;
  List<String> permissions = ['read', 'write', if (hasAccess) 'admin'];
  print('สิทธิ์: $permissions');

  // 6.3 Collection for
  List<int> multiplied = [
    for (var i in [1, 2, 3]) i * 2,
  ];
  print('ตัวเลขคูณสอง: $multiplied');

  // 7. Extension Methods
  print('\n=== 7. Extension Methods ===');

  String message = 'hello world';
  print('ข้อความตัวใหญ่แรก: ${message.capitalize()}');

  List<int> scores = [85, 90, 75, 95, 80];
  double avgScore = scores.average();
  print('คะแนนเฉลี่ย: $avgScore');
}

// คลาสพื้นฐาน
class User {
  String name;
  int age;
  String? _email;

  User(this.name, this.age);

  // Getter
  String get status => age >= 18 ? 'ผู้ใหญ่' : 'เยาวชน';

  // Setter (รับ String แต่เก็บเป็น String?)
  set emailAddress(String? email) {
    if (email != null && email.contains('@')) {
      _email = email;
    } else if (email != null) {
      throw FormatException('รูปแบบอีเมลไม่ถูกต้อง');
    }
  }

  // Getter สำหรับอีเมล (ส่งคืน String?)
  String? get emailAddress => _email;

  void celebrateBirthday() {
    age++;
    print('สุขสันต์วันเกิด! $name อายุ $age ปีแล้ว');
  }
}

User? getUser({required bool isLoggedIn}) {
  if (isLoggedIn) {
    return User('สมชาย', 30);
  }
  return null;
}

class Product {
  String? name;
  double? price;
  bool? inStock;
  String? description;
}

class ShoppingCart {
  List<Map<String, dynamic>> items = [];
  double total = 0;

  void addItem(String name, double price) {
    items.add({'name': name, 'price': price});
    total += price;
  }

  void applyDiscount(double percentage) {
    double discount = total * (percentage / 100);
    total -= discount;
  }

  void printItems() {
    print('รายการสินค้าในตะกร้า:');
    for (var item in items) {
      print('- ${item['name']}: ${item['price']} บาท');
    }
  }
}

class Order {
  String? customerName;
  DateTime orderDate = DateTime.now();
  double? totalAmount;
}

// Extension Methods
extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}

extension ListIntExtension on List<int> {
  double average() {
    if (isEmpty) return 0;
    int sum = reduce((a, b) => a + b);
    return sum / length;
  }
}
