// ตัวอย่าง Parameter Types ใน Dart
void main() {
  // 1. Required Parameters (พารามิเตอร์บังคับ)
  print('=== Required Parameters ===');
  greet('John'); // ต้องส่งค่า name เสมอ

  // 2. Optional Positional Parameters (พารามิเตอร์เลือกได้ตามตำแหน่ง)
  print('\n=== Optional Positional Parameters ===');
  printInfo('John'); // ไม่ส่ง age
  printInfo('John', 25); // ส่ง age ด้วย

  // 3. Named Parameters (พารามิเตอร์แบบมีชื่อ)
  print('\n=== Named Parameters ===');
  createUser(name: 'John', age: 25); // ระบุชื่อพารามิเตอร์
  createUser(age: 25, name: 'John'); // สลับตำแหน่งได้

  // 4. Required Named Parameters (พารามิเตอร์แบบมีชื่อและบังคับ)
  print('\n=== Required Named Parameters ===');
  createProduct(name: 'Apple', price: 30); // ต้องส่งทั้ง name และ price
  createProduct(price: 20, name: 'Apple');
  // 5. Default Values (ค่าตั้งต้น)
  print('\n=== Default Values ===');
  printMessage(); // ใช้ค่า default
  printMessage('Hello!'); // ส่งค่าใหม่

  // 6. Rest Parameters (รับพารามิเตอร์ไม่จำกัดจำนวน)
  print('\n=== Rest Parameters ===');
  printNumbers(1, 2, 3, 4, 5);
  printNumbers(1, 2);

  // เรียกใช้ตัวอย่างการส่งอีเมล
  final userService = UserService();
  userService.demoEmailCalls();
}

// 1. Required Parameters
// ใช้เมื่อต้องการให้ผู้เรียกใช้ต้องส่งค่าพารามิเตอร์เสมอ
void greet(String name) {
  print('Hello, $name!');
}

// 2. Optional Positional Parameters
// ใช้เมื่อมีพารามิเตอร์ที่อาจจะส่งหรือไม่ส่งก็ได้
void printInfo(String name, [int? age]) {
  // if (age != null) {
  //   print('Name: $name, Age: $age');
  // } else {
  //   print('Name: $name');
  // }
  print('Name: $name, Age: $age');
}

// 3. Named Parameters
// ใช้เมื่อมีพารามิเตอร์หลายตัวและต้องการความชัดเจน
void createUser({String? name, int? age}) {
  print('Creating user: $name, $age');
}

// 4. Required Named Parameters
// ใช้เมื่อต้องการให้ผู้เรียกใช้ต้องระบุชื่อพารามิเตอร์
void createProduct({required String name, required int price}) {
  print('Product: $name, Price: $price');
}

// 5. Default Values
// ใช้เมื่อต้องการกำหนดค่าเริ่มต้นให้พารามิเตอร์
void printMessage([String message = 'Default message']) {
  print(message);
}

// 6. Rest Parameters
// ใช้เมื่อต้องการรับพารามิเตอร์ไม่จำกัดจำนวน
void printNumbers(
  int first,
  int second, [
  int? third,
  int? fourth,
  int fifth = 5,
]) {
  print('Numbers: $first, $second, $third, $fourth, $fifth');
}

// Use Cases ในชีวิตจริง
class UserService {
  // Required Parameters: สำหรับข้อมูลที่จำเป็นต้องมี
  void registerUser(String username, String password) {
    // ลงทะเบียนผู้ใช้
  }

  // Optional Parameters: สำหรับข้อมูลเพิ่มเติม
  void updateProfile(String userId, [String? newName, String? newEmail]) {
    // อัปเดตโปรไฟล์
  }

  // Named Parameters: สำหรับการตั้งค่าที่ซับซ้อน
  void sendEmail({
    required String to,
    required String subject,
    String? body,
    List<String>? attachments,
  }) {
    // ส่งอีเมล
    print('Sending email to $to with subject $subject');
    if (body != null) {
      print('Body: $body');
    }
    if (attachments != null) {
      print('Attachments: $attachments');
    }
  }

  // ตัวอย่างการเรียกใช้ sendEmail ในทุกวิธีที่เป็นไปได้
  void demoEmailCalls() {
    // 1. เรียกใช้แบบพื้นฐาน (ต้องมี to และ subject)
    sendEmail(to: 'user@example.com', subject: 'Hello');

    // 2. เรียกใช้พร้อม body
    sendEmail(
      to: 'user@example.com',
      subject: 'Hello',
      body: 'This is a test email',
    );

    // 3. เรียกใช้พร้อม attachments
    sendEmail(
      to: 'user@example.com',
      subject: 'Hello',
      attachments: ['file1.pdf', 'file2.jpg'],
    );

    // 4. เรียกใช้พร้อมทั้ง body และ attachments
    sendEmail(
      to: 'user@example.com',
      subject: 'Hello',
      body: 'This is a test email',
      attachments: ['file1.pdf', 'file2.jpg'],
    );

    // 5. เรียกใช้โดยสลับตำแหน่งพารามิเตอร์ (Named parameters สามารถสลับตำแหน่งได้)
    sendEmail(
      subject: 'Hello',
      to: 'user@example.com',
      attachments: ['file1.pdf'],
      body: 'This is a test email',
    );

    // 6. เรียกใช้กับ List ว่าง
    sendEmail(to: 'user@example.com', subject: 'Hello', attachments: []);

    // 7. เรียกใช้กับ List ที่มีค่าเดียว
    sendEmail(
      to: 'user@example.com',
      subject: 'Hello',
      attachments: ['single_file.pdf'],
    );
  }
}
