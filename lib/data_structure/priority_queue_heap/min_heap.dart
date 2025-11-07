// MinHeap<T>: โครงสร้างข้อมูลแบบต้นไม้ที่ค่าน้อยสุดอยู่บนสุด (root)
// ใช้งาน: Priority Queue, Dijkstra's algorithm, หาค่าน้อยสุดอย่างมีประสิทธิภาพ

class MinHeap<T extends Comparable> {
  final List<T> _heap = <T>[]; // เก็บข้อมูลใน Array แทน Tree
  // ดูค่าน้อยสุด (root) โดยไม่เอาออก — O(1)
  T? peek() {
    return _heap.isEmpty ? null : _heap[0];
  }

  // เพิ่มค่าใหม่ลงใน Heap — O(log n)
  void insert(T value) {
    _heap.add(value);
    _bubbleUp(_heap.length - 1); // ย้ายค่าใหม่ขึ้นไปที่ตำแหน่งที่ถูกต้อง
  }

  // เอาค่าน้อยสุด (root) ออก — O(log n)
  T? extractMin() {
    if (_heap.isEmpty) return null;

    final T min = _heap[0];
    final T last = _heap.removeLast();

    if (_heap.isNotEmpty) {
      _heap[0] = last; // ย้ายค่าสุดท้ายมาเป็น root
      _bubbleDown(0); // ย้ายลงไปที่ตำแหน่งที่ถูกต้อง
    }

    return min;
  }

  // ย้ายค่าขึ้นไปหา parent จนกว่าจะถูกตำแหน่ง (maintain heap property)
  void _bubbleUp(int index) {
    while (index > 0) {
      final int parentIndex = (index - 1) ~/ 2;
      if (_heap[index].compareTo(_heap[parentIndex]) >= 0) break;

      _swap(index, parentIndex);
      index = parentIndex;
    }
  }

  // ย้ายค่าลงไปหา children จนกว่าจะถูกตำแหน่ง (maintain heap property)
  void _bubbleDown(int index) {
    while (true) {
      int smallest = index;
      final int leftChild = 2 * index + 1;
      final int rightChild = 2 * index + 2;

      if (leftChild < _heap.length &&
          _heap[leftChild].compareTo(_heap[smallest]) < 0) {
        smallest = leftChild;
      }

      if (rightChild < _heap.length &&
          _heap[rightChild].compareTo(_heap[smallest]) < 0) {
        smallest = rightChild;
      }

      if (smallest == index) break;

      _swap(index, smallest);
      index = smallest;
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
  String toString() => 'MinHeap($_heap)';
}
