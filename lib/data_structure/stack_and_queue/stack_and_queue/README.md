## Stack & Queue Learning Path (lib/data_structure/stack_and_queue)

ภาษา: ไทย (พร้อมคำศัพท์อังกฤษ)

โครงสร้างนี้รวม:
- โค้ดสอนพื้นฐาน `Stack` และ `Queue`
- เดโมรันได้จริง
- แบบฝึกหัด + เฉลย

### วิธีรันเดโม

```bash
dart run lib/data_structure/stack_and_queue/demo.dart
```

### ไฟล์สำคัญ
- `stack.dart` — คลาส `Stack<T>` (LIFO)
- `queue.dart` — คลาส `SimpleQueue<T>` (FIFO) ด้วย `ListQueue<T>`
- `two_stack_queue.dart` — คิวด้วยสองสแตก `TwoStackQueue<T>`
- `demo.dart` — โค้ดเดโมรวม Stack/Queue

### แบบฝึกหัด
- `exercises/balanced_parentheses.dart` — เช็ควงเล็บสมดุลด้วย Stack
- `exercises/printer_queue.dart` — จำลองคิวงานพิมพ์ด้วย Queue

เฉลยอยู่ในโฟลเดอร์ `solutions/` ของแต่ละข้อ

### แนวคิดย่อ
- Stack (LIFO): เข้าใหม่ออกก่อน เช่น กองจาน — คำสั่งหลัก: `push`, `pop`, `peek`
- Queue (FIFO): เข้าก่อนออกก่อน เช่น ต่อคิว — คำสั่งหลัก: `enqueue`, `dequeue`, `peek`

### คำสั่งพัฒนา
```bash
dart format lib/data_structure/stack_and_queue
dart analyze lib/data_structure/stack_and_queue | cat
```


