Iterable<List<String>> paginate(List<String> items, int pageSize) sync* {
  int total = items.length;
  for (int i = 0; i < total; i += pageSize) {
    yield items.sublist(i, i + pageSize > total ? total : i + pageSize);
  }
}

Iterable<int> generatePageIndexes(int count) sync* {
  for (int i = 1; i <= count; i++) {
    yield i;
  }
}

Iterable<String> labeledPages(int totalPages) sync* {
  yield* generatePageIndexes(totalPages).map((i) => 'Page $i');
}

void main() {
  for (var label in labeledPages(5)) {
    print(label);
  }
  var data = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grapes',
    'Honeydew',
  ];

  var pages = paginate(data, 3);

  for (var page in pages) {
    print('Page: $page');
  }
}
// # วิธีอ่าน Code เรื่อง Iterable แบบเข้าใจง่าย

// ## 1. ฟังก์ชั่น `paginate` ขั้นตอนต่อขั้น

// ```dart
// Iterable<List<String>> paginate(List<String> items, int pageSize) sync* {
//   int total = items.length;
//   for (int i = 0; i < total; i += pageSize) {
//     yield items.sublist(i, i + pageSize > total ? total : i + pageSize);
//   }
// }
// ```

// แบบเข้าใจง่าย:
// 1. **ชื่อฟังก์ชั่น**: `paginate` รับข้อมูล 2 อย่าง
//    - `items` = รายการข้อมูลทั้งหมด (เช่น ผลไม้ 8 ชนิด)
//    - `pageSize` = ขนาดของแต่ละหน้า (เช่น 5 ชิ้นต่อหน้า)

// 2. **การคืนค่า**: 
//    - `Iterable<List<String>>` = คืนค่าเป็นชุดข้อมูลของรายการ (หรือหน้า)
//    - `sync*` = บอกว่าทำงานแบบ generator (ส่งทีละหน้า)

// 3. **ตัวแปร**:
//    - `total` = จำนวนรายการทั้งหมด (จากตัวอย่าง = 8)

// 4. **ลูป for**:
//    - เริ่มที่ i = 0
//    - ทำไปเรื่อยๆ จนกว่า i จะมากกว่าหรือเท่ากับ total
//    - หลังจบแต่ละรอบ เพิ่ม i ทีละ pageSize (ข้ามทีละหน้า)

// 5. **คำสั่ง yield**:
//    - `items.sublist(i, i + pageSize > total ? total : i + pageSize)`
//    - ตัดส่วนหนึ่งของรายการ เริ่มจากตำแหน่ง i
//    - ถ้าตำแหน่งสุดท้าย (i + pageSize) เกินจำนวนทั้งหมด ให้ใช้ total แทน

// ## 2. การใช้งานฟังก์ชั่น `paginate`

// ```dart
// var data = [
//   'Apple',
//   'Banana',
//   'Cherry',
//   'Date',
//   'Elderberry',
//   'Fig',
//   'Grapes',
//   'Honeydew',
// ];

// var pages = paginate(data, 5);

// for (var page in pages) {
//   print('Page: $page');
// }
// ```

// แบบเข้าใจง่าย:
// 1. สร้างรายการผลไม้ 8 ชนิด (`data`)
// 2. เรียกใช้ฟังก์ชั่น `paginate` โดยแบ่งเป็นหน้าละ 5 ชิ้น
// 3. วนลูปแสดงข้อมูลทีละหน้า

// ## 3. การทำงานทีละขั้นตอน (ตามลำดับการทำงาน)

// 1. เรียกฟังก์ชั่น `paginate(data, 5)`
//    - ข้อมูล = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry', 'Fig', 'Grapes', 'Honeydew']
//    - ขนาดหน้า = 5

// 2. ภายในฟังก์ชั่น `paginate`:
//    - `total` = 8 (มีผลไม้ 8 ชนิด)
   
// 3. รอบที่ 1 ของลูป:
//    - i = 0
//    - ตัด sublist(0, 5) = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry']
//    - ส่งข้อมูลชุดนี้กลับไปด้วย `yield`
//    - เพิ่ม i เป็น 5

// 4. รอบที่ 2 ของลูป:
//    - i = 5
//    - ตัด sublist(5, 8) = ['Fig', 'Grapes', 'Honeydew']
//    - ใช้ 8 แทน (5+5=10) เพราะขนาดเกิน total
//    - ส่งข้อมูลชุดนี้กลับไปด้วย `yield`
//    - เพิ่ม i เป็น 10

// 5. จบลูป (เพราะ i = 10 ซึ่งมากกว่า total = 8)

// 6. ในส่วนของการใช้งาน:
//    - `var pages = paginate(data, 5)` สร้าง Iterable แต่ยังไม่ได้เริ่มทำงาน
//    - เมื่อวนลูป `for (var page in pages)` เริ่มเรียกใช้ generator
//    - แสดง `Page: [Apple, Banana, Cherry, Date, Elderberry]`
//    - แสดง `Page: [Fig, Grapes, Honeydew]`

// ## ข้อดีของการใช้ Iterable แบบนี้

// 1. **ประหยัดหน่วยความจำ** - ไม่ต้องสร้างรายการทั้งหมดพร้อมกัน
// 2. **ทำงานแบบทันที** - ได้ข้อมูลหน้าแรกทันทีโดยไม่ต้องรอคำนวณทั้งหมด
// 3. **ทำงานแบบต่อเนื่อง** - เมื่อเรียกเอาข้อมูลหน้าถัดไป จึงค่อยคำนวณหน้านั้น

// คิดเป็นภาพง่ายๆ คือแทนที่จะแบ่งขนมทั้งหมดใส่จานให้เสร็จก่อนแล้วค่อยเสิร์ฟ แต่เป็นการตักขนมลงจานแรกให้ก่อน แล้วส่งไปเสิร์ฟก่อน จากนั้นค่อยมาตักจานถัดไป
