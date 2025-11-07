// คลาสพื้นฐาน
class Person {
  // Properties (คุณสมบัติ)
  String name;
  int age;
  String? address; // nullable property (คุณสมบัติที่สามารถเป็น null ได้)

  // Constructor แบบมาตรฐาน (Standard Constructor)
  Person(this.name, this.age, [this.address]);

  // Named Constructor (Constructor ที่มีชื่อ)
  Person.guest() : name = 'Guest', age = 0, address = 'Unknown';

  // Methods (เมธอด)
  void introduce() {
    print('สวัสดี ฉันชื่อ $name, อายุ $age ปี');
    if (address != null) {
      print('ที่อยู่: $address');
    }
  }

  // Getter
  String get info => '$name, $age ปี';

  // Setter
  set setAddress(String value) {
    address = value;
  }
}

// คลาสที่มีการสืบทอด (Inheritance)
class Student extends Person {
  String school;
  List<int> scores = [];

  // Constructor ที่เรียก constructor ของคลาสแม่
  Student(String name, int age, this.school, [String? address])
    : super(name, age, address);

  // Override method จากคลาสแม่
  @override
  void introduce() {
    super.introduce(); // เรียกใช้เมธอดของคลาสแม่
    print('โรงเรียน: $school');
  }

  // เมธอดเพิ่มเติมในคลาสลูก
  void addScore(int score) {
    scores.add(score);
  }

  double getAverage() {
    if (scores.isEmpty) return 0;
    return scores.reduce((a, b) => a + b) / scores.length;
  }
}

// Abstract Class (คลาสนามธรรม)
abstract class Shape {
  // Abstract method (เมธอดนามธรรม)
  double calculateArea();

  // Concrete method (เมธอดปกติ)
  void printInfo() {
    print('พื้นที่: ${calculateArea()} ตร.หน่วย');
  }
}

// คลาสที่สืบทอดจาก Abstract Class
class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return 3.14 * radius * radius;
  }
}

// Mixins (มิกซ์อิน)
mixin Logger {
  void log(String message) {
    print('LOG: $message');
  }
}

// คลาสที่ใช้ Mixins
class Database with Logger {
  void save(String data) {
    log('Saving data: $data');
    print('Data saved successfully');
  }
}

// Interface (อินเตอร์เฟส) ใน Dart ใช้คลาสธรรมดาเป็น Interface ได้
class Printable {
  void printContent() {
    throw UnimplementedError();
  }
}

// คลาสที่ implement Interface
class Report implements Printable {
  String content;

  Report(this.content);

  @override
  void printContent() {
    print('--- REPORT ---');
    print(content);
    print('-------------');
  }
}

// Factory Constructor
class Config {
  final String apiKey;
  static Config? _instance;

  // Private constructor
  Config._internal(this.apiKey);

  // Factory constructor
  factory Config(String apiKey) {
    _instance ??= Config._internal(apiKey);
    return _instance!;
  }
}

void main() {
  // 1. การสร้างและใช้งานคลาสพื้นฐาน
  print('=== คลาสพื้นฐาน ===');
  var person1 = Person('สมชาย', 30, 'กรุงเทพฯ');
  person1.introduce();

  // ใช้ Named Constructor
  var guest = Person.guest();
  guest.introduce();

  // ใช้ Getter และ Setter
  print('ข้อมูล: ${person1.name}');
  person1.setAddress = 'เชียงใหม่';
  person1.introduce();

  // 2. การสืบทอดคลาส (Inheritance)
  print('\n=== การสืบทอดคลาส ===');
  var student = Student('สมหญิง', 18, 'โรงเรียนมัธยม', 'เชียงใหม่');
  student.introduce();

  student.addScore(85);
  student.addScore(92);
  student.addScore(78);
  print('คะแนนเฉลี่ย: ${student.getAverage()}');

  // 3. Abstract Class
  print('\n=== Abstract Class ===');
  var circle = Circle(5);
  circle.printInfo();

  // 4. Mixins
  print('\n=== Mixins ===');
  var db = Database();
  db.save('User data');

  // 5. Interfaces
  print('\n=== Interfaces ===');
  var report = Report('รายงานผลประกอบการประจำปี 2023');
  report.printContent();

  // 6. Factory Constructor
  print('\n=== Factory Constructor ===');
  var config1 = Config('API_KEY_123');
  var config2 = Config('API_KEY_456');

  print('config1 API key: ${config1.apiKey}');
  print('config2 API key: ${config2.apiKey}');
  print('เป็น instance เดียวกัน: ${identical(config1, config2)}');

  // 7. ตัวอย่างการใช้งานจริง
  print('\n=== ตัวอย่างการใช้งานจริง ===');

  // ระบบจัดการนักเรียน
  var student1 = Student('แดง', 16, 'โรงเรียน ก');
  var student2 = Student('เขียว', 17, 'โรงเรียน ก');
  var student3 = Student('น้ำเงิน', 15, 'โรงเรียน ข');

  List<Student> students = [student1, student2, student3];

  student1.addScore(75);
  student1.addScore(82);

  student2.addScore(90);
  student2.addScore(88);

  student3.addScore(65);
  student3.addScore(72);

  print('รายชื่อนักเรียน:');
  for (var student in students) {
    print('- ${student.name} (คะแนนเฉลี่ย: ${student.getAverage()})');
  }

  // หาคะแนนเฉลี่ยของทั้งโรงเรียน
  Map<String, List<Student>> schoolMap = {};

  for (var student in students) {
    // if (!schoolMap.containsKey(student.school)) {
    //   schoolMap[student.school] = [];
    // }
    schoolMap[student.school] ??= [];

    schoolMap[student.school]!.add(student);
  }

  print('\nคะแนนเฉลี่ยแต่ละโรงเรียน:');
  schoolMap.forEach((school, studentList) {
    double totalAvg =
        studentList.map((s) => s.getAverage()).reduce((a, b) => a + b) /
        studentList.length;

    print('$school: ${totalAvg.toStringAsFixed(2)}');
  });
}
