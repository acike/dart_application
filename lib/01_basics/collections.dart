// ตัวอย่างการใช้งาน Set, List และ Map ใน Dart

void main() {
  // 1. List (Array)
  print('=== List ===');
  final numbers = [1, 2, 3, 4, 5];
  print('List: $numbers');

  // การเพิ่มข้อมูล
  numbers.add(6);
  print('เพิ่ม 6: $numbers');

  // การเข้าถึงข้อมูล
  print('ตัวแรก: ${numbers.first}');
  print('ตัวสุดท้าย: ${numbers.last}');
  print('ความยาว: ${numbers.length}');

  // การตรวจสอบการมีอยู่
  print('มี 3 หรือไม่: ${numbers.contains(3)}');
  print('มี 10 หรือไม่: ${numbers.contains(10)}');

  // การลบข้อมูล
  numbers.remove(3);
  print('ลบ 3: $numbers');

  // 2. Set (ไม่ซ้ำ)
  print('\n=== Set ===');
  final uniqueNumbers = {1, 2, 3, 3, 4, 4, 5};
  print('Set: $uniqueNumbers'); // จะแสดง {1, 2, 3, 4, 5}

  // การเพิ่มข้อมูล
  uniqueNumbers.add(6);
  print('เพิ่ม 6: $uniqueNumbers');

  // การตรวจสอบการมีอยู่
  print('มี 3 หรือไม่: ${uniqueNumbers.contains(3)}');

  // 3. Map (Key-Value)
  print('\n=== Map ===');
  final user = {'name': 'John', 'age': 25, 'isStudent': true};
  print('Map: $user');

  // การเข้าถึงข้อมูล
  print('ชื่อ: ${user['name']}');
  print('อายุ: ${user['age']}');

  // การเพิ่ม/แก้ไขข้อมูล
  user['city'] = 'Bangkok';
  print('เพิ่ม city: $user');

  // การลบข้อมูล
  user.remove('isStudent');
  print('ลบ isStudent: $user');

  // ตัวอย่างการใช้งานจริง
  print('\n=== ตัวอย่างการใช้งานจริง ===');

  // ตัวอย่าง List: รายการสินค้า
  final products = ['Apple', 'Banana', 'Orange'];
  print('สินค้า: $products');

  // ตัวอย่าง Set: รหัสสินค้าที่ไม่ซ้ำ
  final productCodes = {'A001', 'A002', 'A001'};
  print('รหัสสินค้า: $productCodes');
  print('มี A001 หรือไม่: ${productCodes.contains('A001')}');

  // ตัวอย่าง Map: ข้อมูลสินค้า
  final apple = {'name': 'Apple', 'price': 30};
  final productInfo = {
    'A001': apple, // ใช้ object เดียวกัน
    'A002': {'name': 'Banana', 'price': 20},
  };
  print('ข้อมูลสินค้า: $productInfo');
  print('มี A001 หรือไม่: ${productInfo.containsKey('A001')} }');
  print('มี A003 หรือไม่: ${productInfo.containsKey('A003')} }');
  print('มี A001 หรือไม่: ${productInfo.containsValue(apple)}');
  print(
    'มี A003 หรือไม่: ${productInfo.containsValue({'name': 'Apple', 'price': 30})}',
  );

  final hasApple = productInfo.values.any(
    (product) => product['name'] == 'Apple' && product['price'] == 30,
  );
  print('มี Apple หรือไม่: $hasApple');

  final hasBanana = productInfo.values.any((product) {
    print('ตรวจสอบสินค้า: $product');
    return product['name'] == 'Banana' && product['price'] == 20;
  });
  print('มี Banana หรือไม่: $hasBanana');
  final aa = Product('Apple', 30);
  final productInfo2 = {
    'A001': Product('Apple', 30),
    'A002': Product('Banana', 20),
  };

  // ignore: prefer_interpolation_to_compose_strings
  print('class Product : ${productInfo2.containsValue(Product('Apple', 30))}');
  print('class Product2 : ${productInfo2.containsValue(aa)}');
}

class Product {
  final String name;
  final int price;

  Product(this.name, this.price);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product && other.name == name && other.price == price;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode;
}

// class Product extends Equatable {
//   final String name;
//   final int price;

//   Product(this.name, this.price);

//   @override
//   List<Object?> get props => [name, price];

//   //   @override
//   // bool operator ==(Object other) {
//   //   if (identical(this, other)) return true;
//   //   return other is Product && other.name == name && other.price == price;
//   // }

//   // @override
//   // int get hashCode => name.hashCode ^ price.hashCode;
// }
