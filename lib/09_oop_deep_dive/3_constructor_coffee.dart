class CoffeeCup {
  final String size;
  final int price;

  // ❌ ไม่ใช้ this ใน parameter - มีการคำนวณราคา
  CoffeeCup.withDiscount(String sizeInput, double discountPercent)
    : this.size = sizeInput,
      price = (150 * (1 - discountPercent / 100)).round() {
    print('สร้างกาแฟ $size ราคา $price บาท (ลด $discountPercent%)');
  }
}

class ShadeOfGray {
  final int brightness;

  ShadeOfGray(int val) : this.brightness = val;

  ShadeOfGray.black() : this(0);

  // But now it will!
  ShadeOfGray.alsoBlack() : this.black();
}

class Student {
  final String name;
  final int age;
  final int grade;

  const Student({required this.name, required this.age, this.grade = 0});
  Student.freshman(this.name) : age = 15, grade = 1;
  Student.fromBirthYear(this.name, int birthYear)
    : age = DateTime.now().year - birthYear,
      grade = 0 {
    // ตรวจสอบว่าอายุสมเหตุสมผลไหม
    if (age < 0 || age > 100) {
      throw ArgumentError('อายุไม่ถูกต้อง: $age (จากปีเกิด $birthYear)');
    }
    print('Student $name is $age years old and in grade $grade');
  }

  Student.test(this.name, this.age, this.grade);
}

void main() {
  final student1 = Student(name: 'John', age: 20);
  final student = Student.fromBirthYear('John', 2000);
  print(student.name);
  print(student.age);
  print(student.grade);
  final coffee = CoffeeCup.withDiscount('L', 10);
  print(coffee.size);
  print(coffee.price);
  final shade = ShadeOfGray.alsoBlack();
  print(shade.brightness);
  final shade2 = ShadeOfGray.black();
  print(shade2.brightness);
  final shade3 = ShadeOfGray(100);
  print(shade3.brightness);
  final shade4 = ShadeOfGray.alsoBlack();
  print(shade4.brightness);
  final shade5 = ShadeOfGray.black();
  print(shade5.brightness);
  final shade6 = ShadeOfGray(100);
  print(shade6.brightness);
  final shade7 = ShadeOfGray.alsoBlack();
  print(shade7.brightness);
}
// class Student {
//   final String name;
//   final int age;
//   final int score;

//   const Student(this.name, this.age, this.score);

//   const Student.guest() : this('Guest', 0, 0);

//   const Student.student(this.name, this.age, this.score);

//   const Student.teacher(this.name, this.age, this.score);

//   const Student.admin(this.name, this.age, this.score);
// }
class Point {
  final double x;
  final double y;
  // Point(this.x, this.y);
  Point(double px, double py) : x = px, y = py;
  // ไม่มี {} - จบที่ initializer list เลย
  Point.origin() : x = 0, y = 0;
  Point.origin2() : this(0, 0);
  Point.origin3() : this.origin();
}
