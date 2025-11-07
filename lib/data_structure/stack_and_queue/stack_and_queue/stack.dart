// Stack<T>: โครงสร้างข้อมูล LIFO (Last In, First Out)
// เหมาะกับงาน: undo/redo, call stack, backtracking

class Stack<T> {
  final List<T> _items = <T>[]; // เก็บข้อมูลตั้งแต่ล่าง -> บนสุด

  // วางค่าไว้บนสุด (push) — O(1)
  void push(T value) {
    _items.add(value);
  }

  // หยิบค่าจากบนสุด (pop) — O(1)
  T pop() {
    if (_items.isEmpty) {
      throw StateError('Cannot pop from an empty stack');
    }
    return _items.removeLast();
  }

  // ดูค่าบนสุดโดยไม่หยิบออก (peek) — O(1)
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
