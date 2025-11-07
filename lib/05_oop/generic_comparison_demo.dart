// Demo เปรียบเทียบ Pre-Generic vs Post-Generic
// รันด้วย: dart run lib/05_oop/generic_comparison_demo.dart

// ===== PRE-GENERIC (แบบเก่า) =====
class BoxOld {
  Object? value;
  BoxOld(this.value);
}

// ===== POST-GENERIC (แบบใหม่) =====
class BoxNew<T> {
  T value;
  BoxNew(this.value);

  T getValue() => value;
}

void main() {
  print('=== PRE-GENERIC (แบบเก่า) ===');

  // สร้าง box เก็บ int
  final BoxOld oldIntBox = BoxOld(42);

  // ปัญหา 1: ต้อง cast เองทุกครั้ง
  if (oldIntBox.value is int) {
    final int result = (oldIntBox.value as int) + 10;
    print('Result: $result'); // 52
  }

  // ปัญหา 2: เสี่ยง runtime error
  final BoxOld oldStringBox = BoxOld('hello');
  // int wrong = oldStringBox.value as int; // จะ crash!

  print('\n=== POST-GENERIC (แบบใหม่) ===');

  // สร้าง box เก็บ int (รู้ type แน่นอน)
  final BoxNew<int> newIntBox = BoxNew<int>(42);

  // ข้อดี 1: ไม่ต้อง cast
  final int result = newIntBox.getValue() + 10;
  print('Result: $result'); // 52

  // ข้อดี 2: Compiler ช่วยเช็ค
  final BoxNew<String> newStringBox = BoxNew<String>('hello');
  final String upper = newStringBox.getValue().toUpperCase();
  print('Uppercase: $upper'); // HELLO

  // ข้อดี 3: ป้องกัน error ตั้งแต่ compile time
  // BoxNew<int> errorBox = BoxNew<int>('string'); // Compile error!
  // int wrongValue = newStringBox.getValue(); // Compile error!

  print('\n=== สรุปข้อดี Generic ===');
  print('✅ ไม่ต้อง cast (as) ทุกครั้ง');
  print('✅ Compiler ช่วยเช็ค type ตั้งแต่เขียนโค้ด');
  print('✅ ป้องกัน runtime error');
  print('✅ โค้ดอ่านง่ายและปลอดภัยกว่า');
}
