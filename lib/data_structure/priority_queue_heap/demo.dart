// Demo รวมการใช้งาน MinHeap, MaxHeap และ PriorityQueue

import 'min_heap.dart';
import 'max_heap.dart';
import 'priority_queue.dart';

void main() {
  // MinHeap demo
  final MinHeap<int> minHeap = MinHeap<int>();
  minHeap.insert(15);
  minHeap.insert(10);
  minHeap.insert(20);
  minHeap.insert(8);
  minHeap.insert(25);

  print('--- MinHeap Demo ---');
  print(minHeap);
  print('Min: ${minHeap.peek()}'); // 8
  print('Extract min: ${minHeap.extractMin()}'); // 8
  print('New min: ${minHeap.peek()}'); // 10

  // MaxHeap demo
  final MaxHeap<int> maxHeap = MaxHeap<int>();
  maxHeap.insert(15);
  maxHeap.insert(10);
  maxHeap.insert(20);
  maxHeap.insert(8);
  maxHeap.insert(25);

  print('\n--- MaxHeap Demo ---');
  print(maxHeap);
  print('Max: ${maxHeap.peek()}'); // 25
  print('Extract max: ${maxHeap.extractMax()}'); // 25
  print('New max: ${maxHeap.peek()}'); // 20

  // PriorityQueue demo
  final PriorityQueue<String> taskQueue = PriorityQueue<String>();
  taskQueue.enqueue('Email customer', 3);
  taskQueue.enqueue('Fix critical bug', 1); // สำคัญมาก
  taskQueue.enqueue('Update documentation', 5);
  taskQueue.enqueue('Security patch', 1); // สำคัญมาก
  taskQueue.enqueue('Weekly meeting', 4);

  print('\n--- PriorityQueue Demo ---');
  print(taskQueue);
  print(
    'Next task: ${taskQueue.peek()} (priority: ${taskQueue.peekPriority()})',
  );

  print('\nProcessing tasks by priority:');
  while (!taskQueue.isEmpty) {
    final String? task = taskQueue.dequeue();
    print('Processing: $task');
  }
}
