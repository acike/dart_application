class Node {
  Node(this.data, [this.next]);

  int data;
  Node? next;

  @override
  String toString() => 'Node(data: $data)';
}

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

void main() {
  // Node node1 = Node(10);
  // Node node2 = Node(20);
  // Node node3 = Node(30);

  // node1.next = node2;
  // node2.next = node3;

  // print(node1);
  // print(node2);
  // print(node3);
  // print(node1.next);
  // print(node2.next);
  // print(node3.next);
  // print(node1.next?.next);
  // print(node2.next?.next);
  // print(node3.next?.next);

  SimpleLinkedList list = SimpleLinkedList();
  list.add(10);
  list.add(20);
  list.add(30);
  list.add(40);
  print(list);
}
