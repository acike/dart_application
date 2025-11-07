// การจัดการข้อผิดพลาด (Error Handling) ใน Dart
import 'dart:async';

Future<void> main() async {
  print('=== 1. การใช้งาน try-catch-finally พื้นฐาน ===');

  // 1. try-catch พื้นฐาน
  try {
    int result = 10 ~/ 0; // การหารด้วยศูนย์จะเกิด error
    print('ผลลัพธ์: $result'); // บรรทัดนี้จะไม่ถูกทำงาน
  } catch (e) {
    print('เกิดข้อผิดพลาด: $e');
  }

  // 2. try-catch-finally
  try {
    int result = 10 ~/ 0;
    print('ผลลัพธ์: $result');
  } catch (e) {
    print('เกิดข้อผิดพลาด: $e');
  } finally {
    print('finally จะทำงานเสมอ ไม่ว่าจะเกิด error หรือไม่ก็ตาม');
  }

  // 3. การจับ error เฉพาะประเภท
  print('\n=== 2. การจับ error เฉพาะประเภท ===');

  try {
    int result = 10 ~/ 0;
    print('ผลลัพธ์: $result');
  } on IntegerDivisionByZeroException {
    // จับเฉพาะ error ประเภทการหารด้วยศูนย์
    print('เกิดข้อผิดพลาด: หารด้วยศูนย์ไม่ได้');
  } on FormatException {
    print('เกิดข้อผิดพลาด: รูปแบบข้อมูลไม่ถูกต้อง');
  } catch (e) {
    // จับ error ประเภทอื่นๆ ที่ไม่ได้ระบุ
    print('เกิดข้อผิดพลาดอื่นๆ: $e');
  }
  print('\n=== =========');

  // 4. การจับ error และเข้าถึง stack trace
  try {
    int result = 10 ~/ 0;
    print('ผลลัพธ์: $result');
  } catch (e, stackTrace) {
    print('เกิดข้อผิดพลาด: $e');
    print('Stack trace: $stackTrace');
  }

  // 5. การ throw Exception
  print('\n=== 3. การ throw Exception ===');

  try {
    validateAge(-5);
  } catch (e) {
    print('เกิดข้อผิดพลาด: $e');
  }

  try {
    validateUsername('');
  } catch (e) {
    print('เกิดข้อผิดพลาด: $e');
  }

  // 6. การสร้าง Custom Exception
  print('\n=== 4. การสร้าง Custom Exception ===');

  try {
    checkPassword('123');
  } on PasswordTooShortException catch (e) {
    print('รหัสผ่านสั้นเกินไป: ${e.message}');
    print('ความยาวขั้นต่ำ: ${e.minLength}');
  } on PasswordNoSpecialCharException catch (e) {
    print('รหัสผ่านไม่มีอักขระพิเศษ: ${e.message}');
  } catch (e) {
    print('เกิดข้อผิดพลาดอื่นๆ: $e');
  }

  // 7. การใช้ rethrow
  print('\n=== 5. การใช้ rethrow ===');

  try {
    processNumber(-1);
  } catch (e) {
    print('จับข้อผิดพลาดภายนอก: $e');
  }

  // 8. การจัดการ Exception ใน Future
  print('\n=== 6. การจัดการ Exception ใน Future ===');

  // แบบที่ 1: ใช้ then/catchError
  // รอให้ Future ทำงานเสร็จก่อนไปขั้นตอนต่อไป
  await fetchData(-1)
      .then((data) => print('ข้อมูล: $data'))
      .catchError((e) => print('เกิดข้อผิดพลาด: $e'));

  // 9. การจัดการ Exception ด้วย async/await
  print('\n=== 7. การจัดการ Exception ด้วย async/await ===');

  // รอให้ async function ทำงานเสร็จก่อนไปขั้นตอนต่อไป
  await handleAsyncException();

  // 10. การใช้ assert ในการตรวจสอบเงื่อนไข
  print('\n=== 8. การใช้ assert ===');

  // assert จะทำงานเฉพาะใน development mode เท่านั้น
  // assert(1 > 2, 'เงื่อนไขไม่เป็นจริง');

  // 11. ตัวอย่างการใช้งานจริง: ระบบล็อกอิน
  print('\n=== 9. ตัวอย่างการใช้งานจริง: ระบบล็อกอิน ===');

  // รอให้ระบบล็อกอินทำงานเสร็จก่อนไปขั้นตอนต่อไป
  try {
    var result = await userLogin('admin', 'password123');
    print('ล็อกอินสำเร็จ: $result');
  } catch (e) {
    if (e is AuthException) {
      print('ข้อผิดพลาดการยืนยันตัวตน: ${e.message}');

      if (e is UserNotFoundException) {
        print('แนะนำ: กรุณาลงทะเบียนก่อนเข้าสู่ระบบ');
      } else if (e is InvalidPasswordException) {
        print('แนะนำ: ลองตรวจสอบรหัสผ่านอีกครั้ง หรือกดลืมรหัสผ่าน');
      }
    } else {
      print('เกิดข้อผิดพลาดในระบบ: $e');
    }
  }

  // 12. การทำ Error Handling กับ Stream
  print('\n=== 10. การทำ Error Handling กับ Stream ===');

  // รอให้การจัดการกับ Stream ทำงานเสร็จก่อนจบโปรแกรม
  await processStream();

  print('\n=== โปรแกรมทำงานเสร็จสิ้น ===');
}

// 5. การ throw Exception
void validateAge(int age) {
  if (age < 0) {
    throw Exception('อายุต้องไม่ติดลบ');
  }
  print('อายุถูกต้อง: $age');
}

void validateUsername(String username) {
  if (username.isEmpty) {
    throw FormatException('ชื่อผู้ใช้ห้ามเป็นค่าว่าง');
  }
  print('ชื่อผู้ใช้ถูกต้อง: $username');
}

// 6. การสร้าง Custom Exception
class PasswordTooShortException implements Exception {
  final String message;
  final int minLength;

  PasswordTooShortException(this.message, this.minLength);

  @override
  String toString() => 'PasswordTooShortException: $message';
}

class PasswordNoSpecialCharException implements Exception {
  final String message;

  PasswordNoSpecialCharException(this.message);

  @override
  String toString() => 'PasswordNoSpecialCharException: $message';
}

void checkPassword(String password) {
  if (password.length < 8) {
    throw PasswordTooShortException('รหัสผ่านต้องมีอย่างน้อย 8 ตัวอักษร', 8);
  }

  if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    throw PasswordNoSpecialCharException(
      'รหัสผ่านต้องมีอักขระพิเศษอย่างน้อย 1 ตัว',
    );
  }

  print('รหัสผ่านถูกต้อง');
}

// 7. การใช้ rethrow
void processNumber(int number) {
  try {
    if (number < 0) {
      throw Exception('ค่าต้องไม่ติดลบ');
    }
    print('ค่าถูกต้อง: $number');
  } catch (e) {
    print('จับข้อผิดพลาดภายใน processNumber: $e');
    rethrow; // ส่ง error ไปให้ caller จัดการต่อ
  }
}

// 8. การจัดการ Exception ใน Future
Future<String> fetchData(int id) async {
  await Future.delayed(Duration(milliseconds: 500));

  if (id < 0) {
    throw FormatException('ID ต้องไม่ติดลบ');
  }

  return 'ข้อมูลสำหรับ ID: $id';
}

// 9. การจัดการ Exception ด้วย async/await
Future<void> handleAsyncException() async {
  try {
    String data = await fetchData(-5);
    print('ข้อมูล: $data');
  } catch (e) {
    print('จับข้อผิดพลาดใน async/await: $e');
  }
}

// 11. ตัวอย่างการใช้งานจริง: ระบบล็อกอิน
// Custom Exceptions สำหรับระบบยืนยันตัวตน
class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() => 'AuthException: $message';
}

class UserNotFoundException extends AuthException {
  UserNotFoundException(super.message);
}

class InvalidPasswordException extends AuthException {
  InvalidPasswordException(super.message);
}

Future<Map<String, dynamic>> userLogin(String username, String password) async {
  await Future.delayed(Duration(milliseconds: 800));

  // จำลองการตรวจสอบฐานข้อมูล
  if (username != 'admin') {
    throw UserNotFoundException('ไม่พบผู้ใช้ $username ในระบบ');
  }

  if (password != 'admin123') {
    throw InvalidPasswordException('รหัสผ่านไม่ถูกต้อง');
  }

  // จำลองข้อมูลการล็อกอินสำเร็จ
  return {
    'userId': 1,
    'username': username,
    'lastLogin': DateTime.now().toString(),
  };
}

// 12. การทำ Error Handling กับ Stream
Future<void> processStream() async {
  // จำลอง Stream ที่อาจมี error
  Stream<int> numberStream() async* {
    for (int i = 5; i >= -1; i--) {
      await Future.delayed(Duration(milliseconds: 300));
      if (i == 0) {
        throw Exception('พบข้อผิดพลาดที่ค่า 0');
      }
      yield 100 ~/ i; // จะเกิด error เมื่อ i = 0
    }
  }

  // วิธีที่ 1: ใช้ listen กับ onError
  final completer = Completer();
  numberStream().listen(
    (data) => print('ค่าที่ได้: $data'),
    onError: (e) => print('เกิดข้อผิดพลาดใน stream: $e'),
    onDone: () {
      print('stream เสร็จสิ้น');
      completer.complete();
    },
  );

  // รอให้ stream ทำงานเสร็จ
  await completer.future;

  // วิธีที่ 2: ใช้ try-catch กับ await for
  print('\nใช้ try-catch กับ await for:');
  try {
    await for (var value in numberStream()) {
      print('ค่าที่ได้ (await for): $value');
    }
  } catch (e) {
    print('จับข้อผิดพลาดจาก stream (await for): $e');
  }
}
