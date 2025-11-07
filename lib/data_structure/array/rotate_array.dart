// เป้าหมาย: [1,2,3,4,5] → [4,5,1,2,3] (หมุน 2)

// คิดแบบนี้:
// - ต้องการให้ [4,5] มาหน้า
// - ต้องการให้ [1,2,3] ไปหลัง

// วิธีทำ:
// 1. กลับทั้งหมด: [1,2,3,4,5] → [5,4,3,2,1]
//    (ตอนนี้ 4,5 อยู่ใกล้หน้าแล้ว แต่ลำดับผิด)

// 2. กลับ k=2 ตัวแรก: [5,4,3,2,1] → [4,5,3,2,1]
//    (ตอนนี้ 4,5 อยู่หน้าและลำดับถูกแล้ว)

// 3. กลับส่วนที่เหลือ: [4,5,3,2,1] → [4,5,1,2,3]
//    (ตอนนี้ 1,2,3 อยู่หลังและลำดับถูกแล้ว)

// หมุน k = แบ่งอาร์เรย์เป็น 2 ส่วน แล้วสลับกัน

// [1,2,3,4,5] หมุน 2
// = [1,2,3] + [4,5] → [4,5] + [1,2,3]

// 3 Reverse Trick:
// 1. กลับทั้งหมด → ทำให้ส่วนที่ต้องการมาหน้า
// 2. กลับส่วนแรก → แก้ไขลำดับส่วนแรก
// 3. กลับส่วนหลัง → แก้ไขลำดับส่วนหลัง

void rotate(List<int> arr, int rotation) {
  int arrLength = arr.length;
  if (arrLength <= 1) return;

  rotation %= arrLength;
  if (rotation == 0) return; // ไม่ต้องหมุน

  _reverse(arr, 0, arrLength - 1);
  _reverse(arr, 0, rotation - 1);
  _reverse(arr, rotation, arrLength - 1);
}

void _reverse(List arr, int start, int end) {
  while (start < end) {
    // สลับค่า (swap values)
    var temp = arr[start];
    arr[start] = arr[end];
    arr[end] = temp;

    // เลื่อน pointer เข้าหากัน
    start++;
    end--;
  }
}

void main() {
  List<int> arr = [1, 2, 3, 4, 5];
  rotate(arr, 82);
  print(arr);

  List<int> arr2 = [1, 2, 3, 4, 5];
  var a = newRotate(arr2, 82);
  print(a);
}

List<int> newRotate(List<int> arr, int rotation) {
  int arrLength = arr.length;
  if (arrLength <= 1) return List.from(arr);

  rotation = rotation % arrLength;
  if (rotation == 0) return List.from(arr);

  List<int> newArr = List.filled(arrLength, 0);
  for (int i = 0; i < arrLength; i++) {
    var updatedIndex = (i + rotation) % arrLength;
    newArr[updatedIndex] = arr[i];
  }
  return newArr;
  // ✅ ทำงานได้!
  arr.setAll(0, newArr); // แทนที่ข้อมูลตั้งแต่ index 0
  //   // ✅ ทำงานได้!
  // arr.clear();        // ลบข้อมูลเดิมออกหมด
  // arr.addAll(newArr); // เพิ่มข้อมูลใหม่เข้าไป

  // // คัดลอกกลับไปยัง original array
  // for (int i = 0; i < arrLength; i++) {
  //   arr[i] = newArr[i];
  // }
}
