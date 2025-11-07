// void main() async {
//   final receivePort = ReceivePort();
//   await Isolate.spawn(heavyTask, receivePort.sendPort);

//   receivePort.listen((message) {
//     print('From isolate: $message');
//   });

//   print('Main still responsive!');
// }

// void heavyTask(SendPort sendPort) {
//   int sum = 0;
//   for (int i = 0; i < 1000000000; i++) {
//     sum += i;
//   }
//   sendPort.send(sum);
// }

// void main() {
//   print('Start');

//   heavyTask(); // Block อยู่ตรงนี้

//   print('End');
// }

// void heavyTask() {
//   int sum = 0;
//   for (int i = 0; i < 1000000000; i++) {
//     sum += i;
//   }
//   print('Heavy done: $sum');
// }

Future<void> main() async {
  print('Start');

  heavyTask(); // Block อยู่ตรงนี้

  print('End');
}

Future<void> heavyTask() async {
  int sum = 0;
  for (int i = 0; i < 1000000000; i++) {
    sum += i;
  }
  print('Heavy done: $sum');
}

// 1.Asynchronous operations (where await is useful):
// Network requests
// File I/O
// Database operations
// Timer operations
// Any operation that involves waiting for external resources
// 2.CPU-intensive operations (where await alone doesn't help):
// Complex calculations
// Loops
// Data processing
// // Any operation that uses CPU heavil


// Yes, the Event Loop in Dart handles both synchronous and asynchronous events, but in different ways. Let me break this down:

// ## Event Loop Components

// 1. **Microtask Queue** (Priority: High)
//    - Handles synchronous operations
//    - Runs before the Event Queue
//    - Used for: `Future.microtask()`, `scheduleMicrotask()`

// 2. **Event Queue** (Priority: Normal)
//    - Handles asynchronous operations
//    - Runs after Microtask Queue
//    - Used for: I/O, timers, user input, network requests

// ## How It Works



// Output will be:
// ```
// 1. Start
// 4. End
// 2. Microtask
// 3. Event
// ```

// ## Processing Order

// 1. **Synchronous Code**
//    - Runs immediately
//    - Blocks the Event Loop
//    - Example: Your `heavyTask()` function

// 2. **Microtasks**
//    - Run after synchronous code
//    - Before the Event Queue
//    - Complete before next event

// 3. **Events**
//    - Run after all microtasks
//    - Handle I/O and timers
//    - Can be interrupted by new microtasks

// ## Important Points

// - The Event Loop is single-threaded
// - Synchronous code blocks the Event Loop
// - Asynchronous code doesn't block but still runs in the same thread
// - For true parallelism, you need `Isolate`

// This is why your `heavyTask()` blocks "End" from printing - it's synchronous code that blocks the Event Loop, even though it's marked as `async`.


// Event Loop is the Master
// The Event Loop is indeed the main coordinator of ALL execution
// It's the central mechanism that decides what runs when
// It's like a traffic controller
// But It Uses Different Parts
// 1 Call Stack (for synchronous code)
// Part of the Event Loop's execution cycle
// Handles immediate, synchronous execution
// Runs first in the cycle
// 2 Queues (for asynchronous code)
// Microtask Queue
// Event Queue
// Run after Call Stack is empty

// https://www.linkedin.com/pulse/understanding-dart-event-loop-detailed-guide-vitalii-vyrodov-4axff/