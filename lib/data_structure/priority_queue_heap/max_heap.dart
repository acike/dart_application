// MaxHeap<T>: โครงสร้างข้อมูลแบบต้นไม้ที่ค่ามากสุดอยู่บนสุด (root)
// ใช้งาน: Priority Queue (high priority first), หาค่ามากสุดอย่างมีประสิทธิภาพ

class MaxHeap<T extends Comparable> {
  final List<T> _heap = <T>[];

  // ดูค่ามากสุด (root) โดยไม่เอาออก — O(1)
  T? peek() {
    return _heap.isEmpty ? null : _heap[0];
  }

  // เพิ่มค่าใหม่ลงใน Heap — O(log n)
  void insert(T value) {
    _heap.add(value);
    _bubbleUp(_heap.length - 1);
  }

  // เอาค่ามากสุด (root) ออก — O(log n)
  T? extractMax() {
    if (_heap.isEmpty) return null;

    final T max = _heap[0];
    final T last = _heap.removeLast();

    if (_heap.isNotEmpty) {
      _heap[0] = last;
      _bubbleDown(0);
    }

    return max;
  }

  // ย้ายค่าขึ้นไปหา parent จนกว่าจะถูกตำแหน่ง (maintain heap property)
  void _bubbleUp(int index) {
    while (index > 0) {
      final int parentIndex = (index - 1) ~/ 2;
      if (_heap[index].compareTo(_heap[parentIndex]) <= 0) break;

      _swap(index, parentIndex);
      index = parentIndex;
    }
  }

  // ย้ายค่าลงไปหา children จนกว่าจะถูกตำแหน่ง (maintain heap property)
  void _bubbleDown(int index) {
    while (true) {
      int largest = index;
      final int leftChild = 2 * index + 1;
      final int rightChild = 2 * index + 2;

      if (leftChild < _heap.length &&
          _heap[leftChild].compareTo(_heap[largest]) > 0) {
        largest = leftChild;
      }

      if (rightChild < _heap.length &&
          _heap[rightChild].compareTo(_heap[largest]) > 0) {
        largest = rightChild;
      }

      if (largest == index) break;

      _swap(index, largest);
      index = largest;
    }
  }

  void _swap(int i, int j) {
    final T temp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = temp;
  }

  bool get isEmpty => _heap.isEmpty;
  int get size => _heap.length;

  @override
  String toString() => 'MaxHeap($_heap)';
}
