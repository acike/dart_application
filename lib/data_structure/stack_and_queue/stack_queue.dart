// Stack & Queue พื้นฐาน + เวอร์ชันก้าวหน้า (Two-Stack Queue)
// - ภาษาอธิบาย: ไทย + คำศัพท์อังกฤษ (English terms)
// - เหมาะสำหรับผู้เริ่มต้นเรียนรู้โครงสร้างข้อมูล (Data Structures)

import 'dart:collection';

// =========================
// Stack (LIFO: Last In, First Out)
// =========================
class Stack<T> {
  // ใช้ List<T> เป็นที่เก็บข้อมูลด้านล่างสุด -> บนสุด
  final List<T> _items = <T>[];

  // วางของบนสแตก (push) - O(1)
  void push(T value) {
    _items.add(value);
  }

  // หยิบของจากบนสแตก (pop) - O(1)
  T pop() {
    if (_items.isEmpty) {
      throw StateError('Cannot pop from an empty stack');
    }
    return _items.removeLast();
  }

  // ดูค่าบนสุดโดยไม่เอาออก (peek) - O(1)
  T peek() {
    if (_items.isEmpty) {
      throw StateError('Cannot peek an empty stack');
    }
    return _items.last;
  }

  bool get isEmpty => _items.isEmpty;
  int get size => _items.length;

  @override
  String toString() => 'Stack($_items)';
}

// =========================
// Queue (FIFO: First In, First Out) แบบพื้นฐานด้วย ListQueue<T>
// =========================
class SimpleQueue<T> {
  final ListQueue<T> _queue = ListQueue<T>();

  // เข้าแถวท้ายคิว (enqueue) - O(1) amortized
  void enqueue(T value) {
    _queue.addLast(value);
  }

  // ออกจากหัวคิว (dequeue) - O(1) amortized
  T dequeue() {
    if (_queue.isEmpty) {
      throw StateError('Cannot dequeue from an empty queue');
    }
    return _queue.removeFirst();
  }

  // ดูหัวคิวโดยไม่เอาออก (peek) - O(1)
  T peek() {
    if (_queue.isEmpty) {
      throw StateError('Cannot peek an empty queue');
    }
    return _queue.first;
  }

  bool get isEmpty => _queue.isEmpty;
  int get size => _queue.length;

  @override
  String toString() => 'Queue($_queue)';
}

// =========================
// Advanced: Queue ด้วยสองสแตก (Two-Stack Queue)
// ไอเดีย: ใช้สแตกสองอัน "inStack" (รับเข้า) และ "outStack" (จ่ายออก)
// เมื่อ outStack ว่าง เราจะย้ายของทั้งหมดจาก inStack ไป outStack เพื่อคง FIFO
// =========================
class TwoStackQueue<T> {
  final Stack<T> _inStack = Stack<T>();
  final Stack<T> _outStack = Stack<T>();

  void _shiftStacksIfNeeded() {
    if (_outStack.isEmpty) {
      while (!_inStack.isEmpty) {
        _outStack.push(_inStack.pop());
      }
    }
  }

  void enqueue(T value) {
    _inStack.push(value); // O(1)
  }

  T dequeue() {
    _shiftStacksIfNeeded();
    return _outStack.pop(); // O(1) amortized
  }

  T peek() {
    _shiftStacksIfNeeded();
    return _outStack.peek();
  }

  bool get isEmpty => _inStack.isEmpty && _outStack.isEmpty;
  int get size => _inStack.size + _outStack.size;

  @override
  String toString() => 'TwoStackQueue(in=$_inStack, out=$_outStack)';
}

// =========================
// Demo แบบรันได้ (dart run wso/stack_queue.dart)
// =========================
void main() {
  // Real-world analogy:
  // - Stack: กองหนังสือ วางเล่มใหม่บนสุด หยิบออกจากบนสุด (LIFO)
  // - Queue: ต่อคิวที่ธนาคาร คนที่มาถึงก่อนถูกเรียกก่อน (FIFO)

  // Demo: Stack
  final Stack<String> bookStack = Stack<String>();
  bookStack.push('Clean Code');
  bookStack.push('Flutter in Action');
  bookStack.push('Dart Essentials');
  print('--- Stack Demo ---');
  print(bookStack); // Stack([...])
  print('Top: ${bookStack.peek()}');
  print('Pop: ${bookStack.pop()}');
  print('Size after pop: ${bookStack.size}');

  // Demo: SimpleQueue
  final SimpleQueue<String> customerQueue = SimpleQueue<String>();
  customerQueue.enqueue('Alice');
  customerQueue.enqueue('Bob');
  customerQueue.enqueue('Carol');
  print('\n--- SimpleQueue Demo ---');
  print(customerQueue); // Queue(ListQueue([...]))
  print('Head: ${customerQueue.peek()}');
  print('Dequeue: ${customerQueue.dequeue()}');
  print('Size after dequeue: ${customerQueue.size}');

  // Demo: TwoStackQueue (Advanced)
  final TwoStackQueue<int> taskQueue = TwoStackQueue<int>();
  taskQueue.enqueue(1);
  taskQueue.enqueue(2);
  taskQueue.enqueue(3);
  print('\n--- TwoStackQueue Demo ---');
  print('Peek: ${taskQueue.peek()}'); // 1
  print('Dequeue: ${taskQueue.dequeue()}'); // 1
  print('Dequeue: ${taskQueue.dequeue()}'); // 2
  taskQueue.enqueue(4);
  print('Dequeue: ${taskQueue.dequeue()}'); // 3
  print('Dequeue: ${taskQueue.dequeue()}'); // 4

  // Error handling example: Uncomment เพื่อทดสอบ
  // final empty = Stack<int>();
  // empty.pop(); // จะ throw StateError
}
