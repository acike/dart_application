// Nested List Sum - การหาผลรวมของ List ที่มี List ซ้อนกัน
// This demonstrates recursion with mixed data types (numbers and lists)

void main() {
  print('=== NESTED LIST SUM EXAMPLE ===\n');

  // ตัวอย่างการใช้งาน - Example usage
  List<dynamic> myNumbers = [
    1,
    2,
    [3, 4],
    5,
    [
      6,
      [7],
    ],
  ]; // ผลรวมที่คาดหวังคือ 28

  print('Original list: $myNumbers');
  print('Expected sum: 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28\n');

  int sumResult = findTotal(myNumbers);
  print('ผลรวมทั้งหมดคือ: $sumResult');

  // ทดสอบกับตัวอย่างอื่น - Test with other examples
  print('\n=== MORE EXAMPLES ===');

  List<dynamic> example1 = [
    1,
    [2, 3],
    4,
  ];
  print('$example1 → ${findTotal(example1)}');

  List<dynamic> example2 = [
    [1, 2],
    [
      3,
      [4, 5],
    ],
  ];
  print('$example2 → ${findTotal(example2)}');

  List<dynamic> example3 = [10];
  print('$example3 → ${findTotal(example3)}');

  List<dynamic> example4 = [
    1,
    [
      2,
      [
        3,
        [4],
      ],
    ],
  ];
  print('$example4 → ${findTotal(example4)}');
}

// ฟังก์ชันหาผลรวมของ List ที่มี List ซ้อนกัน
// Function to find total sum of nested lists
int findTotal(List<dynamic> aList) {
  int total = 0;

  // วนลูปผ่านทุกไอเท็มใน list
  // Loop through every item in the list
  for (var item in aList) {
    // ตรวจสอบว่าสิ่งที่เจอเป็น 'ลิสต์' หรือไม่
    // Check if the item we found is a 'list' or not
    if (item is List) {
      // Recursive Case: ถ้าใช่ ก็เรียกตัวเองให้ไปหาผลรวมของลิสต์ย่อยนั้น
      // Recursive Case: If yes, call ourselves to find sum of that sub-list
      print('  🔄 Found nested list: $item, calling findTotal recursively...');
      total += findTotal(item);
    } else {
      // Base Case: ถ้าไม่ใช่ (เป็นตัวเลข) ก็บวกค่าได้เลย
      // Base Case: If not (it's a number), just add the value
      print('  ➕ Found number: $item, adding to total');
      total += item as int;
    }
  }

  print('  📊 Returning total888: $total');
  return total;
}

// เวอร์ชันที่ไม่มี print statements สำหรับการใช้งานจริง
// Clean version without print statements for actual use
int findTotalClean(List<dynamic> aList) {
  int total = 0;

  for (var item in aList) {
    if (item is List) {
      // Recursive Case: เรียกตัวเองสำหรับ nested list
      total += findTotalClean(item.cast<dynamic>());
    } else {
      // Base Case: บวกตัวเลข
      total += item as int;
    }
  }

  return total;
}

// ฟังก์ชันเสริม: แปลง nested list เป็น flat list
// Bonus function: Convert nested list to flat list
List<int> flattenList(List<dynamic> nestedList) {
  List<int> result = [];

  for (var item in nestedList) {
    if (item is List) {
      // Recursive Case: รวม result ของ nested list
      result.addAll(flattenList(item));
    } else {
      // Base Case: เพิ่มตัวเลขลงใน result
      result.add(item as int);
    }
  }

  return result;
}
