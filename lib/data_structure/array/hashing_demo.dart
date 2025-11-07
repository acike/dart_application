/// 🔐 Hashing และ Collision - Complete Demo
/// เข้าใจ Hash Function และปัญหา Collision
library;

void main() {
  print('=== 🔐 Hashing และ Collision Demo ===\n');

  // 1. Hash Functions พื้นฐาน
  print('📊 1. Hash Functions พื้นฐาน');
  demonstrateHashFunctions();

  // 2. Collision Problem
  print('\n💥 2. Collision Problem');
  demonstrateCollisions();

  // 3. Rabin-Karp Algorithm
  print('\n🔍 3. Rabin-Karp Algorithm');
  demonstrateRabinKarp();

  // 4. Hash Table Applications
  print('\n📚 4. Hash Table Applications');
  demonstrateHashTable();
}

// ==================== Hash Functions ====================

/// Simple Hash: รวม ASCII values
int simpleHash(String str) {
  int hash = 0;
  for (int i = 0; i < str.length; i++) {
    hash += str.codeUnitAt(i); // ASCII value
  }
  return hash;
}

/// Polynomial Hash (ดีกว่า)
int polynomialHash(String str, int base, int mod) {
  int hash = 0;
  int power = 1;

  for (int i = 0; i < str.length; i++) {
    hash = (hash + (str.codeUnitAt(i) * power)) % mod;
    power = (power * base) % mod;
  }

  return hash;
}

/// Rolling Hash (สำหรับ Rabin-Karp)
class RollingHash {
  int base = 31;
  int mod = 1000000007;

  int computeHash(String str) {
    int hash = 0;
    int power = 1;

    for (int i = 0; i < str.length; i++) {
      hash = (hash + (str.codeUnitAt(i) * power)) % mod;
      power = (power * base) % mod;
    }

    return hash;
  }

  // Rolling hash: อัปเดต hash เมื่อเลื่อน window
  int rollHash(int oldHash, String oldStr, String newStr, int length) {
    // ลบตัวแรกของ old string
    int oldChar = oldStr.codeUnitAt(0);
    oldHash = (oldHash - oldChar + mod) % mod;
    oldHash = (oldHash * modInverse(base, mod)) % mod;

    // เพิ่มตัวใหม่ของ new string
    int newChar = newStr.codeUnitAt(newStr.length - 1);
    int power = modPow(base, length - 1, mod);
    oldHash = (oldHash + (newChar * power)) % mod;

    return oldHash;
  }

  int modPow(int base, int exp, int mod) {
    int result = 1;
    while (exp > 0) {
      if (exp % 2 == 1) result = (result * base) % mod;
      base = (base * base) % mod;
      exp ~/= 2;
    }
    return result;
  }

  int modInverse(int a, int mod) {
    return modPow(a, mod - 2, mod); // สำหรับ prime mod
  }
}

void demonstrateHashFunctions() {
  List<String> strings = ['abc', 'bca', 'cab', 'hello', 'world'];

  print('  📝 เปรียบเทียบ Hash Functions:');
  print('  String    | Simple Hash | Polynomial Hash');
  print('  ----------|-------------|----------------');

  for (String str in strings) {
    int simple = simpleHash(str);
    int poly = polynomialHash(str, 31, 1000000007);
    print(
      '  ${str.padRight(9)} | ${simple.toString().padLeft(11)} | ${poly.toString().padLeft(15)}',
    );
  }

  print('\n  🎯 สังเกต:');
  print('  - "abc", "bca", "cab" มี Simple Hash เหมือนกัน → Collision!');
  print('  - Polynomial Hash ให้ค่าต่างกัน → ดีกว่า');
}

// ==================== Collision Problem ====================

void demonstrateCollisions() {
  print('  🔍 อะไรคือ Collision?');
  print('  Collision = สอง input ต่างกันให้ hash value เหมือนกัน');

  // ตัวอย่าง collision
  Map<int, List<String>> hashGroups = {};
  List<String> testStrings = [
    'abc',
    'bca',
    'cab',
    'acb',
    'bac',
    'cba',
    'hello',
    'world',
    'dart',
    'code',
  ];

  for (String str in testStrings) {
    int hash = simpleHash(str) % 100; // ลด hash space เพื่อให้เกิด collision
    hashGroups.putIfAbsent(hash, () => []).add(str);
  }

  print('\n  📊 Collision Groups (Simple Hash % 100):');
  hashGroups.forEach((hash, strings) {
    if (strings.length > 1) {
      print('    Hash $hash: $strings ← Collision!');
    }
  });

  print('\n  ⚡ ทำไม Collision เป็นปัญหา?');
  print('  1. Hash Table: หลายค่าชนกัน → ช้าลง');
  print('  2. String Matching: False positive → ต้องเช็คอีกครั้ง');
  print('  3. Security: Hash collision attacks');

  // Birthday Paradox
  print('\n  🎂 Birthday Paradox:');
  print('  ใน hash space ขนาด n, collision เกิดขึ้นหลังจาก √n ค่า');
  print('  ตัวอย่าง: hash 32-bit (2³²) → collision หลัง ~65,536 ค่า');
}

// ==================== Rabin-Karp Algorithm ====================

int rabinKarpSearch(String text, String pattern) {
  if (pattern.isEmpty) return 0;
  if (pattern.length > text.length) return -1;

  RollingHash hasher = RollingHash();
  int patternHash = hasher.computeHash(pattern);
  int textHash = hasher.computeHash(text.substring(0, pattern.length));

  print('  🎯 Pattern "$pattern" hash: $patternHash');
  print('  🔄 Rolling through text:');

  // เช็คตำแหน่งแรก
  if (textHash == patternHash) {
    if (text.substring(0, pattern.length) == pattern) {
      print('    Position 0: Hash match + String match ✅');
      return 0;
    } else {
      print('    Position 0: Hash match but String mismatch (collision!) ❌');
    }
  }

  // เลื่อน window
  for (int i = 1; i <= text.length - pattern.length; i++) {
    String oldWindow = text.substring(i - 1, i - 1 + pattern.length);
    String newWindow = text.substring(i, i + pattern.length);

    // คำนวณ hash ใหม่ (ในทางปฏิบัติใช้ rolling hash)
    textHash = hasher.computeHash(newWindow);

    if (textHash == patternHash) {
      if (newWindow == pattern) {
        print('    Position $i: "$newWindow" hash: $textHash → Match! ✅');
        return i;
      } else {
        print(
          '    Position $i: "$newWindow" hash: $textHash → Hash match but collision! ❌',
        );
      }
    } else {
      print('    Position $i: "$newWindow" hash: $textHash → No match');
    }
  }

  return -1;
}

void demonstrateRabinKarp() {
  print('  📖 Rabin-Karp Algorithm:');
  print('  1. คำนวณ hash ของ pattern');
  print('  2. เลื่อน window ใน text, คำนวณ hash แต่ละ window');
  print('  3. ถ้า hash ตรง → เช็ค string จริง (ป้องกัน collision)');
  print('  4. ถ้า string ตรง → เจอแล้ว!');

  print('\n  🧪 ทดสอบ:');
  String text = 'abcabcabcabc';
  String pattern = 'cab';

  print('  Text: "$text"');
  print('  Pattern: "$pattern"');
  print('');

  int result = rabinKarpSearch(text, pattern);
  print('  Result: ${result >= 0 ? "Found at position $result" : "Not found"}');

  print('\n  ⚡ ข้อดีของ Rabin-Karp:');
  print('  - Rolling hash: O(1) เพื่อคำนวณ hash ใหม่');
  print('  - Average case: O(n + m)');
  print('  - ใช้ได้กับ multiple pattern search');

  print('\n  ⚠️ ข้อเสีย:');
  print('  - Worst case: O(n×m) เมื่อมี collision เยอะ');
  print('  - ต้องเลือก hash function ที่ดี');
}

// ==================== Hash Table Applications ====================

class SimpleHashTable<K, V> {
  final List<List<MapEntry<K, V>>?> _buckets;
  int _size = 0;

  SimpleHashTable(int capacity) : _buckets = List.filled(capacity, null);

  int _hash(K key) {
    return key.hashCode.abs() % _buckets.length;
  }

  void put(K key, V value) {
    int index = _hash(key);

    _buckets[index] ??= [];

    // เช็คว่ามี key นี้แล้วหรือไม่
    for (int i = 0; i < _buckets[index]!.length; i++) {
      if (_buckets[index]![i].key == key) {
        _buckets[index]![i] = MapEntry(key, value); // อัปเดต
        return;
      }
    }

    // เพิ่มใหม่
    _buckets[index]!.add(MapEntry(key, value));
    _size++;
  }

  V? get(K key) {
    int index = _hash(key);
    if (_buckets[index] == null) return null;

    for (var entry in _buckets[index]!) {
      if (entry.key == key) return entry.value;
    }
    return null;
  }

  void printStats() {
    print('    Hash Table Stats:');
    print('    - Total items: $_size');
    print('    - Buckets: ${_buckets.length}');

    int usedBuckets = 0;
    int maxChainLength = 0;
    int totalChainLength = 0;

    for (int i = 0; i < _buckets.length; i++) {
      if (_buckets[i] != null && _buckets[i]!.isNotEmpty) {
        usedBuckets++;
        int chainLength = _buckets[i]!.length;
        totalChainLength += chainLength;
        if (chainLength > maxChainLength) {
          maxChainLength = chainLength;
        }
        if (chainLength > 1) {
          print('    - Bucket $i: $chainLength items (collision!)');
        }
      }
    }

    double loadFactor = _size / _buckets.length;
    double avgChainLength =
        usedBuckets > 0 ? totalChainLength / usedBuckets : 0;

    print('    - Used buckets: $usedBuckets/${_buckets.length}');
    print('    - Load factor: ${loadFactor.toStringAsFixed(2)}');
    print('    - Max chain length: $maxChainLength');
    print('    - Avg chain length: ${avgChainLength.toStringAsFixed(2)}');
  }
}

void demonstrateHashTable() {
  print('  📚 Hash Table (HashMap) Applications:');

  SimpleHashTable<String, int> hashTable = SimpleHashTable<String, int>(7);

  // เพิ่มข้อมูล
  List<String> names = [
    'Alice',
    'Bob',
    'Charlie',
    'Diana',
    'Eve',
    'Frank',
    'Grace',
  ];
  List<int> ages = [25, 30, 35, 28, 32, 29, 27];

  print('  Adding data...');
  for (int i = 0; i < names.length; i++) {
    hashTable.put(names[i], ages[i]);
    print(
      '    ${names[i]} → ${ages[i]} (hash: ${names[i].hashCode.abs() % 7})',
    );
  }

  print('\n  📊 Hash Table Statistics:');
  hashTable.printStats();

  print('\n  🔍 Retrieving data:');
  for (String name in ['Alice', 'Frank', 'Unknown']) {
    int? age = hashTable.get(name);
    print('    $name: ${age ?? "Not found"}');
  }

  print('\n  🎯 Hash Table ใช้ใน:');
  print('  - Dictionary/Map data structures');
  print('  - Database indexing');
  print('  - Caching systems');
  print('  - Set implementations');
  print('  - Compiler symbol tables');
}
