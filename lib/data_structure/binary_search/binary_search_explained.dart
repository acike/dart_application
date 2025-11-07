/// 🔍 Binary Search Code Explanation
/// อธิบายโค้ด Binary Search ทีละบรรทัด
library;

void main() {
  print('=== 🔍 Binary Search Code Explanation ===\n');

  // 1. ทดสอบกับตัวอย่างจริง
  print('🧪 1. Testing with Real Example');
  testBinarySearch();

  // 2. อธิบายทีละบรรทัด
  print('\n📖 2. Line by Line Explanation');
  explainEachLine();

  // 3. ทำไมใช้สูตรนี้
  print('\n🤔 3. Why This Formula?');
  explainFormulas();

  // 4. Edge Cases
  print('\n⚠️ 4. Edge Cases & Common Mistakes');
  testEdgeCases();
}

// ==================== Original Binary Search ====================

int binarySearch(List<int> arr, int target) {
  // บรรทัดที่ 1: ตั้งค่าเริ่มต้น
  int left = 0, right = arr.length - 1;

  // บรรทัดที่ 2: วนลูปจนกว่าจะหมดพื้นที่ค้นหา
  while (left <= right) {
    // บรรทัดที่ 3: คำนวณตำแหน่งกลาง
    int mid = left + (right - left) ~/ 2;

    // บรรทัดที่ 4: เจอแล้ว!
    if (arr[mid] == target) return mid;

    // บรรทัดที่ 5-6: target อยู่ฝั่งขวา
    if (arr[mid] < target) {
      left = mid + 1;
    } else {
      // บรรทัดที่ 7-8: target อยู่ฝั่งซ้าย
      right = mid - 1;
    }
  }

  // บรรทัดที่ 9: ไม่เจอ
  return -1;
}

// ==================== Testing with Real Example ====================

void testBinarySearch() {
  List<int> arr = [2, 5, 8, 12, 16, 23, 38, 45, 56, 67, 78];
  int target = 23;

  print('  Array: $arr');
  print('  Target: $target');
  print('  Array Length: ${arr.length}');
  print('');

  int result = binarySearchWithExplanation(arr, target);
  print('  🎯 Final Result: Index $result');
  if (result != -1) {
    print('  ✅ Found: arr[$result] = ${arr[result]}');
  }
}

int binarySearchWithExplanation(List<int> arr, int target) {
  print('  📋 Step-by-Step Execution:');
  print('');

  // บรรทัดที่ 1: ตั้งค่าเริ่มต้น
  int left = 0, right = arr.length - 1;
  print('  🎬 Initialize:');
  print('    left = 0 (first index)');
  print('    right = ${arr.length - 1} (last index)');
  print('    Search range: index $left to $right');
  print('');

  int step = 1;

  // บรรทัดที่ 2: วนลูปจนกว่าจะหมดพื้นที่ค้นหา
  while (left <= right) {
    print('  🔄 Step $step:');
    print('    Current range: left=$left, right=$right');
    print(
      '    Condition: left <= right? → $left <= $right? → ${left <= right}',
    );

    if (left > right) {
      print('    ❌ Range invalid, stop searching');
      break;
    }

    // บรรทัดที่ 3: คำนวณตำแหน่งกลาง
    int mid = left + (right - left) ~/ 2;
    print('    Calculate mid: left + (right - left) ~/ 2');
    print('    mid = $left + ($right - $left) ~/ 2');
    print('    mid = $left + ${right - left} ~/ 2');
    print('    mid = $left + ${(right - left) ~/ 2}');
    print('    mid = $mid');
    print('    arr[mid] = arr[$mid] = ${arr[mid]}');
    print('');

    // สร้าง visual representation
    printArrayVisualization(arr, left, right, mid, target);
    print('');

    // บรรทัดที่ 4: เจอแล้ว!
    if (arr[mid] == target) {
      print('    🎉 arr[$mid] == $target → Found!');
      print('    return $mid');
      return mid;
    }

    // บรรทัดที่ 5-8: เปรียบเทียบและเลือกทิศทาง
    if (arr[mid] < target) {
      print('    📊 Compare: ${arr[mid]} < $target');
      print('    💡 Target is larger → Search RIGHT half');
      print('    ➡️  Update: left = mid + 1 = $mid + 1 = ${mid + 1}');
      left = mid + 1;
    } else {
      print('    📊 Compare: ${arr[mid]} > $target');
      print('    💡 Target is smaller → Search LEFT half');
      print('    ⬅️  Update: right = mid - 1 = $mid - 1 = ${mid - 1}');
      right = mid - 1;
    }

    print('    🔄 New range: left=$left, right=$right');
    print('');
    step++;
  }

  // บรรทัดที่ 9: ไม่เจอ
  print('  ❌ Loop ended: left > right');
  print('  return -1 (not found)');
  return -1;
}

void printArrayVisualization(
  List<int> arr,
  int left,
  int right,
  int mid,
  int target,
) {
  print('    🎨 Visual:');
  List<String> visual = [];

  for (int i = 0; i < arr.length; i++) {
    if (i < left || i > right) {
      visual.add('   '); // นอกขอบเขต
    } else if (i == mid) {
      visual.add('[${arr[i].toString().padLeft(2)}]'); // ตำแหน่งกลาง
    } else {
      visual.add(' ${arr[i].toString().padLeft(2)} '); // ในขอบเขต
    }
  }

  print(
    '    Index: ${List.generate(arr.length, (i) => i.toString().padLeft(4)).join('')}',
  );
  print('    Array: ${visual.join('')}');
  print(
    '    Range: ${' ' * (left * 4)}${'↑'.padRight((right - left + 1) * 4 - 1)}↑',
  );
  print(
    '           ${' ' * (left * 4)}left${' ' * ((right - left) * 4 - 9)}right',
  );
  print('    Mid:   ${' ' * (mid * 4)}↑');
  print('           ${' ' * (mid * 4)}${arr[mid]} vs $target');
}

// ==================== Line by Line Explanation ====================

void explainEachLine() {
  print('  📖 Line by Line Breakdown:');
  print('');

  print('  Line 1: int left = 0, right = arr.length - 1;');
  print('    🎯 Purpose: กำหนดขอบเขตการค้นหา');
  print('    💡 left = ตำแหน่งซ้ายสุด (index 0)');
  print('    💡 right = ตำแหน่งขวาสุด (index สุดท้าย)');
  print('    ✅ Valid range: [left, right] inclusive');
  print('');

  print('  Line 2: while (left <= right)');
  print('    🎯 Purpose: วนลูปจนกว่าจะหมดพื้นที่ค้นหา');
  print('    💡 left <= right = ยังมีพื้นที่ค้นหาอยู่');
  print('    💡 left > right = ไม่มีพื้นที่แล้ว (ไม่เจอ)');
  print('    ⚠️  Important: ใช้ <= ไม่ใช่ < เพราะต้องรวม right ด้วย');
  print('');

  print('  Line 3: int mid = left + (right - left) ~/ 2;');
  print('    🎯 Purpose: หาตำแหน่งกลางของพื้นที่ค้นหา');
  print('    💡 ~/ = integer division (หารปัดลง)');
  print('    🔍 Why not (left + right) ~/ 2?');
  print('      → ป้องกัน integer overflow ใน language อื่น');
  print('      → ใน Dart ไม่มีปัญหา แต่เป็น best practice');
  print('');

  print('  Line 4: if (arr[mid] == target) return mid;');
  print('    🎯 Purpose: เช็คว่าเจอ target หรือยัง');
  print('    💡 เจอแล้ว → ส่งคืน index ทันที');
  print('    ✅ Success case: algorithm ลงตัว');
  print('');

  print('  Lines 5-6: if (arr[mid] < target) left = mid + 1;');
  print('    🎯 Purpose: target อยู่ฝั่งขวา');
  print('    💡 arr[mid] < target → target ใหญ่กว่า');
  print('    ➡️  ตัด left half ทิ้ง, ค้นหาใน right half');
  print('    🔢 mid + 1 = เริ่มหาจากถัดจาก mid');
  print('');

  print('  Lines 7-8: else right = mid - 1;');
  print('    🎯 Purpose: target อยู่ฝั่งซ้าย');
  print('    💡 arr[mid] > target → target เล็กกว่า');
  print('    ⬅️  ตัด right half ทิ้ง, ค้นหาใน left half');
  print('    🔢 mid - 1 = หาถึงก่อนหน้า mid');
  print('');

  print('  Line 9: return -1;');
  print('    🎯 Purpose: ไม่เจอ target');
  print('    💡 Loop จบ = left > right = ไม่มีพื้นที่ค้นหา');
  print('    ❌ Convention: return -1 แทน "not found"');
}

// ==================== Why This Formula? ====================

void explainFormulas() {
  print('  🤔 Common Questions:');
  print('');

  print('  Q1: ทำไมใช้ left + (right - left) ~/ 2 แทน (left + right) ~/ 2?');
  print('  A1: ป้องกัน Integer Overflow');

  demonstrateOverflow();

  print('');
  print('  Q2: ทำไมใช้ left <= right แทน left < right?');
  print('  A2: ต้องรวม case ที่ left == right ด้วย');

  demonstrateEqualCase();

  print('');
  print('  Q3: ทำไมต้อง mid + 1 และ mid - 1?');
  print('  A3: ป้องกัน infinite loop');

  demonstrateInfiniteLoop();
}

void demonstrateOverflow() {
  print('    🧮 Overflow Example (ใน language อื่น):');
  print('    left = 2,000,000,000');
  print('    right = 2,100,000,000');
  print('    ');
  print('    Bad:  (left + right) / 2');
  print('          = (2,000,000,000 + 2,100,000,000) / 2');
  print('          = 4,100,000,000 / 2  ← Overflow!');
  print('    ');
  print('    Good: left + (right - left) / 2');
  print('          = 2,000,000,000 + (2,100,000,000 - 2,000,000,000) / 2');
  print('          = 2,000,000,000 + 100,000,000 / 2');
  print('          = 2,000,000,000 + 50,000,000');
  print('          = 2,050,000,000  ← Safe!');
  print('    ');
  print('    💡 Dart: มี BigInt ป้องกัน overflow แต่ควรใช้ best practice');
}

void demonstrateEqualCase() {
  print('    🎯 Equal Case Example:');
  print('    Array: [5]  (1 element)');
  print('    Target: 5');
  print('    ');
  print('    Initial: left=0, right=0');
  print('    ');
  print('    With <=: left <= right → 0 <= 0 → true ✅');
  print('      → Check mid=0, arr[0]=5 == 5 → Found!');
  print('    ');
  print('    With <:  left < right → 0 < 0 → false ❌');
  print('      → Skip loop → return -1 → Wrong!');
  print('    ');
  print('    💡 ต้องใช้ <= เพื่อรวม single element case');
}

void demonstrateInfiniteLoop() {
  print('    🔄 Infinite Loop Prevention:');
  print('    Array: [1, 3]');
  print('    Target: 2 (not exist)');
  print('    ');
  print('    Step 1: left=0, right=1, mid=0');
  print('      arr[0]=1 < 2 → left = mid + 1 = 1');
  print('    ');
  print('    Step 2: left=1, right=1, mid=1');
  print('      arr[1]=3 > 2 → right = mid - 1 = 0');
  print('    ');
  print('    Step 3: left=1, right=0');
  print('      left > right → stop');
  print('    ');
  print('    ❌ หากไม่มี +1/-1:');
  print('      left=0, right=1 → mid=0 → left=0 (no change!)');
  print('      → infinite loop!');
  print('    ');
  print('    💡 +1/-1 ทำให้ search space เล็กลงเรื่อย ๆ');
}

// ==================== Edge Cases ====================

void testEdgeCases() {
  print('  ⚠️ Edge Cases Testing:');
  print('');

  // Case 1: Empty array
  print('  🔍 Case 1: Empty Array');
  testCase([], 5, 'Empty array');

  // Case 2: Single element - found
  print('  🔍 Case 2: Single Element - Found');
  testCase([42], 42, 'Single element found');

  // Case 3: Single element - not found
  print('  🔍 Case 3: Single Element - Not Found');
  testCase([42], 99, 'Single element not found');

  // Case 4: Target at first position
  print('  🔍 Case 4: First Position');
  testCase([1, 5, 10, 15, 20], 1, 'First position');

  // Case 5: Target at last position
  print('  🔍 Case 5: Last Position');
  testCase([1, 5, 10, 15, 20], 20, 'Last position');

  // Case 6: Target in middle
  print('  🔍 Case 6: Middle Position');
  testCase([1, 5, 10, 15, 20], 10, 'Middle position');

  // Case 7: Target not exist - too small
  print('  🔍 Case 7: Too Small');
  testCase([10, 20, 30], 5, 'Target smaller than all');

  // Case 8: Target not exist - too large
  print('  🔍 Case 8: Too Large');
  testCase([10, 20, 30], 50, 'Target larger than all');

  // Case 9: Target not exist - in between
  print('  🔍 Case 9: In Between');
  testCase([10, 30, 50], 25, 'Target between elements');
}

void testCase(List<int> arr, int target, String description) {
  print('    📝 $description');
  print('      Array: $arr');
  print('      Target: $target');

  int result = binarySearch(arr, target);

  if (result == -1) {
    print('      Result: Not found (-1) ❌');
  } else {
    print(
      '      Result: Found at index $result (arr[$result] = ${arr[result]}) ✅',
    );
  }
  print('');
}
