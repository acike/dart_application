// การใช้งาน async และ await ใน Dart
import 'dart:async';

void main() async {
  print('=== 1. Future พื้นฐาน ===');
  // 1. สร้าง Future พื้นฐาน
  Future<String> getMessage() {
    return Future.delayed(Duration(seconds: 2), () {
      return 'สวัสดี จาก Future';
    });
  }

  print('เริ่มต้นโปรแกรม');

  // แบบที่ 1: ใช้ .then()
  getMessage().then((message) {
    print('ข้อความที่ได้: $message');
  });

  print('โปรแกรมทำงานต่อไป...');

  // 2. การใช้ async/await
  print('\n=== 2. การใช้ async/await ===');
  print('รอข้อความ...');

  // แบบที่ 2: ใช้ await (ต้องอยู่ใน async function)
  String message = await getMessage();
  print('ข้อความที่ได้ (จาก await): $message');

  // 3. การจัดการ Error ใน Future
  print('\n=== 3. การจัดการ Error ===');

  Future<String> getMessageWithError() {
    return Future.delayed(Duration(seconds: 1), () {
      // จำลองเกิด error
      throw Exception('มีข้อผิดพลาดเกิดขึ้น!');
    });
  }

  // แบบที่ 1: ใช้ .catchError()
  getMessageWithError()
      .then((value) => print('ข้อความ: $value'))
      .catchError((error) => print('เกิด error: $error'));

  // แบบที่ 2: ใช้ try-catch กับ await
  try {
    await getMessageWithError();
  } catch (e) {
    print('จับ error ด้วย try-catch: $e');
  }

  // 4. การทำงานกับ Future หลาย ๆ ตัวพร้อมกัน
  print('\n=== 4. การทำงานกับ Future หลาย ๆ ตัว ===');

  Future<String> getUser() =>
      Future.delayed(Duration(seconds: 1), () => 'สมชาย');

  Future<int> getAge() => Future.delayed(Duration(seconds: 2), () => 30);

  Future<String> getAddress() =>
      Future.delayed(Duration(seconds: 1), () => 'กรุงเทพฯ');

  // 4.1 Future.wait - รอให้ทุก Future เสร็จสิ้น
  print('รอข้อมูลผู้ใช้ทั้งหมด...');
  var results = await Future.wait([getUser(), getAge(), getAddress()]);

  print('ชื่อ: ${results[0]}');
  print('อายุ: ${results[1]}');
  print('ที่อยู่: ${results[2]}');

  // 5. Completer - สร้าง Future เองแบบกำหนดเอง
  print('\n=== 5. Completer ===');

  Future<int> calculateTotal() {
    var completer = Completer<int>();

    // จำลองการคำนวณที่ซับซ้อน
    Timer(Duration(seconds: 2), () {
      int total = 0;
      for (int i = 1; i <= 100; i++) {
        total += i;
      }

      if (total > 0) {
        completer.complete(total);
      } else {
        completer.completeError('การคำนวณล้มเหลว');
      }
    });

    return completer.future;
  }

  print('กำลังคำนวณผลรวม...');
  int total = await calculateTotal();
  print('ผลรวมของเลข 1 ถึง 100: $total');

  // 6. Stream - ลำดับข้อมูลที่ทยอยส่ง
  print('\n=== 6. Stream พื้นฐาน ===');

  // 6.1 สร้าง Stream จาก StreamController
  final controller = StreamController<int>();

  // สมัครรับข้อมูล
  controller.stream.listen(
    (data) => print('ได้รับข้อมูล: $data'),
    onError: (error) => print('เกิด error: $error'),
    onDone: () => print('Stream สิ้นสุดแล้ว'),
  );

  // ส่งข้อมูลเข้า Stream
  controller.add(1);
  controller.add(2);
  controller.add(3);

  // เกิด error
  controller.addError('มีปัญหาบางอย่าง');

  // ส่งข้อมูลเพิ่ม
  controller.add(4);
  controller.add(5);

  // ปิด controller เมื่อเสร็จสิ้น
  await Future.delayed(Duration(seconds: 1));
  await controller.close();

  // 6.2 Stream.periodic - สร้าง Stream ที่ส่งข้อมูลตามช่วงเวลา
  print('\n=== 7. Stream.periodic ===');

  print('เริ่มต้นนับถอยหลัง...');

  // สร้าง Stream ที่นับถอยหลังจาก 10 ถึง 1 ทุก 500 ms
  Stream<int> countdownStream = Stream.periodic(
    Duration(milliseconds: 500),
    (count) => 10 - count,
  ).take(10); // เอาแค่ 10 ค่าแรก

  // สมัครรับข้อมูล
  await for (var i in countdownStream) {
    print('เหลือเวลา: $i วินาที');
  }

  print('หมดเวลา!');

  // 8. ตัวอย่างการใช้งานจริง
  print('\n=== 8. ตัวอย่างการใช้งานจริง: จำลองการโหลดข้อมูลผู้ใช้ ===');

  // จำลองการโหลดข้อมูลผู้ใช้จากฐานข้อมูล
  Future<Map<String, dynamic>> loadUserProfile(int userId) async {
    print('กำลังโหลดข้อมูลผู้ใช้ ID: $userId...');

    // จำลองการเชื่อมต่อกับฐานข้อมูล
    await Future.delayed(Duration(seconds: 2));

    // จำลองข้อมูลจากฐานข้อมูล
    return {
      'id': userId,
      'name': 'สมชาย ใจดี',
      'age': 30,
      'email': 'somchai@example.com',
    };
  }

  // จำลองการโหลดประวัติการสั่งซื้อของผู้ใช้
  Future<List<Map<String, dynamic>>> loadUserOrders(int userId) async {
    print('กำลังโหลดประวัติการสั่งซื้อสำหรับผู้ใช้ ID: $userId...');

    // จำลองการเชื่อมต่อกับฐานข้อมูล
    await Future.delayed(Duration(seconds: 3));

    // จำลองข้อมูลจากฐานข้อมูล
    return [
      {'id': 1001, 'product': 'สมาร์ทโฟน', 'price': 15000},
      {'id': 1002, 'product': 'แล็ปท็อป', 'price': 35000},
      {'id': 1003, 'product': 'หูฟัง', 'price': 2500},
    ];
  }

  // จำลองแอปพลิเคชันที่ต้องโหลดข้อมูลผู้ใช้และประวัติการสั่งซื้อ
  Future<void> loadUserData() async {
    try {
      final userId = 12345;

      // โหลดข้อมูลทั้งสองอย่างพร้อมกัน
      // เริ่มจับเวลา (Start timer)
      final stopwatch = Stopwatch()..start();

      final results = await Future.wait([
        loadUserProfile(userId),
        loadUserOrders(userId),
      ]);

      // หยุดจับเวลา (Stop timer)
      stopwatch.stop();
      print(
        'เวลาที่ใช้ในการโหลดข้อมูล: ${stopwatch.elapsedMilliseconds} มิลลิวินาที',
      );

      final userProfile = results[0] as Map<String, dynamic>;
      final userOrders = results[1] as List<Map<String, dynamic>>;

      // แสดงข้อมูลที่โหลดมาได้
      print('\nข้อมูลผู้ใช้:');
      print('ชื่อ: ${userProfile['name']}');
      print('อายุ: ${userProfile['age']}');
      print('อีเมล: ${userProfile['email']}');

      print('\nประวัติการสั่งซื้อ:');
      double totalSpent = 0;

      for (var order in userOrders) {
        print(
          'รหัสคำสั่งซื้อ ${order['id']}: ${order['product']} - ${order['price']} บาท',
        );
        totalSpent += order['price'] as double;
      }

      print('\nยอดรวมทั้งหมด: $totalSpent บาท');
    } catch (e) {
      print('เกิดข้อผิดพลาดในการโหลดข้อมูล: $e');
    }
  }

  // เรียกใช้ฟังก์ชัน
  await loadUserData();

  print('\nโปรแกรมสิ้นสุดการทำงาน');
}
