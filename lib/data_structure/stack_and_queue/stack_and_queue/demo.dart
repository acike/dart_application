// Demo รวมการใช้งาน Stack, SimpleQueue และ TwoStackQueue

import 'stack.dart';
import 'queue.dart';
import 'two_stack_queue.dart';

void main() {
  // Stack demo
  final Stack<String> bookStack = Stack<String>();
  bookStack.push('Clean Code');
  bookStack.push('Flutter in Action');
  bookStack.push('Dart Essentials');
  print('--- Stack Demo ---');
  print(bookStack);
  print('Top: ${bookStack.peek()}');
  print('Pop: ${bookStack.pop()}');
  print('Size after pop: ${bookStack.size}');

  // SimpleQueue demo
  final SimpleQueue<String> customerQueue = SimpleQueue<String>();
  customerQueue.enqueue('Alice');
  customerQueue.enqueue('Bob');
  customerQueue.enqueue('Carol');
  print('\n--- SimpleQueue Demo ---');
  print(customerQueue);
  print('Head: ${customerQueue.peek()}');
  print('Dequeue: ${customerQueue.dequeue()}');
  print('Size after dequeue: ${customerQueue.size}');

  // TwoStackQueue demo
  final TwoStackQueue<int> taskQueue = TwoStackQueue<int>();
  taskQueue.enqueue(1);
  taskQueue.enqueue(2);
  taskQueue.enqueue(3);
  print('\n--- TwoStackQueue Demo ---');
  print('Peek: ${taskQueue.peek()}');
  print('Dequeue: ${taskQueue.dequeue()}');
  print('Dequeue: ${taskQueue.dequeue()}');
  taskQueue.enqueue(4);
  print('Dequeue: ${taskQueue.dequeue()}');
  print('Dequeue: ${taskQueue.dequeue()}');
}
