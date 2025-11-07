// ตัวอย่างการเรียงลำดับหลายแบบใน Dart
// ทุกฟังก์ชันใช้ List<int> เพื่อความชัดเจน (explicit types)

void swap(List<int> arr, int i, int j) {
  final temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}

// 1) Bubble Sort (in-place, O(n^2))
void bubbleSort(List<int> arr) {
  final length = arr.length;
  for (var i = 0; i < length - 1; i++) {
    print('--- pass ${i + 1} ---'); // outer loop: pass รอบที่ i
    var swapped = false; // ใช้สำหรับ early-exit (optimization)
    // inner loop: เปรียบเทียบคู่ (j) กับ (j+1)
    // เราใช้ `n - 1 - i` เพราะหลังจาก i รอบสุดท้าย i ตัวจะอยู่ตำแหน่งถูกต้องแล้ว
    for (var j = 0; j < length - 1 - i; j++) {
      print('compare arr[$j]=${arr[j]} and arr[${j + 1}]=${arr[j + 1]}');
      if (arr[j] > arr[j + 1]) {
        swap(arr, j, j + 1);
        swapped = true;
        print(' swap -> $arr');
      }
    }
    if (!swapped) {
      print('no swaps in this pass, array is sorted early');
      break; // ถ้าไม่มีการสลับเลย ให้หยุด (best-case O(n))
    }
    print('after pass ${i + 1}: $arr');
  }
}

// void bubbleSort(List<int> arr) {
//   final n = arr.length;
//   for (var i = 0; i < n - 1; i++) {
//     // หลังจากรอบ i ค่าสุดท้ายจะอยู่ในตำแหน่งที่ถูกต้อง
//     for (var j = 0; j < n - 1 - i; j++) {
//       if (arr[j] > arr[j + 1]) {
//         swap(arr, j, j + 1);
//       }
//     }
//   }
// }

// 2) Selection Sort (in-place, O(n^2))
void selectionSort(List<int> arr) {
  final length = arr.length;
  print('Selection Sort: $arr');

  for (var i = 0; i < length - 1; i++) {
    var minIndex = i;
    print('Round ${i + 1}: Find min from position $i');

    // หาค่าเล็กสุดจากตำแหน่ง i ไปจนจบ
    for (var j = i + 1; j < length; j++) {
      if (arr[j] < arr[minIndex]) {
        minIndex = j;
        print('  New min found: ${arr[j]} at index $j');
      }
    }

    // สลับค่าถ้าจำเป็น
    if (minIndex != i) {
      print('  Swap: ${arr[i]} ↔ ${arr[minIndex]}');
      swap(arr, i, minIndex);
      print('  Result: $arr');
    } else {
      print('  No swap needed');
    }
  }
  print('Final: $arr\n');
}

// 3) Insertion Sort (in-place, O(n^2) average, O(n) best)
void insertionSort(List<int> arr) {
  final n = arr.length;
  print('Insertion Sort: $arr');

  for (var i = 1; i < n; i++) {
    final key = arr[i];
    print('Round $i: Insert $key into sorted portion');
    var j = i - 1;

    // เลื่อนองค์ประกอบที่ใหญ่กว่า key ไปขวา
    while (j >= 0 && arr[j] > key) {
      print('  Move ${arr[j]} to right');
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
    print('  Insert $key at position ${j + 1}: $arr');
  }
  print('Final: $arr\n');
}

// 4) Merge Sort (not in-place, O(n log n), stable)
List<int> mergeSort(List<int> arr) {
  if (arr.length <= 1) {
    print('Base case: $arr');
    return List.from(arr);
  }

  print('Divide: $arr');
  final mid = arr.length ~/ 2;
  final leftPart = arr.sublist(0, mid);
  final rightPart = arr.sublist(mid);
  print('  Left: $leftPart, Right: $rightPart');

  final left = mergeSort(leftPart);
  final right = mergeSort(rightPart);
  final result = _merge(left, right);

  print('Merge: $left + $right = $result');
  return result;
}

List<int> _merge(List<int> left, List<int> right) {
  final result = <int>[];
  var i = 0, j = 0;
  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      result.add(left[i++]);
    } else {
      result.add(right[j++]);
    }
  }
  // ต่อส่วนที่เหลือ
  while (i < left.length) {
    result.add(left[i++]);
  }
  while (j < right.length) {
    result.add(right[j++]);
  }
  return result;
}

// 5) Quick Sort (in-place typical implementation, average O(n log n))
void quickSort(List<int> arr, int low, int high) {
  print('🔴 QuickSort called: range [$low..$high]');
  print('   Current array: $arr');
  print(
    '   Working on: ${low <= high ? arr.sublist(low, high + 1) : "invalid range"}',
  );

  if (low < high) {
    print('   → Range is valid, proceeding with partition...');
    final p = _partition(arr, low, high);
    print('   → Partition complete! Pivot is now at position $p');
    print('   → Array after partition: $arr');

    if (low < p - 1) {
      print('   → Recursing LEFT: range [$low..${p - 1}]');
      quickSort(arr, low, p - 1); // Left side
    } else {
      print(
        '   → No LEFT recursion needed (range [$low..${p - 1}] is invalid)',
      );
    }

    if (p + 1 < high) {
      print('   → Recursing RIGHT: range [${p + 1}..$high]');
      quickSort(arr, p + 1, high); // Right side
    } else {
      print(
        '   → No RIGHT recursion needed (range [${p + 1}..$high] is invalid)',
      );
    }
  } else {
    print('   → Base case reached (low >= high), nothing to sort');
  }
  print('🔴 QuickSort finished for range [$low..$high]');
  print('');
}

int _partition(List<int> arr, int low, int high) {
  final pivot = arr[high]; // ใช้ pivot เป็นตัวท้าย (ง่ายอธิบาย)
  print(
    '  🟡 PARTITION START: range [$low..$high], pivot = $pivot (at index $high)',
  );
  print('     Array before partition: $arr');
  print('     Goal: Move all ≤ $pivot to left, all > $pivot to right');

  var i = low - 1; // i = pointer for "smaller elements section"
  print('     Initial: i = $i (pointing to last position of ≤ section)');

  for (var j = low; j < high; j++) {
    print('     Step ${j - low + 1}: Check arr[$j] = ${arr[j]}');
    print('       Compare: ${arr[j]} ≤ $pivot ?');

    if (arr[j] <= pivot) {
      i++;
      print('       YES! ${arr[j]} ≤ $pivot, so move it to ≤ section');
      print('       Increment i to $i');

      if (i != j) {
        print('       Swap arr[$i]=${arr[i]} ↔ arr[$j]=${arr[j]}');
        swap(arr, i, j);
        print('       After swap: $arr');
      } else {
        print('       No swap needed (i == j = $i)');
      }
      print('       ≤ section is now: ${arr.sublist(low, i + 1)}');
    } else {
      print('       NO! ${arr[j]} > $pivot, leave it in > section');
    }
    print('       Current array: $arr');
    print('');
  }

  print('     🎯 Now place pivot in correct position:');
  print('       Swap pivot arr[$high]=$pivot with arr[${i + 1}]=${arr[i + 1]}');
  swap(arr, i + 1, high);
  print('     Final partitioned array: $arr');
  print(
    '     ≤ section: ${arr.sublist(low, i + 1)}, pivot: ${arr[i + 1]}, > section: ${i + 2 <= high ? arr.sublist(i + 2, high + 1) : "empty"}',
  );
  print('  🟡 PARTITION END: pivot is at position ${i + 1}');

  return i + 1;
}

// 6) Heap Sort (in-place, O(n log n))
void heapSort(List<int> arr) {
  final n = arr.length;
  print('🟠 HEAP SORT START: $arr');
  print('   Array length: $n');
  print('   Goal: Sort using heap data structure (parent ≥ children)');
  print('');

  // สร้าง max-heap
  print('📋 PHASE 1: Building max-heap...');
  print('   Strategy: Start from last parent and heapify bottom-up');
  final lastParent = n ~/ 2 - 1;
  print('   Last parent index: $lastParent (value: ${arr[lastParent]})');
  print(
    '   Will heapify indices: ${List.generate(lastParent + 1, (i) => lastParent - i)}',
  );
  print('');

  for (var i = n ~/ 2 - 1; i >= 0; i--) {
    print('   Heapifying at index $i (value: ${arr[i]})...');
    _heapify(arr, n, i);
    print('   Array after heapify[$i]: $arr');
    _printHeapStructure(arr, n);
    print('');
  }
  print('✅ Max-heap built: $arr');
  _printHeapStructure(arr, n);
  print('');

  // ดึง root (ค่าสูงสุด) ทีละตัวไปไว้ท้าย และลดขนาด heap ลง
  print('📋 PHASE 2: Extracting maximum elements...');
  for (var size = n - 1; size > 0; size--) {
    print('   🔸 Extraction ${n - size}: Remove max ${arr[0]}');
    print(
      '     Step 1: Swap max arr[0]=${arr[0]} with last arr[$size]=${arr[size]}',
    );
    swap(arr, 0, size); // ย้ายค่าสูงสุดไปท้าย
    print('     After swap: $arr');
    print(
      '     Sorted portion: ${arr.sublist(size)} | Heap portion: ${arr.sublist(0, size)}',
    );

    print('     Step 2: Restore heap property (size=$size)...');
    _heapify(arr, size, 0); // ปรับ heap ที่เหลือ
    print('     After heapify: $arr');
    if (size > 1) _printHeapStructure(arr, size);
    print('');
  }
  print('✅ HEAP SORT COMPLETE: $arr\n');
}

void _heapify(List<int> arr, int size, int root) {
  print(
    '     🔹 Heapify: node $root (value: ${arr[root]}) in heap of size $size',
  );

  var largest = root;
  final left = 2 * root + 1;
  final right = 2 * root + 2;

  print('       Checking node $root (${arr[root]}) vs its children:');
  print(
    '       Left child:  index $left ${left < size ? "(value: ${arr[left]})" : "(out of bounds)"}',
  );
  print(
    '       Right child: index $right ${right < size ? "(value: ${arr[right]})" : "(out of bounds)"}',
  );

  // Find largest among root, left child, right child
  if (left < size && arr[left] > arr[largest]) {
    largest = left;
    print(
      '       → Left child ${arr[left]} > parent ${arr[root]}, largest = $left',
    );
  }
  if (right < size && arr[right] > arr[largest]) {
    largest = right;
    print(
      '       → Right child ${arr[right]} > current largest ${arr[largest]}, largest = $right',
    );
  }

  if (largest != root) {
    print(
      '       🔄 Heap property violated! Swap ${arr[root]} ↔ ${arr[largest]}',
    );
    swap(arr, root, largest);
    print('       After swap: $arr');
    print(
      '       🔄 Recursively heapify affected subtree at index $largest...',
    );
    _heapify(arr, size, largest);
  } else {
    print('       ✅ Heap property satisfied at node $root');
  }
}

// Helper function to visualize heap structure
void _printHeapStructure(List<int> arr, int size) {
  print('       Heap structure:');
  if (size == 0) return;

  // Level 0 (root)
  if (size > 0) print('         Level 0: ${arr[0]}');

  // Level 1
  if (size > 1) {
    final level1 = <String>[];
    if (size > 1) level1.add('${arr[1]}');
    if (size > 2) level1.add('${arr[2]}');
    if (level1.isNotEmpty) print('         Level 1: ${level1.join(', ')}');
  }

  // Level 2
  if (size > 3) {
    final level2 = <String>[];
    for (int i = 3; i < size && i < 7; i++) {
      level2.add('${arr[i]}');
    }
    if (level2.isNotEmpty) print('         Level 2: ${level2.join(', ')}');
  }

  // Show parent-child relationships for first few nodes
  print('       Relationships:');
  for (int i = 0; i < size && i < 3; i++) {
    final left = 2 * i + 1;
    final right = 2 * i + 2;
    final children = <String>[];
    if (left < size) children.add('${arr[left]}');
    if (right < size) children.add('${arr[right]}');
    if (children.isNotEmpty) {
      print('         ${arr[i]} → [${children.join(', ')}]');
    }
  }
}

// ฟังก์ชันเปรียบเทียบ List content (pure Dart)
bool listsEqual<T>(List<T> a, List<T> b) {
  if (a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

// ตัวอย่างการใช้งาน (main)
void main() {
  final original = [9, 3, 7, 1, 5, 2];

  print('Original: $original');
  print('=' * 50);

  // ทดสอบการเปรียบเทียบ List
  final a1 = List<int>.from(original);
  print('a1 == original: ${a1 == original}'); // false (reference)
  print('identical(a1, original): ${identical(a1, original)}'); // false
  print(
    'listsEqual(a1, original): ${listsEqual(a1, original)}',
  ); // true (content)
  print('=' * 50);

  print('🔵 BUBBLE SORT:');
  bubbleSort(a1);

  print('🟢 SELECTION SORT:');
  final a2 = List<int>.from(original);
  selectionSort(a2);

  print('🟡 INSERTION SORT:');
  final a3 = List<int>.from(original);
  insertionSort(a3);

  print('🟣 MERGE SORT:');
  final a4 = mergeSort(original); // คืนค่าใหม่
  print('Final: $a4\n');

  print('🔴 QUICK SORT:');
  final a5 = List<int>.from(original);
  quickSort(a5, 0, a5.length - 1);
  print('Final: $a5\n');

  print('🟠 HEAP SORT:');
  final a6 = List<int>.from(original);
  heapSort(a6);
}
