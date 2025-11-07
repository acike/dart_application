// SimpleQueue<T>: โครงสร้างข้อมูล FIFO (First In, First Out)
// เหมาะกับงาน: คิวงานพิมพ์, คิวคำขอ (requests), คิวลูกค้าหน้าร้าน

import 'dart:collection';

class SimpleQueue<T> {
  final ListQueue<T> _queue = ListQueue<T>();
  final Queue<T> _queue2 = Queue<T>();
  // เข้าแถวท้ายคิว (enqueue) — O(1) amortized
  void enqueue(T value) {
    _queue.addLast(value);
  }

  // ออกจากหัวคิว (dequeue) — O(1) amortized
  T dequeue() {
    if (_queue.isEmpty) {
      throw StateError('Cannot dequeue from an empty queue');
    }
    return _queue.removeFirst();
  }

  // ดูหัวคิวโดยไม่เอาออก (peek) — O(1)
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
