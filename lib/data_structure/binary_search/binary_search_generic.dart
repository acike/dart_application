/// 🔍 Binary Search with Different Data Types
/// Binary Search ไม่ได้จำกัดแค่ int เท่านั้น!
library;

void main() {
  print('=== 🔍 Binary Search with Different Data Types ===\n');

  // 1. String Binary Search
  print('📝 1. String Binary Search');
  testStringBinarySearch();

  // 2. Object Binary Search
  print('\n👤 2. Object Binary Search');
  testObjectBinarySearch();

  // 3. Custom Class Binary Search
  print('\n🏢 3. Custom Class Binary Search');
  testCustomClassBinarySearch();

  // 4. Generic Binary Search
  print('\n🔧 4. Generic Binary Search Function');
  testGenericBinarySearch();

  // 5. Advanced Examples
  print('\n🚀 5. Advanced Examples');
  testAdvancedExamples();
}

// ==================== String Binary Search ====================

void testStringBinarySearch() {
  List<String> fruits = [
    'apple',
    'banana',
    'cherry',
    'grape',
    'lemon',
    'mango',
    'orange',
    'peach',
    'strawberry',
    'watermelon',
  ];

  print('  🍎 Fruits Array (Sorted):');
  print('  $fruits');
  print('');

  // ค้นหาผลไม้
  List<String> searchTargets = ['cherry', 'mango', 'pineapple'];

  for (String target in searchTargets) {
    print('  🔍 Searching for "$target":');
    int result = binarySearchString(fruits, target);

    if (result != -1) {
      print('    ✅ Found at index $result: "${fruits[result]}"');
    } else {
      print('    ❌ Not found');
    }
    print('');
  }
}

int binarySearchString(List<String> arr, String target) {
  int left = 0, right = arr.length - 1;

  while (left <= right) {
    int mid = left + (right - left) ~/ 2;

    // เปรียบเทียบ String ด้วย compareTo
    int comparison = arr[mid].compareTo(target);

    if (comparison == 0) return mid; // เท่ากัน
    if (comparison < 0) {
      // arr[mid] < target
      left = mid + 1;
    } else {
      // arr[mid] > target
      right = mid - 1;
    }
  }

  return -1;
}

// ==================== Object Binary Search ====================

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  @override
  String toString() => 'Person(name: $name, age: $age)';
}

void testObjectBinarySearch() {
  List<Person> people = [
    Person('Alice', 25),
    Person('Bob', 30),
    Person('Charlie', 35),
    Person('David', 40),
    Person('Eve', 45),
    Person('Frank', 50),
  ];

  print('  👥 People Array (Sorted by Age):');
  for (int i = 0; i < people.length; i++) {
    print('    [$i] ${people[i]}');
  }
  print('');

  // ค้นหาตามอายุ
  List<int> searchAges = [35, 28, 50];

  for (int targetAge in searchAges) {
    print('  🔍 Searching for age $targetAge:');
    int result = binarySearchPersonByAge(people, targetAge);

    if (result != -1) {
      print('    ✅ Found at index $result: ${people[result]}');
    } else {
      print('    ❌ Not found');
    }
    print('');
  }
}

int binarySearchPersonByAge(List<Person> arr, int targetAge) {
  int left = 0, right = arr.length - 1;

  while (left <= right) {
    int mid = left + (right - left) ~/ 2;

    if (arr[mid].age == targetAge) return mid;
    if (arr[mid].age < targetAge) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return -1;
}

// ==================== Custom Class with Comparable ====================

class Product implements Comparable<Product> {
  String name;
  double price;

  Product(this.name, this.price);

  @override
  int compareTo(Product other) {
    // เปรียบเทียบตามราคา
    return price.compareTo(other.price);
  }

  @override
  String toString() =>
      'Product(name: $name, price: \$${price.toStringAsFixed(2)})';
}

void testCustomClassBinarySearch() {
  List<Product> products = [
    Product('Pencil', 1.50),
    Product('Notebook', 3.25),
    Product('Calculator', 12.99),
    Product('Backpack', 25.50),
    Product('Laptop', 599.99),
    Product('Phone', 899.99),
  ];

  print('  🛍️ Products Array (Sorted by Price):');
  for (int i = 0; i < products.length; i++) {
    print('    [$i] ${products[i]}');
  }
  print('');

  // ค้นหาตามราคา
  List<double> searchPrices = [12.99, 50.00, 899.99];

  for (double targetPrice in searchPrices) {
    print('  🔍 Searching for price \$${targetPrice.toStringAsFixed(2)}:');
    int result = binarySearchProduct(products, targetPrice);

    if (result != -1) {
      print('    ✅ Found at index $result: ${products[result]}');
    } else {
      print('    ❌ Not found');
    }
    print('');
  }
}

int binarySearchProduct(List<Product> arr, double targetPrice) {
  int left = 0, right = arr.length - 1;

  while (left <= right) {
    int mid = left + (right - left) ~/ 2;

    if (arr[mid].price == targetPrice) return mid;
    if (arr[mid].price < targetPrice) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return -1;
}

// ==================== Generic Binary Search ====================

void testGenericBinarySearch() {
  print('  🔧 Generic Binary Search Function:');
  print('  💡 ใช้ได้กับ data type อะไรก็ได้ที่เปรียบเทียบกันได้!');
  print('');

  // Test กับ int
  List<int> numbers = [1, 5, 10, 15, 20, 25, 30];
  print('  🔢 Testing with integers:');
  print('    Array: $numbers');
  int intResult = binarySearchGeneric<int>(
    numbers,
    15,
    (a, b) => a.compareTo(b),
  );
  print(
    '    Search 15: ${intResult != -1 ? 'Found at $intResult' : 'Not found'}',
  );
  print('');

  // Test กับ String
  List<String> words = ['apple', 'banana', 'cherry', 'date', 'elderberry'];
  print('  📝 Testing with strings:');
  print('    Array: $words');
  int stringResult = binarySearchGeneric<String>(
    words,
    'cherry',
    (a, b) => a.compareTo(b),
  );
  print(
    '    Search "cherry": ${stringResult != -1 ? 'Found at $stringResult' : 'Not found'}',
  );
  print('');

  // Test กับ double
  List<double> prices = [1.99, 5.50, 12.99, 25.00, 49.99];
  print('  💰 Testing with doubles:');
  print('    Array: $prices');
  int doubleResult = binarySearchGeneric<double>(
    prices,
    12.99,
    (a, b) => a.compareTo(b),
  );
  print(
    '    Search 12.99: ${doubleResult != -1 ? 'Found at $doubleResult' : 'Not found'}',
  );
}

// Generic Binary Search Function
int binarySearchGeneric<T>(List<T> arr, T target, int Function(T, T) compare) {
  int left = 0, right = arr.length - 1;

  while (left <= right) {
    int mid = left + (right - left) ~/ 2;

    int comparison = compare(arr[mid], target);

    if (comparison == 0) return mid;
    if (comparison < 0) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return -1;
}

// ==================== Advanced Examples ====================

class Student implements Comparable<Student> {
  String name;
  double gpa;
  int studentId;

  Student(this.name, this.gpa, this.studentId);

  @override
  int compareTo(Student other) {
    // เปรียบเทียบตาม GPA (สูงไปต่ำ)
    return other.gpa.compareTo(gpa);
  }

  @override
  String toString() =>
      'Student(name: $name, GPA: ${gpa.toStringAsFixed(2)}, ID: $studentId)';
}

void testAdvancedExamples() {
  print('  🎓 Advanced Example: Student Rankings');

  List<Student> students = [
    Student('Alice', 3.95, 1001),
    Student('Bob', 3.80, 1002),
    Student('Charlie', 3.65, 1003),
    Student('David', 3.50, 1004),
    Student('Eve', 3.25, 1005),
  ];

  print('  📊 Students (Sorted by GPA - Highest to Lowest):');
  for (int i = 0; i < students.length; i++) {
    print('    [$i] ${students[i]}');
  }
  print('');

  // ค้นหาตาม GPA
  List<double> searchGPAs = [3.65, 4.00, 3.50];

  for (double targetGPA in searchGPAs) {
    print('  🔍 Searching for GPA ${targetGPA.toStringAsFixed(2)}:');
    int result = binarySearchStudentByGPA(students, targetGPA);

    if (result != -1) {
      print('    ✅ Found at index $result: ${students[result]}');
    } else {
      print('    ❌ Not found');
    }
    print('');
  }

  print('  💡 Key Points:');
  print('    ✅ Binary Search works with ANY comparable data type');
  print('    ✅ String: use compareTo() method');
  print('    ✅ Object: compare specific fields');
  print('    ✅ Custom Class: implement Comparable interface');
  print('    ✅ Generic: use comparison function parameter');
  print(
    '    ⚠️  Important: Data must be SORTED by the same criteria you search!',
  );
}

int binarySearchStudentByGPA(List<Student> arr, double targetGPA) {
  int left = 0, right = arr.length - 1;

  while (left <= right) {
    int mid = left + (right - left) ~/ 2;

    // เปรียบเทียบ GPA (สูงไปต่ำ)
    if (arr[mid].gpa == targetGPA) return mid;
    if (arr[mid].gpa > targetGPA) {
      // ใน descending order
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return -1;
}
