/// 🎯 Complex Array - Complete Learning Guide
/// สำหรับนักเรียนที่ต้องการเข้าใจ Array ในระดับลึก
library;

void main() {
  print('=== 🚀 Complex Array Learning Guide ===\n');

  // 1. Multi-dimensional Arrays
  print('📊 1. Multi-dimensional Arrays');
  learnMultiDimensionalArrays();

  // 2. Array of Objects
  print('\n👥 2. Array of Objects');
  learnArrayOfObjects();

  // 3. Dynamic Arrays
  print('\n🔄 3. Dynamic Arrays');
  learnDynamicArrays();

  // 4. Array Algorithms
  print('\n🧮 4. Array Algorithms');
  learnArrayAlgorithms();

  // 5. Memory Management
  print('\n💾 5. Memory Management');
  learnMemoryManagement();

  // 6. Advanced Patterns
  print('\n🎨 6. Advanced Patterns');
  learnAdvancedPatterns();
}

// ==================== 1. Multi-dimensional Arrays ====================

void learnMultiDimensionalArrays() {
  print('  🔹 2D Arrays (อาร์เรย์ 2 มิติ)');

  // สร้าง 2D Array
  List<List<int>> matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];

  print('  Matrix:');
  for (int i = 0; i < matrix.length; i++) {
    print('    $i: ${matrix[i]}');
  }

  // เข้าถึงข้อมูล
  print('  matrix[1][2] = ${matrix[1][2]}'); // 6

  // วนลูป 2D
  print('  All elements:');
  for (int row = 0; row < matrix.length; row++) {
    for (int col = 0; col < matrix[row].length; col++) {
      print('    [$row][$col] = ${matrix[row][col]}');
    }
  }

  // 3D Array
  print('  🔹 3D Arrays (อาร์เรย์ 3 มิติ)');
  List<List<List<int>>> cube = [
    [
      [1, 2],
      [3, 4],
    ],
    [
      [5, 6],
      [7, 8],
    ],
  ];

  print('  cube[1][0][1] = ${cube[1][0][1]}'); // 6

  // Jagged Arrays (อาร์เรย์ขนาดไม่เท่ากัน)
  print('  🔹 Jagged Arrays');
  List<List<int>> jagged = [
    [1, 2, 3, 4, 5],
    [6, 7],
    [8, 9, 10],
  ];

  for (int i = 0; i < jagged.length; i++) {
    print('    Row $i (length ${jagged[i].length}): ${jagged[i]}');
  }
}

// ==================== 2. Array of Objects ====================

class Student {
  String name;
  int age;
  List<double> grades;

  Student(this.name, this.age, this.grades);

  double get averageGrade {
    if (grades.isEmpty) return 0.0;
    return grades.reduce((a, b) => a + b) / grades.length;
  }

  @override
  String toString() {
    return 'Student(name: $name, age: $age, avg: ${averageGrade.toStringAsFixed(2)})';
  }
}

void learnArrayOfObjects() {
  // สร้าง Array of Objects
  List<Student> students = [
    Student('Alice', 20, [85.5, 92.0, 78.5]),
    Student('Bob', 19, [76.0, 84.5, 89.0]),
    Student('Charlie', 21, [95.0, 88.5, 92.5]),
  ];

  print('  All students:');
  for (Student student in students) {
    print('    $student');
  }

  // การค้นหา
  print('  🔍 Finding students:');
  Student? topStudent = students.reduce(
    (a, b) => a.averageGrade > b.averageGrade ? a : b,
  );
  print('    Top student: $topStudent');

  // การกรอง
  List<Student> youngStudents = students.where((s) => s.age < 21).toList();
  print('    Young students: $youngStudents');

  // การเรียงลำดับ
  students.sort((a, b) => b.averageGrade.compareTo(a.averageGrade));
  print('    Sorted by grade: $students');

  // การจัดกลุ่ม
  Map<int, List<Student>> groupByAge = {};
  for (Student student in students) {
    groupByAge.putIfAbsent(student.age, () => []).add(student);
  }
  print('    Grouped by age: $groupByAge');
}

// ==================== 3. Dynamic Arrays ====================

void learnDynamicArrays() {
  print('  🔹 Dynamic Resizing');

  // เริ่มต้นด้วย array เล็ก
  List<int> dynamicArray = [];

  // เพิ่มข้อมูลแบบ dynamic
  for (int i = 0; i < 10; i++) {
    dynamicArray.add(i * i);
    print('    Added ${i * i}, length: ${dynamicArray.length}');
  }

  // การจัดการ capacity
  print('  🔹 Capacity Management');
  List<int> preallocated = List.filled(1000, 0); // Pre-allocate
  print('    Pre-allocated size: ${preallocated.length}');

  // Growing arrays
  List<int> growable = <int>[];
  List<int> fixedLength = List.filled(5, 0, growable: false);

  try {
    growable.add(1); // ✅ Works
    print('    Growable: added successfully');
  } catch (e) {
    print('    Growable: $e');
  }

  try {
    fixedLength.add(1); // ❌ Error
  } catch (e) {
    print('    Fixed length: Cannot add - $e');
  }

  // Memory-efficient operations
  print('  🔹 Memory-efficient Operations');
  List<int> bigArray = List.generate(1000000, (i) => i);
  print('    Created array with ${bigArray.length} elements');

  // Slice without copying
  List<int> slice = bigArray.getRange(100, 200).toList();
  print('    Slice length: ${slice.length}');

  // View without copying (more efficient)
  Iterable<int> view = bigArray.getRange(100, 200);
  print('    View length: ${view.length}');
}

// ==================== 4. Array Algorithms ====================

void learnArrayAlgorithms() {
  print('  🔹 Searching Algorithms');

  List<int> sortedArray = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19];

  // Linear Search
  int linearSearch(List<int> arr, int target) {
    for (int i = 0; i < arr.length; i++) {
      if (arr[i] == target) return i;
    }
    return -1;
  }

  // Binary Search
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

  int target = 7;
  print('    Linear search for $target: ${linearSearch(sortedArray, target)}');
  print('    Binary search for $target: ${binarySearch(sortedArray, target)}');

  print('  🔹 Sorting Algorithms');
  //ike
  // Bubble Sort
  List<int> bubbleSort(List<int> arr) {
    List<int> result = List.from(arr);
    int n = result.length;

    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - i - 1; j++) {
        if (result[j] > result[j + 1]) {
          // Swap
          int temp = result[j];
          result[j] = result[j + 1];
          result[j + 1] = temp;
        }
      }
    }
    return result;
  }

  // Quick Sort
  List<int> quickSort(List<int> arr) {
    if (arr.length <= 1) return arr;

    int pivot = arr[arr.length ~/ 2];
    List<int> less = arr.where((x) => x < pivot).toList();
    List<int> equal = arr.where((x) => x == pivot).toList();
    List<int> greater = arr.where((x) => x > pivot).toList();

    return [...quickSort(less), ...equal, ...quickSort(greater)];
  }

  List<int> unsorted = [64, 34, 25, 12, 22, 11, 90];
  print('    Original: $unsorted');
  print('    Bubble sort: ${bubbleSort(unsorted)}');
  print('    Quick sort: ${quickSort(unsorted)}');

  print('  🔹 Array Transformations');

  List<int> numbers = [1, 2, 3, 4, 5];

  // Map - transform each element
  List<int> doubled = numbers.map((x) => x * 2).toList();
  print('    Doubled: $doubled');

  // Filter - select elements
  List<int> evens = numbers.where((x) => x % 2 == 0).toList();
  print('    Evens: $evens');

  // Reduce - combine elements
  int sum = numbers.reduce((a, b) => a + b);
  print('    Sum: $sum');

  // Fold - reduce with initial value
  int product = numbers.fold(1, (a, b) => a * b);
  print('    Product: $product');
}

// ==================== 5. Memory Management ====================

void learnMemoryManagement() {
  print('  🔹 Memory Layout');

  // Stack vs Heap
  void demonstrateMemoryLayout() {
    // Stack: primitive values, references
    int stackValue = 42;

    // Heap: actual array data
    List<int> heapArray = [1, 2, 3, 4, 5];

    print('    Stack value: $stackValue');
    print('    Heap array: $heapArray');
    print('    Array reference points to heap memory');
  }

  demonstrateMemoryLayout();

  print('  🔹 Reference vs Copy');

  // Reference (shallow copy)
  List<int> original = [1, 2, 3];
  List<int> reference = original; // Same object!

  reference[0] = 999;
  print('    Original after reference change: $original'); // [999, 2, 3]

  // Deep copy
  List<int> original2 = [1, 2, 3];
  List<int> deepCopy = List.from(original2); // New object!

  deepCopy[0] = 888;
  print('    Original after deep copy change: $original2'); // [1, 2, 3]
  print('    Deep copy: $deepCopy'); // [888, 2, 3]

  print('  🔹 Memory Optimization');

  // Use views instead of copies when possible
  List<int> bigList = List.generate(1000000, (i) => i);

  // Bad: creates new list (memory expensive)
  List<int> subListCopy = bigList.sublist(100, 200);

  // Good: creates view (memory efficient)
  Iterable<int> subListView = bigList.getRange(100, 200);

  print('    Big list length: ${bigList.length}');
  print('    Sub list copy length: ${subListCopy.length}');
  print('    Sub list view length: ${subListView.length}');

  // Lazy evaluation
  Iterable<int> lazySquares = bigList.take(10).map((x) => x * x);
  print('    Lazy squares (first 5): ${lazySquares.take(5).toList()}');
}

// ==================== Helper Classes ====================

// Stack using Array
class ArrayStack<T> {
  final List<T> _items = [];

  void push(T item) => _items.add(item);
  T? pop() => _items.isNotEmpty ? _items.removeLast() : null;
  T? peek() => _items.isNotEmpty ? _items.last : null;
  bool get isEmpty => _items.isEmpty;
  int get length => _items.length;

  @override
  String toString() => 'Stack($_items)';
}

// Queue using Array
class ArrayQueue<T> {
  final List<T> _items = [];

  void enqueue(T item) => _items.add(item);
  T? dequeue() => _items.isNotEmpty ? _items.removeAt(0) : null;
  T? front() => _items.isNotEmpty ? _items.first : null;
  bool get isEmpty => _items.isEmpty;
  int get length => _items.length;

  @override
  String toString() => 'Queue($_items)';
}

// ==================== 6. Advanced Patterns ====================

void learnAdvancedPatterns() {
  print('  🔹 Array as Data Structure');

  // ทดสอบ Stack
  ArrayStack<int> stack = ArrayStack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  print('    Stack: $stack');
  print('    Popped: ${stack.pop()}');
  print('    Stack after pop: $stack');

  // ทดสอบ Queue
  ArrayQueue<String> queue = ArrayQueue<String>();
  queue.enqueue('First');
  queue.enqueue('Second');
  queue.enqueue('Third');
  print('    Queue: $queue');
  print('    Dequeued: ${queue.dequeue()}');
  print('    Queue after dequeue: $queue');

  print('  🔹 Functional Programming Patterns');

  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  // Chaining operations
  List<int> result =
      numbers
          .where((x) => x % 2 == 0) // Filter evens
          .map((x) => x * x) // Square them
          .where((x) => x > 10) // Filter > 10
          .toList();

  print('    Chain result: $result');

  // Partition
  List<List<int>> partition(List<int> list, bool Function(int) predicate) {
    List<int> trueList = [];
    List<int> falseList = [];

    for (int item in list) {
      if (predicate(item)) {
        trueList.add(item);
      } else {
        falseList.add(item);
      }
    }

    return [trueList, falseList];
  }

  List<List<int>> partitioned = partition(numbers, (x) => x % 2 == 0);
  print('    Partitioned: $partitioned');

  // Group by
  Map<String, List<int>> groupBy(
    List<int> list,
    String Function(int) keySelector,
  ) {
    Map<String, List<int>> groups = {};

    for (int item in list) {
      String key = keySelector(item);
      groups.putIfAbsent(key, () => []).add(item);
    }

    return groups;
  }

  Map<String, List<int>> grouped = groupBy(
    numbers,
    (x) => x % 2 == 0 ? 'even' : 'odd',
  );
  print('    Grouped: $grouped');

  print('  🔹 Performance Patterns');

  // Batch processing
  void processBatch<T>(
    List<T> items,
    int batchSize,
    void Function(List<T>) processor,
  ) {
    for (int i = 0; i < items.length; i += batchSize) {
      int end = (i + batchSize < items.length) ? i + batchSize : items.length;
      List<T> batch = items.sublist(i, end);
      processor(batch);
    }
  }

  List<int> bigData = List.generate(25, (i) => i);
  print('    Processing in batches of 10:');
  processBatch(bigData, 10, (batch) {
    print('      Batch: $batch');
  });

  // Memoization
  Map<int, int> fibCache = {};

  int fibonacci(int n) {
    if (n <= 1) return n;
    if (fibCache.containsKey(n)) return fibCache[n]!;

    int result = fibonacci(n - 1) + fibonacci(n - 2);
    fibCache[n] = result;
    return result;
  }

  print('    Fibonacci(10): ${fibonacci(10)}');
  print('    Cache: $fibCache');
}
