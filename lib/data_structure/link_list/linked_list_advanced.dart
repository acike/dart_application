void main() {
  print('🚀 Linked List ขั้นสูง - ร่ายต่อเลย!');
  print('=' * 50);

  print('📚 บทที่ 6: ประเภทของ Linked List');
  typesOfLinkedList();

  print('\n📚 บทที่ 7: Doubly Linked List');
  doublyLinkedList();

  print('\n📚 บทที่ 8: Circular Linked List');
  circularLinkedList();

  print('\n📚 บทที่ 9: การวิเคราะห์ประสิทธิภาพ');
  performanceAnalysis();

  print('\n📚 บทที่ 10: ปัญหาและการแก้ไข');
  commonProblems();
}

void typesOfLinkedList() {
  print('\n🎭 ประเภทของ Linked List');
  print('-' * 35);

  print('📖 มี 3 ประเภทหลัก:');

  print('\n🔹 1. Singly Linked List (ตะกี้สอนไปแล้ว)');
  print('   [Data|Next] → [Data|Next] → [Data|Next] → null');
  print('   • เดินได้ทิศเดียว (ไปหน้าอย่างเดียว)');
  print('   • ประหยัด Memory');
  print('   • เหมาะสำหรับงานทั่วไป');

  print('\n🔹 2. Doubly Linked List (เดินได้สองทิศ)');
  print(
    '   null ← [Prev|Data|Next] ⇄ [Prev|Data|Next] ⇄ [Prev|Data|Next] → null',
  );
  print('   • เดินได้สองทิศ (ไป-กลับ)');
  print('   • ใช้ Memory มากกว่า');
  print('   • ลบง่ายกว่า (รู้ตำแหน่งก่อนหน้า)');

  print('\n🔹 3. Circular Linked List (วนรอบ)');
  print('   [Data|Next] → [Data|Next] → [Data|Next]');
  print('        ↑                              ↓');
  print('        ← ← ← ← ← ← ← ← ← ← ← ← ← ← ← ←');
  print('   • ไม่มี null (วนรอบไม่จบ)');
  print('   • เหมาะสำหรับ Round Robin');
  print('   • ใช้ในระบบ Queue แบบวน');

  print('\n🆚 เปรียบเทียบ:');
  print('   Feature        │ Singly │ Doubly │ Circular');
  print('   ──────────────┼────────┼────────┼─────────');
  print('   Memory         │   น้อย  │  กลาง   │   น้อย');
  print('   เดินทิศเดียว     │   ✅    │   ✅    │   ✅');
  print('   เดินย้อนกลับ     │   ❌    │   ✅    │   ❌');
  print('   ลบโหนดกลาง      │   ช้า   │   เร็ว   │   ช้า');
  print('   วนรอบ          │   ❌    │   ❌    │   ✅');
}

void doublyLinkedList() {
  print('\n↔️ Doubly Linked List');
  print('-' * 25);

  print('📝 โครงสร้าง Node:');
  print('''
class DoublyNode {
  int data;
  DoublyNode? next;     // ชี้ไปหน้า
  DoublyNode? prev;     // ชี้ไปหลัง
  
  DoublyNode(this.data);
}
''');

  // สาธิตการใช้งาน
  DoublyLinkedList dList = DoublyLinkedList();

  print('📦 สร้าง Doubly Linked List:');
  dList.add(10);
  dList.add(20);
  dList.add(30);
  print('   เพิ่ม 10, 20, 30: $dList');

  print('\n🔄 เดินไปหน้า:');
  dList.printForward();

  print('\n🔄 เดินย้อนหลัง:');
  dList.printBackward();

  print('\n❌ ลบข้อมูล:');
  dList.remove(20);
  print('   ลบ 20: $dList');

  print('\n💡 ข้อดีของ Doubly Linked List:');
  print('   • ลบข้อมูลได้เร็วกว่า (รู้ตำแหน่งก่อนหน้า)');
  print('   • เดินย้อนหลังได้');
  print('   • เหมาะสำหรับ Browser History (ปุ่ม Back/Forward)');
  print('   • เหมาะสำหรับ Music Player (เพลงก่อนหน้า/ถัดไป)');
}

// คลาส DoublyNode
class DoublyNode {
  int data;
  DoublyNode? next;
  DoublyNode? prev;

  DoublyNode(this.data);

  @override
  String toString() => 'DoublyNode($data)';
}

// คลาส DoublyLinkedList
class DoublyLinkedList {
  DoublyNode? head;
  DoublyNode? tail;
  int size = 0;

  void add(int data) {
    DoublyNode newNode = DoublyNode(data);

    if (head == null) {
      head = tail = newNode;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
    size++;
  }

  bool remove(int data) {
    DoublyNode? current = head;

    while (current != null) {
      if (current.data == data) {
        // ลบ node ที่เจอ
        if (current.prev != null) {
          current.prev!.next = current.next;
        } else {
          head = current.next;
        }

        if (current.next != null) {
          current.next!.prev = current.prev;
        } else {
          tail = current.prev;
        }

        size--;
        return true;
      }
      current = current.next;
    }
    return false;
  }

  void printForward() {
    DoublyNode? current = head;
    List<String> elements = [];
    while (current != null) {
      elements.add(current.data.toString());
      current = current.next;
    }
    print('   ไปหน้า: ${elements.join(' → ')}');
  }

  void printBackward() {
    DoublyNode? current = tail;
    List<String> elements = [];
    while (current != null) {
      elements.add(current.data.toString());
      current = current.prev;
    }
    print('   ย้อนหลัง: ${elements.join(' ← ')}');
  }

  @override
  String toString() {
    if (head == null) return '[]';

    List<String> elements = [];
    DoublyNode? current = head;
    while (current != null) {
      elements.add(current.data.toString());
      current = current.next;
    }
    return '[${elements.join(' ⇄ ')}]';
  }
}

void circularLinkedList() {
  print('\n🔄 Circular Linked List');
  print('-' * 25);

  print('📝 คุณสมบัติพิเศษ:');
  print('   • โหนดสุดท้าย ชี้กลับไปโหนดแรก');
  print('   • ไม่มี null ในระบบ');
  print('   • วนรอบไม่สิ้นสุด');

  // สาธิตการใช้งาน
  CircularLinkedList cList = CircularLinkedList();

  print('\n📦 สร้าง Circular Linked List:');
  cList.add(10);
  cList.add(20);
  cList.add(30);
  print('   เพิ่ม 10, 20, 30: $cList');

  print('\n🔄 วนรอบ 2 รอบ:');
  cList.traverse(6); // 6 ตัว = 2 รอบ

  print('\n🎯 ตัวอย่างการใช้งาน:');
  print('   • Round Robin Scheduling (ระบบปฏิบัติการ)');
  print('   • เกมส์ผลัดกันเล่น');
  print('   • Playlist เพลงที่วนซ้ำ');
  print('   • Buffer แบบวงกลม');
}

// คลาส CircularLinkedList (ใช้ Node เดิม)
class CircularLinkedList {
  Node? head;
  int size = 0;

  void add(int data) {
    Node newNode = Node(data);

    if (head == null) {
      head = newNode;
      newNode.next = newNode; // ชี้ตัวเอง
    } else {
      // หาโหนดสุดท้าย
      Node current = head!;
      while (current.next != head) {
        current = current.next!;
      }
      // เชื่อมโยง
      current.next = newNode;
      newNode.next = head;
    }
    size++;
  }

  void traverse(int steps) {
    if (head == null) return;

    Node current = head!;
    for (int i = 0; i < steps; i++) {
      print('   ขั้นที่ ${i + 1}: ${current.data}');
      current = current.next!;
    }
  }

  @override
  String toString() {
    if (head == null) return '[]';

    List<String> elements = [];
    Node current = head!;
    do {
      elements.add(current.data.toString());
      current = current.next!;
    } while (current != head);

    return '[${elements.join(' → ')} → (วนกลับ)]';
  }
}

// Node class (ใช้ของเดิม)
class Node {
  int data;
  Node? next;

  Node(this.data, [this.next]);

  @override
  String toString() => 'Node(data: $data)';
}

void performanceAnalysis() {
  print('\n📊 การวิเคราะห์ประสิทธิภาพ');
  print('-' * 40);

  print('⏱️ Big O Notation:');
  print('   การดำเนินการ     │ Array │ Linked List');
  print('   ────────────────┼───────┼────────────');
  print('   เข้าถึงข้อมูล (Get) │ O(1)  │ O(n)');
  print('   ค้นหา (Search)   │ O(n)  │ O(n)');
  print('   เพิ่มที่หัว (Insert)│ O(n)  │ O(1)');
  print('   เพิ่มที่ท้าย       │ O(1)* │ O(n)**');
  print('   ลบที่หัว          │ O(n)  │ O(1)');
  print('   ลบตรงกลาง        │ O(n)  │ O(n)');

  print('\n📝 หมายเหตุ:');
  print('   * Array: O(1) ถ้าไม่เต็ม, O(n) ถ้าต้อง resize');
  print('   ** Linked List: O(1) ถ้ามี tail pointer');

  print('\n💾 การใช้ Memory:');
  print('   📋 Array:');
  print('     • ข้อมูล: n elements × size per element');
  print('     • เพิ่มเติม: ไม่มี');
  print('     • รวม: O(n)');

  print('\n   🔗 Linked List:');
  print('     • ข้อมูล: n elements × size per element');
  print('     • Pointer: n elements × pointer size');
  print('     • รวม: O(n) แต่มากกว่า Array');

  // สาธิตความเร็ว
  demonstratePerformance();
}

void demonstratePerformance() {
  print('\n🧪 ทดสอบประสิทธิภาพ:');

  const int testSize = 10000;

  // สร้าง Array
  List<int> array = [];
  Stopwatch sw1 = Stopwatch()..start();
  for (int i = 0; i < testSize; i++) {
    array.add(i);
  }
  sw1.stop();

  // สร้าง Linked List
  SimpleLinkedList linkedList = SimpleLinkedList();
  Stopwatch sw2 = Stopwatch()..start();
  for (int i = 0; i < testSize; i++) {
    linkedList.add(i);
  }
  sw2.stop();

  print('   📊 การเพิ่มข้อมูล $testSize ตัว:');
  print('     Array: ${sw1.elapsedMicroseconds} microseconds');
  print('     Linked List: ${sw2.elapsedMicroseconds} microseconds');

  // ทดสอบการเข้าถึง
  Stopwatch sw3 = Stopwatch()..start();
  int arrayValue = array[testSize ~/ 2]; // เข้าถึงตรงกลาง
  sw3.stop();

  Stopwatch sw4 = Stopwatch()..start();
  int? linkedValue = linkedList.get(testSize ~/ 2);
  sw4.stop();

  print('\n   📊 การเข้าถึงข้อมูลตำแหน่งกลาง:');
  print('     Array: ${sw3.elapsedMicroseconds} microseconds');
  print('     Linked List: ${sw4.elapsedMicroseconds} microseconds');

  double ratio = sw4.elapsedMicroseconds / (sw3.elapsedMicroseconds + 1);
  print('     Linked List ช้ากว่า ${ratio.toStringAsFixed(1)} เท่า');
}

// SimpleLinkedList class (ใช้ของเดิม)
class SimpleLinkedList {
  Node? head;
  int size = 0;

  void add(int data) {
    Node newNode = Node(data);

    if (head == null) {
      head = newNode;
    } else {
      Node current = head!;
      while (current.next != null) {
        current = current.next!;
      }
      current.next = newNode;
    }
    size++;
  }

  int? get(int index) {
    if (index < 0 || index >= size) return null;

    Node? current = head;
    for (int i = 0; i < index; i++) {
      current = current?.next;
    }
    return current?.data;
  }
}

void commonProblems() {
  print('\n🔧 ปัญหาและการแก้ไข');
  print('-' * 30);

  print('🚨 ปัญหาที่พบบ่อย:');

  print('\n🔹 1. Memory Leak:');
  print('   ปัญหา: ไม่ลบ reference ทำให้ memory ไม่คืน');
  print('   แก้ไข: เคลียร์ reference ก่อนลบ');
  print('   ```');
  print('   // ผิด');
  print('   current = current.next; // node เดิมยังถูกอ้างอิง');
  print('   ');
  print('   // ถูก');
  print('   Node? nodeToDelete = current;');
  print('   current = current.next;');
  print('   nodeToDelete.next = null; // เคลียร์ reference');
  print('   ```');

  print('\n🔹 2. Null Pointer Exception:');
  print('   ปัญหา: เข้าถึง next ของ null');
  print('   แก้ไข: เช็ค null ก่อนเสมอ');
  print('   ```');
  print('   // ผิด');
  print('   current = current.next.next; // อันตราย!');
  print('   ');
  print('   // ถูก');
  print('   if (current?.next != null) {');
  print('     current = current!.next!.next;');
  print('   }');
  print('   ```');

  print('\n🔹 3. Infinite Loop:');
  print('   ปัญหา: วนลูปไม่สิ้นสุด (Circular List)');
  print('   แก้ไข: ใช้ Floyd\'s Cycle Detection');
  print('   ```');
  print('   bool hasCycle() {');
  print('     Node? slow = head;');
  print('     Node? fast = head;');
  print('     ');
  print('     while (fast?.next != null) {');
  print('       slow = slow?.next;');
  print('       fast = fast?.next?.next;');
  print('       if (slow == fast) return true; // เจอ cycle!');
  print('     }');
  print('     return false;');
  print('   }');
  print('   ```');

  print('\n🔹 4. การลบ Node ผิดวิธี:');
  print('   ปัญหา: ลบ node แล้วการเชื่อมโยงขาด');
  print('   แก้ไข: เชื่อมโยงก่อน ลบทีหลัง');

  print('\n💡 Best Practices:');
  print('   ✅ เช็ค null ก่อนเข้าถึง property');
  print('   ✅ ใช้ tail pointer สำหรับ insertion ที่ท้าย');
  print('   ✅ เก็บ size ไว้แทนการนับทุกครั้ง');
  print('   ✅ ใช้ dummy head node ลด edge cases');
  print('   ✅ เขียน unit tests สำหรับทุก operation');

  print('\n🎯 สรุป Linked List:');
  print('   • 🔗 โครงสร้างข้อมูลที่ยืดหยุ่น');
  print('   • 📦 เก็บข้อมูลแบบเชื่อมโยง');
  print('   • ⚡ เร็วในการเพิ่ม/ลบ (ที่หัว)');
  print('   • 🐌 ช้าในการเข้าถึงข้อมูล');
  print('   • 💡 เหมาะสำหรับข้อมูลที่เปลี่ยนแปลงบ่อย');

  print('\n🏆 เมื่อไหร่ควรใช้:');
  print('   ✅ ไม่รู้ขนาดข้อมูลล่วงหน้า');
  print('   ✅ เพิ่ม/ลบข้อมูลบ่อย');
  print('   ✅ ไม่ต้องการ random access');
  print('   ❌ ต้องการเข้าถึงข้อมูลเร็ว');
  print('   ❌ ข้อมูลมีขนาดคงที่');
}
