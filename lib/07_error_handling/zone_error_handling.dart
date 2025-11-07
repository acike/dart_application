// การจัดการข้อผิดพลาดขั้นสูงด้วย Zone
import 'dart:async';

void main() {
  print('=== การจัดการข้อผิดพลาดขั้นสูงด้วย Zone ===');

  // 1. การใช้ runZoned พื้นฐาน
  print('\n--- 1. การใช้ runZoned พื้นฐาน ---');

  // สร้าง Zone แยกต่างหาก
  runZoned(
    () {
      print('โค้ดกำลังทำงานใน Zone แยก');

      // จำลองการเกิด error
      throw Exception('เกิดข้อผิดพลาดขึ้นใน Zone');
    },
    onError: (error, stackTrace) {
      // จับ error ที่เกิดขึ้นใน Zone นี้
      print('Zone จับข้อผิดพลาดได้: $error');
      print('Stack trace: $stackTrace');
    },
  );

  print('โปรแกรมยังทำงานต่อได้แม้เกิด error ใน Zone');

  // 2. การใช้ ZoneSpecification
  print('\n--- 2. การใช้ ZoneSpecification ---');

  // สร้าง Zone พร้อมกำหนดพฤติกรรมเฉพาะ
  runZoned(
    () {
      print('กำลังทำงานใน Zone ที่มีการปรับแต่ง');
      print('ข้อความนี้จะถูกเปลี่ยน');

      // จำลองการใช้งาน Future ใน Zone
      Future.delayed(Duration(milliseconds: 100), () {
        print('ข้อความจาก Future');
        throw Exception('Error จาก Future');
      });
    },
    zoneSpecification: ZoneSpecification(
      // ดักจับการเรียก print แล้วเปลี่ยนข้อความ
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        parent.print(zone, '🔹 $line');
      },
      // ดักจับ error
      handleUncaughtError: (
        Zone self,
        ZoneDelegate parent,
        Zone zone,
        Object error,
        StackTrace stackTrace,
      ) {
        print('🔴 Zone จับ error ได้: $error');
      },
    ),
  );

  // รอให้ Future ทำงานเสร็จ
  Future.delayed(Duration(milliseconds: 200), () {
    // 3. การสร้าง Zone Values
    print('\n--- 3. การใช้ Zone Values ---');

    // สร้าง Zone ที่มีค่าเก็บไว้ภายใน
    runZoned(() {
      // เข้าถึงค่าที่เก็บใน Zone
      String? userId = Zone.current[#userId] as String?;
      String? sessionId = Zone.current[#sessionId] as String?;

      print('User ID: $userId');
      print('Session ID: $sessionId');

      // ฟังก์ชันที่ทำงานใน Zone จะเข้าถึงค่าได้อัตโนมัติ
      performOperationInZone();
    }, zoneValues: {#userId: 'user123', #sessionId: 'sess_abc456'});

    // 4. การใช้ Zone กับ asynchronous code
    print('\n--- 4. การใช้ Zone กับ asynchronous code ---');

    // สร้าง Zone ที่ track ตลอดการทำงานแบบ async
    runZoned(
      () async {
        print('เริ่มต้นการทำงานแบบ async');

        try {
          await performAsyncOperation(1);
          await performAsyncOperation(0); // จะเกิด error
        } catch (e) {
          print('Try-catch จับ error ได้: $e');
        }

        await performAsyncOperation(-1); // จะเกิด error แต่ไม่มี try-catch

        print('บรรทัดนี้จะไม่ถูกทำงานเพราะเกิด error ก่อนหน้านี้');
      },
      onError: (error, stackTrace) {
        print('Zone จับ uncaught error จาก async: $error');
      },
    );

    // 5. ตัวอย่างการใช้งานจริง: การจัดการ error ในแอปพลิเคชัน
    print('\n--- 5. ตัวอย่างการใช้งานจริง: จัดการ error ในแอปพลิเคชัน ---');

    runApp();
  });
}

// 3. การใช้ Zone Values
void performOperationInZone() {
  // เข้าถึงค่าจาก Zone ปัจจุบัน
  String? userId = Zone.current[#userId] as String?;
  print('กำลังทำงานกับผู้ใช้: $userId');

  // ค่า Zone value จะถูกส่งต่อไปอัตโนมัติแม้อยู่ใน Future
  Future.delayed(Duration(milliseconds: 10), () {
    String? sessionId = Zone.current[#sessionId] as String?;
    print('Session ID ใน Future: $sessionId');
  });
}

// 4. การใช้ Zone กับ asynchronous code
Future<int> performAsyncOperation(int value) async {
  await Future.delayed(Duration(milliseconds: 50));

  if (value < 0) {
    throw Exception('ค่าต้องไม่น้อยกว่า 0');
  }

  print('กำลังคำนวณ 100 หารด้วย $value');
  return 100 ~/ value; // จะเกิด error เมื่อ value = 0
}

// 5. ตัวอย่างการใช้งานจริง: การจัดการ error ในแอปพลิเคชัน
void runApp() {
  // สร้าง Zone ที่ครอบคลุมทั้งแอปพลิเคชัน
  runZonedGuarded(
    () {
      print('เริ่มต้นแอปพลิเคชัน...');

      // จำลองการทำงานของ UI และการเรียก API
      simulateAppFlow();
    },
    (error, stackTrace) {
      // Global error handler
      print('🚨 พบข้อผิดพลาดในแอป: $error');

      // จำลองการเก็บ log หรือส่งรายงานข้อผิดพลาด
      reportErrorToService(error, stackTrace);
    },
  );
}

void simulateAppFlow() {
  print('กำลังแสดงหน้าจอหลัก');

  // จำลองการกดปุ่มใน UI ที่ทำให้เรียก API
  print('ผู้ใช้กดปุ่มโหลดข้อมูล');

  // จำลองการเรียก API ที่มีปัญหา
  Future.delayed(Duration(milliseconds: 100), () {
    print('กำลังโหลดข้อมูล...');

    // จำลองการเกิด error จากการเรียก API
    throw Exception('ไม่สามารถเชื่อมต่อกับเซิร์ฟเวอร์ได้');
  });

  print('แสดงสถานะกำลังโหลด...');
}

void reportErrorToService(Object error, StackTrace stackTrace) {
  // จำลองการส่งรายงานข้อผิดพลาดไปยังบริการเก็บ log เช่น Firebase Crashlytics, Sentry
  print('ส่งรายงานข้อผิดพลาดไปยังระบบ...');
  print('ข้อผิดพลาด: $error');
  print('Stack trace: ${stackTrace.toString().split('\n').first}...');

  // จำลองการแสดงข้อความแจ้งเตือนผู้ใช้
  print(
    'แสดงข้อความแจ้งเตือนผู้ใช้: "มีข้อผิดพลาดเกิดขึ้น กรุณาลองใหม่อีกครั้ง"',
  );
}
