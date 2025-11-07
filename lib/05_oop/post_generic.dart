class Box<T> {
  // <T> คือ Type Parameter
  T value; // ใช้ T แทนประเภทข้อมูล

  Box(this.value);

  T getValue() {
    return value;
  }
}

void main() {
  // ตอนสร้าง Box เรากำหนดเลยว่า T จะเป็น int
  var intBox = Box<int>(123);
  int intValue = intBox.getValue(); // ได้ int ออกมาเลย ไม่ต้อง cast
  print(intValue + 1); // ใช้งานได้ทันที

  // กำหนดให้ T เป็น String
  var stringBox = Box<String>('hello3');
  String stringValue = stringBox.getValue(); // ได้ String ออกมาเลย
  print(stringValue.toUpperCase());
  // final test = Result('value');
  // print(test.isSuccess);
  // print(test.isFailure);

  // final test2 = Result('error');

  // print(test2.isSuccess);
  // print(test2.isFailure);
  // Compiler จะช่วยเช็ค Type ให้ตั้งแต่ตอนเขียนโค้ด
  // Box<int> wrongBox = Box<int>('cannot put string here'); // Compile Error!
  // int wrongValue = stringBox.getValue(); // Compile Error! ไม่สามารถแปลง String เป็น int
}
