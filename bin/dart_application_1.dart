import 'package:dart_application_1/data_structure/sort/sort.dart';

final customers = ['ike', 'bob', 'john'];

// กรณี 1: ต้องการแสดงชื่อตัวใหญ่ทันที
void showCustomerNames() {
  // ใช้ .toList() เพราะต้องการผลลัพธ์ทันที
  final upperNames = customers.map((name) => name.toUpperCase()).toList();
  log('[1]: ${upperNames[1]}');
  print('ลูกค้าทั้งหมด: $upperNames');
  // ผลลัพธ์: ลูกค้าทั้งหมด: [IKE, BOB, JOHN]
}

// กรณี 2: ต้องการแสดงชื่อทีละคน
void showCustomersOneByOne() {
  // ไม่ใช้ .toList() เพราะต้องการประมวลผลทีละรายการ
  final upperNames = customers.map((name) => name.toUpperCase());

  for (var name in upperNames) {
    print('ยินดีต้อนรับ $name');
    // ผลลัพธ์:
    // ยินดีต้อนรับ IKE
    // ยินดีต้อนรับ BOB
    // ยินดีต้อนรับ JOHN
  }
}

void add(int a, [int? b]) {
  // b is optional
  print(a + (b ?? 0));
}

void main() {
  add(1);
  add(1, 2);

  final original = [1, 2, 3];
  final copy = List<int>.from(original); // คัดลอก
  final reference = original; // ชี้ไปที่เดียวกัน

  print('=== Reference Comparison (==) ===');
  print('copy == original: ${copy == original}'); // false
  print('reference == original: ${reference == original}'); // true

  print('=== Memory Address (identical) ===');
  print('identical(copy, original): ${identical(copy, original)}'); // false
  print(
    'identical(reference, original): ${identical(reference, original)}',
  ); // true

  print('=== Content Comparison (custom function) ===');
  print('listsEqual(copy, original): ${listsEqual(copy, original)}'); // true
  print(
    'listsEqual(reference, original): ${listsEqual(reference, original)}',
  ); // true
  int a = 6; // 0110
  int b = 5; // 0101

  print(a & b); // 0100 → 4
  print(a | b);

  var times2 = Multiplier(30);
  print(times2(5)); // 10

  // 1. ประกาศเป็น function
  String toUpper(String s) => s.toUpperCase();

  // 2. ประกาศเป็น variable
  String toUpperVar(String s) => s.toUpperCase();

  // 3. ใช้โดยตรง
  final result1 = toUpper('ike'); // ใช้ function
  final result2 = toUpperVar('ike'); // ใช้ variable
  final result3 = 'ike'.toUpperCase(); // ใช้ method โดยตรง

  // print(result1);
  // print(result2);
  // print(result3);
  // var names = ['ike', 'bob'];
  // var upper = names.map((s) => s.toUpperCase()).toList();
  // print(upper);

  // String toUpper(String s) => s.toUpperCase();
  // var upper2 = names.map(toUpper).toList();
  // print(upper2);

  // showCustomerNames();
  // showCustomersOneByOne();
  // var names = ['ike', 'bob'];
  // var upper =
  //     names.map(
  //       // (s) => s.toUpperCase() // change to return pattern
  //       // สามารถเขียนได้อีกแบบคือ
  //       (s) {
  //         return s.toUpperCase();
  //       },
  //     ).toList();

  // print(upper);

  // log('Hello, Fn!');
  // // Primitive Types
  // final a = 5;
  // final b = 5;
  // print(identical(a, b)); // true

  // // Objects
  // final list1 = [1, 2, 3];
  // final list2 = [1, 2, 3];
  // print(identical(list1, list2)); // false

  // // ถ้าใช้ const จะได้ผลต่างกัน
  // const list3 = [1, 2, 3];
  // const list4 = [1, 2, 3];
  // print(identical(list3, list4)); // true
}

// create function for print below
void printHello(int i) {
  print('Hello world: $i!');
}

void log(String message) {
  print(message);
}

class Multiplier {
  int factor;
  Multiplier(this.factor);

  int call(int x) => x * factor;
}
