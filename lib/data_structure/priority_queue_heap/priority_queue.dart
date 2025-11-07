// PriorityQueue<T>: คิวตามลำดับความสำคัญที่ใช้ MinHeap เป็นพื้นฐาน
// ใช้งาน: Task scheduler, ระบบฉุกเฉิน, Dijkstra's algorithm

import 'min_heap.dart';

class PriorityItem<T> implements Comparable {
  final T value;
  final int priority; // ค่าน้อยกว่า = ความสำคัญมากกว่า (high priority)

  PriorityItem(this.value, this.priority);

  @override
  int compareTo(other) {
    if (other is! PriorityItem<T>) throw ArgumentError('Invalid comparison');
    return priority.compareTo(other.priority); // น้อยกว่า = สำคัญกว่า
  }

  @override
  String toString() => '$value(p:$priority)';
}

class PriorityQueue<T> {
  final MinHeap<PriorityItem<T>> _heap = MinHeap<PriorityItem<T>>();

  // เพิ่มงานใหม่พร้อมความสำคัญ (priority น้อย = สำคัญมาก) — O(log n)
  void enqueue(T value, int priority) {
    _heap.insert(PriorityItem(value, priority));
  }

  // เอางานที่สำคัญที่สุดออก — O(log n)
  T? dequeue() {
    final PriorityItem<T>? item = _heap.extractMin();
    return item?.value;
  }

  // ดูงานที่สำคัญที่สุดโดยไม่เอาออก — O(1)
  T? peek() {
    final PriorityItem<T>? item = _heap.peek();
    return item?.value;
  }

  // ดูความสำคัญของงานที่อยู่หัวคิว — O(1)
  int? peekPriority() {
    final PriorityItem<T>? item = _heap.peek();
    return item?.priority;
  }

  bool get isEmpty => _heap.isEmpty;
  int get size => _heap.size;

  @override
  String toString() => 'PriorityQueue($_heap)';
}
