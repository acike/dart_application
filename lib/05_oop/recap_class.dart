// คลาสแม่
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void introduce() {
    print('สวัสดีครับ ผมชื่อ $name อายุ $age ปี');
  }
}

// คลาสลูก - แบบที่ 1: เรียก super ก่อน
class Student1 extends Person {
  String school;

  Student1(super.name, super.age, this.school);

  @override
  void introduce() {
    super.introduce(); // แม่พูดก่อน
    print('โรงเรียน: $school'); // ลูกพูดหลัง
  }
}

// คลาสลูก - แบบที่ 2: เรียก super หลัง
class Student2 extends Person {
  String school;

  Student2(super.name, super.age, this.school);

  @override
  void introduce() {
    print('โรงเรียน: $school'); // ลูกพูดก่อน
    super.introduce(); // แม่พูดหลัง
  }
}

void testDifference() {
  print('🧪 ทดสอบความแตกต่าง:\n');

  var student1 = Student1('สมชาย', 16, 'โรงเรียนดังมาก');
  var student2 = Student2('สมหญิง', 16, 'โรงเรียนเก่งมาก');

  print('--- แบบที่ 1: เรียก super ก่อน ---');
  student1.introduce();

  print('\n--- แบบที่ 2: เรียก super หลัง ---');
  student2.introduce();
}

class Animal {
  String name;
  Animal(this.name) {
    print('🐾 สร้าง Animal: $name');
  }
}

class Dog extends Animal {
  String breed;

  // super() ใน constructor ต้องเรียกก่อนเสมอ!
  Dog(super.name, this.breed) {
    // ✅ super ก่อน
    print('🐕 สร้าง Dog สายพันธุ์: $breed');
  }

  // ❌ ไม่ได้ - super ต้องอยู่ใน initializer list
  // Dog(String name, this.breed) {
  //   super(name);  // ERROR!
  // }
}

void main() {
  testDifference();
  final dog = Dog('สมชาย', 'สุนัขสุดหล่อ');
  final animal = Animal('33');
}
