// 1. ไม่มี constructor (ใช้ default)
class SimpleClass {
  String name = 'Default';
}

// 2. มี constructor แบบปกติ
class PersonWithConstructor {
  String name;
  int age;

  PersonWithConstructor(this.name, this.age);
}

// 3. มี named parameters
class PersonWithNamed {
  String name;
  int age;

  PersonWithNamed({required this.name, required this.age});
}

// 4. มี optional parameters
class PersonWithOptional {
  String name;
  int age;

  PersonWithOptional(this.name, [this.age = 0]);
}

// 5. มี named constructor
class PersonWithNamedConstructor {
  String name;
  int age;

  PersonWithNamedConstructor(this.name, this.age);

  PersonWithNamedConstructor.guest() : name = 'Guest', age = 0;

  PersonWithNamedConstructor.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'];
}

// 6. มี factory constructor
class PersonWithFactory {
  String name;
  int age;

  PersonWithFactory._internal(this.name, this.age);

  factory PersonWithFactory(String name, int age) {
    if (age < 0) {
      throw ArgumentError('Age cannot be negative');
    }
    return PersonWithFactory._internal(name, age);
  }
}

// 7. Singleton
class Singleton {
  static Singleton? _instance;

  Singleton._internal();

  factory Singleton() {
    _instance ??= Singleton._internal();
    return _instance!;
  }
}

// 8. Abstract class (ไม่ต้องมี constructor)
abstract class Shape {
  double getArea();
}

void main() {
  // 1. Default constructor
  var simple = SimpleClass();
  print(simple.name); // Default

  // 2. Constructor แบบปกติ
  var person1 = PersonWithConstructor('John', 25);

  // 3. Named parameters
  var person2 = PersonWithNamed(name: 'Jane', age: 30);

  // 4. Optional parameters
  var person3 = PersonWithOptional('Bob');
  var person4 = PersonWithOptional('Alice', 28);

  // 5. Named constructor
  var person5 = PersonWithNamedConstructor('Mike', 35);
  var person6 = PersonWithNamedConstructor.guest();
  var person7 = PersonWithNamedConstructor.fromJson({'name': 'Tom', 'age': 40});

  // 6. Factory constructor
  var person8 = PersonWithFactory('Sarah', 22);
  // var person9 = PersonWithFactory('Invalid', -5); // Error!

  // 7. Singleton
  var singleton1 = Singleton();
  var singleton2 = Singleton();
  print(identical(singleton1, singleton2)); // true
}
