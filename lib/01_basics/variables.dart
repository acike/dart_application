void main() {
  // 1. var - ตัวแปรที่สามารถเปลี่ยนค่าได้
  var name = 'John';
  name = 'Jane'; // สามารถเปลี่ยนค่าได้
  print('ชื่อ: $name');

  // 2. final - ตัวแปรที่กำหนดค่าได้ครั้งเดียว
  final age = 25;
  // age = 26; // Error: Cannot assign to final variable
  print('อายุ: $age');

  // 3. const - ค่าคงที่ที่กำหนดตอน compile time
  const PI = 3.14159;
  // PI = 3.14; // Error: Constant variables can't be assigned a value
  print('ค่า PI: $PI');

  // 4. late - ตัวแปรที่กำหนดค่าในภายหลัง
  late String greeting;
  greeting = 'สวัสดี'; // กำหนดค่าในภายหลัง
  print('คำทักทาย: $greeting');

  // 5. late final - ตัวแปรที่กำหนดค่าได้ครั้งเดียวในภายหลัง
  late final String message;
  message = 'Hello World';
  // message = 'Hi'; // Error: Can't assign to final variable
  print('ข้อความ: $message');

  // ตัวอย่างการใช้งานในชีวิตจริง
  // 1. ข้อมูลผู้ใช้
  final user = {'name': 'สมชาย', 'age': 30, 'isActive': true};
  print('ข้อมูลผู้ใช้: $user');

  // 2. การคำนวณ
  const taxRate = 0.07;
  var price = 1000.0;
  var total = price + (price * taxRate);
  print('ราคาสินค้า: $price บาท');
  print('ภาษี: ${price * taxRate} บาท');
  print('ราคารวม: $total บาท');
}
