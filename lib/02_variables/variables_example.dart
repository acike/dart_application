// ตัวอย่างการใช้งานตัวแปรใน Dart
void main() {
  // 1. ตัวแปรปกติ (var)
  var name = 'John'; // Dart จะอนุมาน type ให้เองว่าเป็น String
  print('1. ตัวแปรปกติ: $name');

  // 2. ตัวแปรที่กำหนดค่าได้ครั้งเดียว (final)
  final age = 25; // กำหนดค่าได้ครั้งเดียว แต่ไม่ต้องกำหนดตอนประกาศ
  // age = 26;  // Error: ไม่สามารถเปลี่ยนค่าได้
  print('2. ตัวแปร final: $age');

  // 3. ตัวแปรคงที่ (const)
  const PI = 3.14159; // ต้องกำหนดค่าตอนประกาศ และไม่สามารถเปลี่ยนค่าได้
  // PI = 3.14;  // Error: ไม่สามารถเปลี่ยนค่าได้
  print('3. ตัวแปร const: $PI');

  // 4. ตัวแปรที่กำหนดค่าในภายหลัง (late)
  late String address; // ประกาศตัวแปรก่อน แต่ยังไม่กำหนดค่า
  address = '123 Main St'; // กำหนดค่าในภายหลัง
  print('4. ตัวแปร late: $address');

  // 5. ตัวแปร late final
  late final String email; // ประกาศตัวแปรก่อน แต่ยังไม่กำหนดค่า
  email = 'john@example.com'; // กำหนดค่าได้ครั้งเดียว
  // email = 'new@example.com';  // Error: ไม่สามารถเปลี่ยนค่าได้
  print('5. ตัวแปร late final: $email');

  // ตัวอย่างการใช้งานในชีวิตจริง
  print('\nตัวอย่างการใช้งานในชีวิตจริง:');

  // ตัวอย่างการใช้ final
  final user = User('John', 25);
  print('User: ${user.name}, Age: ${user.age}');

  // ตัวอย่างการใช้ const
  const defaultSettings = AppSettings(theme: 'light', language: 'th');
  print(
    'Default Settings: ${defaultSettings.theme}, ${defaultSettings.language}',
  );

  // ตัวอย่างการใช้ late
  final database = Database();
  database.connection = 'localhost:9099';
  print('Database connected before initialize: ${database.connection}');

  database.initialize(); // กำหนดค่า connection ในภายหลัง
  print('Database connected: ${database.isConnected}');
  print('Database connected after initialize: ${database.connection}');
}

// ตัวอย่างคลาสที่ใช้ final
class User {
  final String name;
  final int age;

  User(this.name, this.age);
}

// ตัวอย่างคลาสที่ใช้ const
class AppSettings {
  final String theme;
  final String language;

  const AppSettings({required this.theme, required this.language});
}

// ตัวอย่างคลาสที่ใช้ late
class Database {
  late String connection;
  bool isConnected = false;

  void initialize() {
    connection = 'localhost:5432';
    isConnected = true;
  }
}
