void main() {
  print('🔗 Linked List - ร่ายมาเลยเพื่อน!');
  print('=' * 50);

  print('📚 บทที่ 1: Linked List คืออะไร?');
  whatIsLinkedList();

  print('\n📚 บทที่ 2: สร้าง Node (โหนด)');
  createNode();

  print('\n📚 บทที่ 3: สร้าง Linked List');
  createLinkedList();

  print('\n📚 บทที่ 4: การดำเนินการพื้นฐาน');
  basicOperations();

  print('\n📚 บทที่ 5: ตัวอย่างการใช้งาน');
  practicalExamples();
}

void whatIsLinkedList() {
  print('\n🤔 Linked List คืออะไร?');
  print('-' * 30);

  print('📖 คำอธิบาย:');
  print('   Linked List = รายการที่เชื่อมโยงกัน');
  print('   เหมือนไส้กรอกที่ต่อกันเป็นสาย 🌭→🌭→🌭');

  print('\n🆚 เปรียบเทียบกับ Array:');
  print('   📋 Array: [🏠][🏠][🏠][🏠] - บ้านเรียงติดกัน');
  print('   🔗 Linked List: 🏠→🏠→🏠→🏠 - บ้านมีทางเดินเชื่อม');

  print('\n🧩 ส่วนประกอบ:');
  print('   1. 📦 Node (โหนด) = กล่องเก็บข้อมูล');
  print('   2. 📊 Data = ข้อมูลจริง');
  print('   3. ➡️  Next = ชี้ไปโหนดถัดไป');

  print('\n🎨 ภาพรวม:');
  print('   [Data|Next] → [Data|Next] → [Data|Next] → null');
  print('   [  10 | →  ]   [  20 | →  ]   [  30 |null]');

  print('\n✅ ข้อดี:');
  print('   • เพิ่ม/ลบข้อมูลง่าย (ไม่ต้องเลื่อนข้อมูล)');
  print('   • ขนาดไม่จำกัด (ขยายได้ตามต้องการ)');
  print('   • ประหยัด Memory (ใช้เท่าที่ต้องการ)');

  print('\n❌ ข้อเสีย:');
  print('   • เข้าถึงข้อมูลช้า (ต้องเดินทีละโหนด)');
  print('   • ใช้ Memory เพิ่ม (เก็บ pointer)');
  print('   • ไม่สามารถ Random Access (ไม่ใช่ arr[5])');
}

void createNode() {
  print('\n🧱 สร้าง Node (โหนด)');
  print('-' * 25);

  print('📝 โค้ดสร้าง Node:');
  print('''
class Node {
  int data;           // 📊 ข้อมูล
  Node? next;         // ➡️  ชี้ไปโหนดถัดไป
  
  Node(this.data, [this.next]);
  
  @override
  String toString() => 'Node(data: \$data)';
}
''');

  // สาธิตการใช้งาน Node
  Node node1 = Node(10);
  Node node2 = Node(20);
  Node node3 = Node(30);

  print('📦 สร้าง Node:');
  print('   node1: $node1');
  print('   node2: $node2');
  print('   node3: $node3');

  // เชื่อมโยง Node
  node1.next = node2;
  node2.next = node3;

  print('\n🔗 เชื่อมโยง Node:');
  print('   node1.next = node2');
  print('   node2.next = node3');
  print('   node3.next = null');

  print('\n📊 ผลลัพธ์:');
  print('   $node1 → $node2 → $node3 → null');

  // เดินผ่าน Node
  print('\n🚶‍♂️ เดินผ่าน Node:');
  Node? current = node1;
  int position = 0;
  while (current != null) {
    print('   ตำแหน่ง $position: ${current.data}');
    current = current.next;
    position++;
  }
}

// คลาส Node สำหรับใช้งานจริง
class Node {
  Node(this.data, [this.next]);

  int data;
  Node? next;

  @override
  String toString() => 'Node(data: $data)';
}

void createLinkedList() {
  print('\n🏗️ สร้าง Linked List');
  print('-' * 25);

  print('📝 โค้ดสร้าง LinkedList Class:');

  // สร้าง LinkedList
  SimpleLinkedList list = SimpleLinkedList();

  print('\n📦 LinkedList ว่าง:');
  print('   หัว: ${list.head}');
  print('   ขนาด: ${list.size}');

  // เพิ่มข้อมูล
  print('\n➕ เพิ่มข้อมูล:');
  list.add(10);
  print('   เพิ่ม 10: $list');

  list.add(20);
  print('   เพิ่ม 20: $list');

  list.add(30);
  print('   เพิ่ม 30: $list');

  print('\n📊 สถานะปัจจุบัน:');
  print('   ขนาด: ${list.size}');
  print('   รายการ: $list');
}

// คลาส LinkedList แบบง่าย
class SimpleLinkedList {
  Node? head; // 👑 หัวของ list
  int size = 0; // 📏 ขนาด

  @override
  String toString() {
    if (head == null) return '[]';

    List<String> elements = [];
    Node? current = head;
    while (current != null) {
      elements.add(current.data.toString());
      current = current.next;
    }
    return '[${elements.join(' → ')}]';
  }

  // เพิ่มข้อมูลที่ท้าย
  void add(int data) {
    Node newNode = Node(data);

    if (head == null) {
      // ถ้า list ว่าง ให้ node ใหม่เป็นหัว
      head = newNode;
    } else {
      // หาโหนดสุดท้าย
      Node current = head!;
      while (current.next != null) {
        current = current.next!;
      }
      // เชื่อมโยง
      current.next = newNode;
    }
    size++;
  }
}

void basicOperations() {
  print('\n🛠️ การดำเนินการพื้นฐาน');
  print('-' * 30);

  LinkedList list = LinkedList();

  print('🔹 1. เพิ่มข้อมูล (Add):');
  list.add(10);
  list.add(20);
  list.add(30);
  print('   เพิ่ม 10, 20, 30: $list');

  print('\n🔹 2. เพิ่มที่หัว (Add First):');
  list.addFirst(5);
  print('   เพิ่ม 5 ที่หัว: $list');

  print('\n🔹 3. ค้นหาข้อมูล (Search):');
  bool found20 = list.contains(20);
  bool found99 = list.contains(99);
  print('   หา 20: $found20');
  print('   หา 99: $found99');

  print('\n🔹 4. ลบข้อมูล (Remove):');
  bool removed = list.remove(20);
  print('   ลบ 20: $removed');
  print('   หลังลบ: $list');

  print('\n🔹 5. เข้าถึงข้อมูล (Get):');
  int? value = list.get(1);
  print('   ข้อมูลที่ตำแหน่ง 1: $value');

  print('\n🔹 6. ขนาดและสถานะ:');
  print('   ขนาด: ${list.size}');
  print('   ว่างหรือไม่: ${list.isEmpty}');
}

// คลาส LinkedList แบบเต็ม
class LinkedList {
  Node? head;
  int size = 0;

  @override
  String toString() {
    if (head == null) return '[]';

    List<String> elements = [];
    Node? current = head;
    while (current != null) {
      elements.add(current.data.toString());
      current = current.next;
    }
    return '[${elements.join(' → ')}]';
  }

  // เพิ่มที่ท้าย
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

  // เพิ่มที่หัว
  void addFirst(int data) {
    Node newNode = Node(data, head);
    head = newNode;
    size++;
  }

  // ค้นหา
  bool contains(int data) {
    Node? current = head;
    while (current != null) {
      if (current.data == data) return true;
      current = current.next;
    }
    return false;
  }

  // ลบ
  bool remove(int data) {
    if (head == null) return false;

    // ลบหัว
    if (head!.data == data) {
      head = head!.next;
      size--;
      return true;
    }

    // ลบตรงกลางหรือท้าย
    Node current = head!;
    while (current.next != null) {
      if (current.next!.data == data) {
        current.next = current.next!.next;
        size--;
        return true;
      }
      current = current.next!;
    }
    return false;
  }

  // เข้าถึงข้อมูลที่ตำแหน่ง
  int? get(int index) {
    if (index < 0 || index >= size) return null;

    Node? current = head;
    for (int i = 0; i < index; i++) {
      current = current?.next;
    }
    return current?.data;
  }

  bool get isEmpty => size == 0;
}

void practicalExamples() {
  print('\n🌟 ตัวอย่างการใช้งานจริง');
  print('-' * 35);

  print('🔹 ตัวอย่าง 1: รายการสินค้าในตะกร้า');
  ShoppingCart cart = ShoppingCart();
  cart.addItem('🍎 แอปเปิ้ล');
  cart.addItem('🍌 กล้วย');
  cart.addItem('🥛 นม');
  print('   ตะกร้า: $cart');

  cart.removeItem('🍌 กล้วย');
  print('   หลังลบกล้วย: $cart');

  print('\n🔹 ตัวอย่าง 2: ประวัติการท่องเว็บ');
  BrowserHistory history = BrowserHistory();
  history.visit('google.com');
  history.visit('youtube.com');
  history.visit('github.com');
  print('   ประวัติ: $history');

  print('\n🔹 ตัวอย่าง 3: รายการเพลง');
  Playlist playlist = Playlist();
  playlist.addSong('🎵 Shape of You');
  playlist.addSong('🎵 Blinding Lights');
  playlist.addSong('🎵 Watermelon Sugar');
  print('   เพลงทั้งหมด: $playlist');

  print('\n💡 สรุป Linked List:');
  print('   ✅ เหมาะสำหรับข้อมูลที่เปลี่ยนแปลงบ่อย');
  print('   ✅ ไม่ต้องกำหนดขนาดล่วงหน้า');
  print('   ✅ เพิ่ม/ลบง่าย (O(1) ที่หัว)');
  print('   ❌ เข้าถึงช้า (O(n) random access)');
  print('   ❌ ใช้ Memory เพิ่ม (pointer)');
}

// ตัวอย่างการใช้งาน 1: ตะกร้าสินค้า
class ShoppingCart {
  Node? head;

  @override
  String toString() => head == null ? 'ตะกร้าว่าง' : 'มีสินค้า';

  void addItem(String item) {
    Node newNode = Node(item.hashCode); // ใช้ hashCode แทน
    newNode.next = head;
    head = newNode;
  }

  bool removeItem(String item) {
    if (head == null) return false;

    int targetHash = item.hashCode;
    if (head!.data == targetHash) {
      head = head!.next;
      return true;
    }

    Node current = head!;
    while (current.next != null) {
      if (current.next!.data == targetHash) {
        current.next = current.next!.next;
        return true;
      }
      current = current.next!;
    }
    return false;
  }
}

// ตัวอย่างการใช้งาน 2: ประวัติเว็บ
class BrowserHistory {
  Node? head;

  @override
  String toString() => head == null ? 'ไม่มีประวัติ' : 'มีประวัติ';

  void visit(String url) {
    Node newNode = Node(url.hashCode);
    newNode.next = head;
    head = newNode;
  }
}

// ตัวอย่างการใช้งาน 3: รายการเพลง
class Playlist {
  Node? head;

  @override
  String toString() => head == null ? 'ไม่มีเพลง' : 'มีเพลง';

  void addSong(String song) {
    Node newNode = Node(song.hashCode);
    if (head == null) {
      head = newNode;
    } else {
      Node current = head!;
      while (current.next != null) {
        current = current.next!;
      }
      current.next = newNode;
    }
  }
}
