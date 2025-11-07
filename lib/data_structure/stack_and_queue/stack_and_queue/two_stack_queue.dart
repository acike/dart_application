// TwoStackQueue<T>: คิวที่สร้างจากสแตกสองอัน
// ไอเดีย: รับเข้าที่ inStack, จ่ายออกที่ outStack. ถ้า out ว่างให้ย้ายทั้งหมดจาก in -> out

import 'stack.dart';

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
