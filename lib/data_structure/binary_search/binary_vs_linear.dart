/// 🔍 Binary Search vs Linear Search - Complete Comparison
/// ทำไม Binary Search เร็วกว่า Linear Search?
library;

import 'dart:math';

void main() {
  print('=== 🚀 Binary Search vs Linear Search ===\n');

  // 1. เปรียบเทียบความเร็ว
  print('⚡ 1. Speed Comparison');
  compareSpeed();

  // 2. วิเคราะห์การทำงาน
  print('\n🔍 2. How Binary Search Works');
  demonstrateBinarySearch();

  // 3. ข้อกำหนดและข้อจำกัด
  print('\n📋 3. Requirements and Limitations');
  demonstrateRequirements();

  // 4. เมื่อไหร่ใช้อะไร
  print('\n🎯 4. When to Use What');
  demonstrateUseCases();
}

// ==================== Speed Comparison ====================

void compareSpeed() {
  List<int> sizes = [100, 1000, 10000, 100000, 1000000];

  print('  📊 Theoretical Operations Count:');
  print('  Array Size | Linear (Max) | Binary (Max) | Speed Up');
  print('  -----------|--------------|--------------|----------');

  for (int size in sizes) {
    int linearMax = size;
    int binaryMax = (log(size) / log(2)).ceil();
    double speedUp = linearMax / binaryMax;

    print(
      '  ${size.toString().padLeft(10)} | ${linearMax.toString().padLeft(12)} | ${binaryMax.toString().padLeft(12)} | ${speedUp.toStringAsFixed(1)}x',
    );
  }

  print('\n  🧪 Real Test with Small Array:');
  List<int> testArray = List.generate(15, (i) => i * 2); // [0,2,4,6,...,28]
  int target = 14;

  print('  Array: $testArray');
  print('  Target: $target');
  print('');

  // Linear Search with steps
  int linearResult = linearSearchWithSteps(testArray, target);
  print('');

  // Binary Search with steps
  int binaryResult = binarySearchWithSteps(testArray, target);

  print('  Results: Linear=$linearResult, Binary=$binaryResult');
}

int linearSearchWithSteps(List<int> arr, int target) {
  print('  🔄 Linear Search:');
  int comparisons = 0;

  for (int i = 0; i < arr.length; i++) {
    comparisons++;
    print('    Step $comparisons: Check arr[$i] = ${arr[i]} vs $target');

    if (arr[i] == target) {
      print('    ✅ Found at index $i after $comparisons comparisons');
      return i;
    }
  }

  print('    ❌ Not found after $comparisons comparisons');
  return -1;
}

int binarySearchWithSteps(List<int> arr, int target) {
  print('  🎯 Binary Search:');
  int left = 0, right = arr.length - 1;
  int comparisons = 0;

  while (left <= right) {
    comparisons++;
    int mid = left + (right - left) ~/ 2;

    print('    Step $comparisons: left=$left, right=$right, mid=$mid');
    print('      Check arr[$mid] = ${arr[mid]} vs $target');

    if (arr[mid] == target) {
      print('    ✅ Found at index $mid after $comparisons comparisons');
      return mid;
    }

    if (arr[mid] < target) {
      print('      ${arr[mid]} < $target → Search right half');
      left = mid + 1;
    } else {
      print('      ${arr[mid]} > $target → Search left half');
      right = mid - 1;
    }
  }

  print('    ❌ Not found after $comparisons comparisons');
  return -1;
}

// ==================== How Binary Search Works ====================

void demonstrateBinarySearch() {
  print('  🧠 Binary Search Strategy:');
  print('  1. เริ่มจากตรงกลางของ array');
  print('  2. ถ้าค่ากลาง = target → เจอแล้ว!');
  print('  3. ถ้าค่ากลาง < target → หาใน half ขวา');
  print('  4. ถ้าค่ากลาง > target → หาใน half ซ้าย');
  print('  5. ทำซ้ำจนเจอหรือ array หมด');
  print('');

  print('  🎨 Visual Example:');
  List<int> arr = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19];
  int target = 13;

  print('  Array: $arr');
  print('  Target: $target');
  print('');

  visualBinarySearch(arr, target);
}

void visualBinarySearch(List<int> arr, int target) {
  int left = 0, right = arr.length - 1;
  int step = 1;

  while (left <= right) {
    int mid = left + (right - left) ~/ 2;

    // สร้าง visual representation
    List<String> visual = List.filled(arr.length, ' ');
    for (int i = left; i <= right; i++) {
      visual[i] = arr[i].toString().padLeft(2);
    }
    visual[mid] = '[${arr[mid]}]';

    print('  Step $step: ${visual.join(' ')}');
    print('    Range: index $left to $right, Mid: $mid (value=${arr[mid]})');

    if (arr[mid] == target) {
      print('    🎉 Found $target at index $mid!');
      return;
    }

    if (arr[mid] < target) {
      print('    ${arr[mid]} < $target → Search right');
      left = mid + 1;
    } else {
      print('    ${arr[mid]} > $target → Search left');
      right = mid - 1;
    }

    step++;
    print('');
  }

  print('  ❌ Not found');
}

// ==================== Requirements and Limitations ====================

void demonstrateRequirements() {
  print('  📋 Binary Search Requirements:');
  print('  ✅ Array must be SORTED');
  print('  ✅ Random access (can jump to any index)');
  print('  ✅ Comparable elements');
  print('');

  print('  🧪 Test with Unsorted Array:');
  List<int> unsorted = [5, 2, 8, 1, 9, 3];
  List<int> sorted = List.from(unsorted)..sort();
  int target = 8;

  print('  Unsorted: $unsorted');
  print('  Sorted:   $sorted');
  print('  Target:   $target');
  print('');

  // Binary search บน unsorted array (ผลผิด)
  int unsortedResult = binarySearch(unsorted, target);
  print('  Binary search on unsorted: $unsortedResult (Wrong!)');

  // Binary search บน sorted array (ผลถูก)
  int sortedResult = binarySearch(sorted, target);
  print('  Binary search on sorted:   $sortedResult (Correct!)');

  // Linear search ทำงานได้ทั้งสองแบบ
  int linearUnsorted = linearSearch(unsorted, target);
  int linearSorted = linearSearch(sorted, target);
  print('  Linear search on unsorted: $linearUnsorted (Correct!)');
  print('  Linear search on sorted:   $linearSorted (Correct!)');

  print('');
  print('  💡 Lesson: Binary search ต้องใช้กับ sorted array เท่านั้น!');
}

int binarySearch(List<int> arr, int target) {
  int left = 0, right = arr.length - 1;

  while (left <= right) {
    int mid = left + (right - left) ~/ 2;

    if (arr[mid] == target) return mid;
    if (arr[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return -1;
}

int linearSearch(List<int> arr, int target) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == target) return i;
  }
  return -1;
}

// ==================== When to Use What ====================

void demonstrateUseCases() {
  print('  🎯 When to Use Linear Search:');
  print('  ✅ Small arrays (< 100 elements)');
  print('  ✅ Unsorted data');
  print('  ✅ Linked lists (no random access)');
  print('  ✅ Simple implementation needed');
  print('  ✅ One-time search');
  print('');

  print('  🎯 When to Use Binary Search:');
  print('  ✅ Large sorted arrays');
  print('  ✅ Frequent searches');
  print('  ✅ Performance is critical');
  print('  ✅ Data rarely changes');
  print('');

  print('  📊 Performance Analysis:');
  print('  Metric           | Linear Search | Binary Search');
  print('  -----------------|---------------|---------------');
  print('  Time Complexity  | O(n)          | O(log n)');
  print('  Space Complexity | O(1)          | O(1)');
  print('  Preprocessing    | None          | Must sort');
  print('  Data Requirement | Any           | Sorted only');
  print('  Best for         | Small/Unsorted| Large/Sorted');
  print('');

  print('  🏆 Winner by Scenario:');
  printScenario(
    'Small array (10 items)',
    'Linear Search',
    'Simple & fast enough',
  );
  printScenario(
    'Large array (1M items)',
    'Binary Search',
    '20 vs 1M operations',
  );
  printScenario('Unsorted data', 'Linear Search', 'Binary search won\'t work');
  printScenario(
    'Phone book lookup',
    'Binary Search',
    'Sorted & frequently used',
  );
  printScenario(
    'Gaming leaderboard',
    'Binary Search',
    'Insert at right position',
  );

  print('');
  print('  💡 Real-world Example:');
  print('  - Google Search: Uses advanced algorithms (not simple binary)');
  print('  - Database Index: Binary search on sorted keys');
  print('  - Array.sort() then binary search: Common pattern');
  print('  - Dictionary: Hash table (even faster than binary)');
}

void printScenario(String scenario, String winner, String reason) {
  print('    ${scenario.padRight(20)} → ${winner.padRight(15)} ($reason)');
}
