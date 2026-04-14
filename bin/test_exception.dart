void main() {
  testExceptions();
}

void testExceptions() {
  // Case 1: Uncaught Exception
  // print(10 ~/ 0); // ❌ Crash! ไม่มี try-catch

  // Case 2: Caught Exception
  try {
    print(10 ~/ 0);
  } catch (e) {
    print('Handled!'); // ✅ จัดการแล้ว ไม่ crash
  }
}
