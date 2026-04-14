// ไฟล์: lib/09_oop_deep_dive/1_classes_basics.dart
class Example {
  final String name;
  final int age;
  final DateTime createdAt;

  // 1. Constructor ปกติ
  Example(this.name, this.age, this.createdAt);

  // 2. Named parameters
  Example.named({
    required this.name,
    required this.age,
    required this.createdAt,
  });

  // 3. Optional parameters
  Example.optional(this.name, [this.age = 0, DateTime? createdAt])
    : createdAt = createdAt ?? DateTime.now();

  // 4. Initializer list
  Example.withDefaults(this.name) : age = 0, createdAt = DateTime.now();

  // 5. Redirecting constructor
  Example.guest() : this('Guest', 0, DateTime.now());

  // 6. Factory constructor
  factory Example.fromJson(Map<String, dynamic> json) {
    return Example(
      json['name'],
      json['age'],
      DateTime.parse(json['createdAt']),
    );
  }
  Example.fromJson3(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'],
      createdAt = DateTime.parse(json['createdAt']);
  // 7. Const constructor
  const Example.constant(this.name, this.age, this.createdAt);
}

// 1. นิยาม Class พื้นฐาน
// Class คือพิมพ์เขียวสำหรับสร้าง Object
// เหมือนแบบแปลนบ้าน ที่ใช้สร้างบ้านหลายๆ หลังได้
class Bicycle {
  // 2. Fields (Instance Variables)
  // ตัวแปรที่เก็บข้อมูลของแต่ละ Object ที่สร้างจาก Class นี้
  //จักรยานแต่ละคันมี cadence, speed, gear ของตัวเอง
  int cadence;
  int _speed = 0; // การใช้ _ นำหน้า ทำให้เป็น private (เข้าถึงได้แค่ในไฟล์นี้)
  int gear;
  String color = 'ไม่ระบุ'; // สามารถกำหนดค่าเริ่มต้นได้

  // 3. Constructor พื้นฐาน (Syntactic Sugar)
  // ฟังก์ชันพิเศษที่ใช้สร้าง Object จาก Class
  // Dart มีวิธีเขียนสั้นๆ โดยใช้ this. ตามด้วยชื่อ field
  // มันจะกำหนดค่าที่รับมาให้กับ field โดยอัตโนมัติ
  Bicycle(this.cadence, this.gear);

  // เราสามารถมี Constructor ได้หลายแบบ (จะอธิบายในหัวข้อถัดไป)

  // 4. Getter (สำหรับการอ่านค่า)
  // Dart สร้าง getter ให้ field ที่เป็น public (ไม่มี _) โดยอัตโนมัติ
  // เช่น เราสามารถเรียก bicycle.cadence ได้เลย

  // เราสามารถสร้าง getter เองได้ ถ้าต้องการ logic เพิ่มเติม
  // หรือต้องการเปิดเผยค่า private field (_speed)
  int get speed => _speed; // Getter แบบสั้น สำหรับอ่านค่า _speed

  // Getter แบบเต็ม (ถ้ามี logic ซับซ้อน)
  String get description {
    return 'จักรยานสี $color เกียร์ $gear ความเร็ว $speed';
  }

  // 5. Setter (สำหรับการกำหนดค่า)
  // Dart สร้าง setter ให้ field ที่เป็น public และ non-final โดยอัตโนมัติ
  // เช่น เราสามารถกำหนด bicycle.cadence = 50 ได้เลย

  // เราสามารถสร้าง setter เองได้ ถ้าต้องการ logic เพิ่มเติม
  // เช่น การตรวจสอบค่าก่อนกำหนด
  set speed(int newSpeed) {
    if (newSpeed >= 0) {
      _speed = newSpeed;
    } else {
      print('ความเร็วติดลบไม่ได้!');
    }
  }

  // 6. Methods (Instance Methods)
  // ฟังก์ชันที่ทำงานกับข้อมูลของ Object นั้นๆ
  void applyBrake(int decrement) {
    speed -= decrement; // เรียกใช้ setter ที่เราสร้างเอง
  }

  void speedUp(int increment) {
    speed += increment; // เรียกใช้ setter ที่เราสร้างเอง
  }

  // Override เมธอด toString() จากคลาส Object (จะอธิบายเพิ่มในหัวข้ออื่น)
  // เพื่อให้ print(bicycle) แสดงผลได้สวยงาม
  @override
  String toString() {
    return 'Bicycle: เกียร์ $gear, ความเร็ว $speed';
  }

  // 7. Static Members (Fields and Methods)
  // เป็นของ Class ไม่ใช่ของ Object แต่ละตัว
  // เรียกใช้ผ่านชื่อ Class โดยตรง ไม่ต้องสร้าง Object ก่อน
  static int numberOfBicycles =
      0; // ตัวแปร static เก็บจำนวนจักรยานที่สร้างทั้งหมด

  // Constructor ที่เพิ่มการนับจำนวนจักรยาน
  // ต้องสร้าง constructor เพิ่มแบบนี้ เพราะอันแรกใช้ syntactic sugar ไปแล้ว
  // หรือจะไปเพิ่ม logic ใน constructor อื่นๆ ก็ได้
  Bicycle.withColor(this.cadence, this.gear, this.color) {
    numberOfBicycles++; // เพิ่มจำนวนเมื่อสร้าง Object ใหม่
  }

  // เมธอด static
  static void printNumberOfBicycles() {
    print('จำนวนจักรยานทั้งหมดที่สร้าง: $numberOfBicycles');
  }
}

void main() {
  print('--- พื้นฐาน Class และ Object ---');
  // สร้าง Object จาก Class Bicycle โดยใช้ Constructor พื้นฐาน
  var bike1 = Bicycle(20, 1);
  print('Bike 1: ${bike1.cadence}, ${bike1.gear}'); // ใช้ getter อัตโนมัติ
  print(bike1); // ใช้ toString() ที่ override ไว้

  // สร้าง Object โดยใช้ Constructor ที่เราสร้างเพิ่ม (แบบมีสี)
  var bike2 = Bicycle.withColor(30, 6, 'แดง');
  print('Bike 2: ${bike2.cadence}, ${bike2.gear}, ${bike2.color}');

  print('\n--- Getters และ Setters ---');
  // ใช้ setter อัตโนมัติ
  bike1.cadence = 25;
  print('Bike 1 Cadence (หลังเปลี่ยน): ${bike1.cadence}');

  // ใช้ setter ที่สร้างเอง (_speed เป็น private แต่เข้าถึงผ่าน setter ได้)
  bike1.speed = 10;
  print('Bike 1 Speed: ${bike1.speed}'); // ใช้ getter ที่สร้างเอง

  bike1.speed = -5; // ลองกำหนดค่าติดลบ
  print('Bike 1 Speed (หลังลองติดลบ): ${bike1.speed}'); // ค่าไม่เปลี่ยน

  print('Bike 1 Description: ${bike1.description}'); // ใช้ getter ที่มี logic

  print('\n--- Methods ---');
  bike1.speedUp(5);
  print('Bike 1 Speed (หลัง speedUp): ${bike1.speed}');
  bike1.applyBrake(3);
  print('Bike 1 Speed (หลัง applyBrake): ${bike1.speed}');

  print('\n--- Static Members ---');
  // เรียกใช้ static field และ method ผ่านชื่อ Class
  // สังเกตว่า numberOfBicycles มีค่าเป็น 1 เพราะ bike2 ถูกสร้างด้วย constructor ที่นับ
  print('จำนวนจักรยานตอนเริ่ม: ${Bicycle.numberOfBicycles}');
  Bicycle.printNumberOfBicycles();

  // สร้างจักรยานเพิ่ม
  var bike3 = Bicycle.withColor(40, 18, 'น้ำเงิน');
  print('สร้าง Bike 3 สี ${bike3.color}');
  Bicycle.printNumberOfBicycles(); // จำนวนเพิ่มเป็น 2
  print('จำนวนจักรยานตอนเริ่ม: ${Bicycle.numberOfBicycles}');
  final bike4 = Bicycle.withColor(10, 5, ' red');
  print('จำนวนจักรยานตอนเริ่ม: ${Bicycle.numberOfBicycles}');
}
