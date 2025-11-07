import 'dart:math';

class Logger {
  final String name;
  bool _enabled = true; // private field

  // เก็บ logger ที่สร้างแล้วด้วย factory constructor (สำหรับ singleton pattern)
  static final Map<String, Logger> _cache = <String, Logger>{};

  // 1. Named Constructor
  // สร้าง constructor เพิ่มเติมโดยการตั้งชื่อหลังชื่อ Class
  // เหมาะสำหรับให้ทางเลือกในการสร้าง object ที่มีความหมายชัดเจน
  // constructor นี้รับเฉพาะชื่อ และเปิดใช้งาน logger โดยอัตโนมัติ
  Logger.named(this.name) {
    print('สร้าง Logger ชื่อ: $name (ผ่าน Named Constructor)');
  }

  // constructor อีกตัวที่ปิดใช้งาน logger ตั้งแต่ต้น
  Logger.disabled(this.name) : _enabled = false {
    print('สร้าง Logger ชื่อ: $name (ปิดใช้งาน)');
  }

  // 2. Factory Constructor
  // ใช้ keyword 'factory'
  // ไม่จำเป็นต้องสร้าง instance ใหม่เสมอไป! สามารถ return instance ที่มีอยู่แล้วได้
  // หรือ return instance ของ subtype ก็ได้ (จะเห็นในเรื่อง Inheritance)
  // เหมาะสำหรับ:
  // - Singleton pattern: คืนค่า instance เดิมเสมอ
  // - Caching: คืนค่า instance จาก cache ถ้ามี
  // - Logic การตัดสินใจว่าจะ return object แบบไหน
  factory Logger(String name) {
    print('\n--- เรียก Factory Logger("$name") ---');
    // ถ้ามี logger ชื่อนี้ใน cache อยู่แล้ว ให้ return ตัวนั้นไปเลย
    if (_cache.containsKey(name)) {
      print('พบ Logger "$name" ใน cache คืนค่าเดิม');
      return _cache[name]!;
    } else {
      // ถ้าไม่มี ให้สร้างใหม่โดยเรียก Named Constructor 'named'
      print('ไม่พบ Logger "$name" ใน cache สร้างใหม่...');
      final logger = Logger.named(name);
      _cache[name] = logger; // เก็บไว้ใน cache
      return logger;
    }
  }

  void log(String msg) {
    if (_enabled) {
      print('$name: $msg');
    } else {
      print('Logger $name ปิดใช้งานอยู่');
    }
  }
}

class Point {
  final double x;
  final double y;
  final double distanceFromOrigin;

  // 3. Redirecting Constructor
  // ใช้ ':' ตามด้วย 'this(...)' เพื่อเรียก constructor อื่นใน class เดียวกัน
  // ลดโค้ดซ้ำซ้อนในการกำหนดค่าเริ่มต้น
  // constructor นี้รับ x, y แล้วคำนวณ distanceFromOrigin โดยเรียก constructor หลัก
  Point(double x, double y) : this._internal(x, y, sqrt(x * x + y * y));
  Point.test(double x, double y)
    : this._internal(x + 1, y + 1, sqrt((x + 1) * (x + 1) + (y + 1) * (y + 1)));

  // Constructor หลัก (อาจเป็น private ถ้าไม่ต้องการให้เรียกตรงๆ)
  Point._internal(this.x, this.y, this.distanceFromOrigin);

  // Redirecting ไปยัง Named Constructor อื่น
  Point.alongXAxis(double x) : this(x, 0); // เรียก Point(x, 0)
  Point.alongXAxis2(double x) : this.test(x, 2); // เรียก Point(x, 0)

  @override
  String toString() => 'Point(x: $x, y: $y, distance: $distanceFromOrigin)';
}

// 4. Constant Constructor
// ใช้ 'const' หน้า constructor
// เงื่อนไข:
// - Class ต้องมีแต่ final fields เท่านั้น
// - Constructor ต้องไม่สามารถมี body ({}) ได้
// - ถ้ามีการ redirect ต้อง redirect ไปยัง const constructor อื่น
// ประโยชน์:
// - สร้าง compile-time constants: object ที่เหมือนกันจะใช้ instance เดียวกันในหน่วยความจำ
// - เพิ่มประสิทธิภาพ
// - ใช้ใน context ที่ต้องการค่าคงที่ (เช่น annotation, switch case patterns)
class ImmutablePoint {
  // Fields ต้องเป็น final ทั้งหมด
  final double x;
  final double y;

  // Const Constructor
  const ImmutablePoint(this.x, this.y);

  // Const Named Constructor
  const ImmutablePoint.origin() : x = 0, y = 0;

  // Const Redirecting Constructor
  const ImmutablePoint.alongYAxis(double y) : this(0, y);

  @override
  String toString() => 'ImmutablePoint(x: $x, y: $y)';
}

void main() {
  print('--- 1. Named Constructors ---');
  var logger1 = Logger.named('UI');
  logger1.log('ปุ่มถูกคลิก');

  var logger2 = Logger.disabled('Network');
  logger2.log('กำลังส่งข้อมูล'); // จะบอกว่าปิดใช้งานอยู่

  print('\n--- 2. Factory Constructor (Singleton/Cache) ---');
  // เรียก Factory Logger('Database') ครั้งแรก -> สร้างใหม่
  var dbLogger1 = Logger('Database');
  dbLogger1.log('เชื่อมต่อสำเร็จ');

  // เรียก Factory Logger('Database') ครั้งที่สอง -> คืนค่าจาก cache
  var dbLogger2 = Logger('Database');
  dbLogger2.log('เขียนข้อมูล');

  // ตรวจสอบว่าเป็น instance เดียวกันหรือไม่
  print(
    'dbLogger1 และ dbLogger2 เป็น instance เดียวกัน: ${identical(dbLogger1, dbLogger2)}',
  ); // ควรเป็น true

  // เรียก Factory Logger('UI') -> คืนค่าจาก cache (เพราะ logger1 ถูกสร้างไว้แล้ว)
  var uiLogger = Logger('UI');
  print(
    'logger1 และ uiLogger เป็น instance เดียวกัน: ${identical(logger1, uiLogger)}',
  ); // ควรเป็น true

  print('\n--- 3. Redirecting Constructors ---');
  var p1 = Point(3, 4); // เรียก Point(x, y) -> redirect ไป _internal
  print(p1);

  var p2 = Point.alongXAxis(
    5,
  ); // เรียก alongXAxis -> redirect ไป Point(5, 0) -> redirect ไป _internal
  print(p2);

  final p3 = Point.alongXAxis2(4);
  print(p3);
  print('\n--- 4. Constant Constructors ---');
  // สร้าง compile-time constant objects
  const point1 = ImmutablePoint(1, 2);
  const point2 = ImmutablePoint(1, 2); // เหมือน point1 เป๊ะ
  const origin1 = ImmutablePoint.origin();
  const origin2 = ImmutablePoint.origin(); // เหมือน origin1 เป๊ะ

  // ตรวจสอบว่าเป็น instance เดียวกันหรือไม่ (เนื่องจากเป็น const และค่าเหมือนกัน)
  print(
    'point1 และ point2 เป็น instance เดียวกัน: ${identical(point1, point2)}',
  ); // ควรเป็น true
  print(
    'origin1 และ origin2 เป็น instance เดียวกัน: ${identical(origin1, origin2)}',
  ); // ควรเป็น true

  // ใช้ใน const list
  const points = [
    ImmutablePoint(0, 0),
    ImmutablePoint(1, 1),
    ImmutablePoint.origin(), // เหมือนตัวแรก
  ];
  print('Const list: $points');
  //print points0 and points 2
  print(points[0]);
  print(points[2]);
  print(
    'points[0] และ points[2] เป็น instance เดียวกัน: ${identical(points[0], points[2])}',
  ); // ควรเป็น true

  //   // Const Constructor
  // const ImmutablePoint(this.x, this.y);

  // // Const Named Constructor
  // const ImmutablePoint.origin() : x = 0, y = 0;

  // // Const Redirecting Constructor
  // const ImmutablePoint.alongYAxis(double y) : this(0, y);
}
