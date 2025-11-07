class Box {
  Object? value; // เก็บอะไรก็ได้เป็น Object

  Box(this.value);
}

void main() {
  var box = Box(123); // เก็บ int
  var box2 = Box('hello'); // เก็บ String

  // ปัญหา: ตอนเอาค่าออกมา ต้องเช็ค type และ cast เองตลอด
  if (box.value is int) {
    int intValue = box.value as int;
    print(intValue + 1); // ต้อง cast ก่อนถึงจะใช้ + ได้
  }

  if (box2.value is String) {
    String stringValue = box2.value as String;
    print(
      stringValue.toUpperCase(),
    ); // ต้อง cast ก่อนถึงจะเรียก toUpperCase() ได้
  }

  var box3 = Box(true);
  // ถ้าเผลอเอาค่าจาก box3 มา cast เป็น int จะเกิด runtime error!
  // int wrongValue = box3.value as int; // Runtime Error!
}
