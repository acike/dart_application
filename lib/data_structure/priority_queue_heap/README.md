## Priority Queue & Heap Learning Path

ภาษา: ไทย (พร้อมคำศัพท์อังกฤษ)

โครงสร้างนี้รวม:
- โค้ดสอนพื้นฐาน `MinHeap`, `MaxHeap` และ `PriorityQueue`
- เดโมรันได้จริง
- แบบฝึกหัด + เฉลย

### วิธีรันเดโม

```bash
dart run lib/data_structure/priority_queue_heap/demo.dart
```

### ไฟล์สำคัญ
- `min_heap.dart` — คลาส `MinHeap<T>` (ค่าน้อยสุดบนสุด)
- `max_heap.dart` — คลาส `MaxHeap<T>` (ค่ามากสุดบนสุด)
- `priority_queue.dart` — คลาส `PriorityQueue<T>` ด้วย Heap
- `demo.dart` — โค้ดเดโมรวม Heap/Priority Queue

### แบบฝึกหัด
- `exercises/hospital_queue.dart` — จำลองคิวห้องฉุกเฉิน (ผู้ป่วยหนักก่อน)
- `exercises/task_scheduler.dart` — จัดตารางงานตามความสำคัญ

เฉลยอยู่ในโฟลเดอร์ `solutions/` ของแต่ละข้อ

### แนวคิดย่อ
- **Priority Queue**: คิวตามความสำคัญ ไม่ใช่ FIFO — คำสั่งหลัก: `enqueue(item, priority)`, `dequeue()`, `peek()`
- **Min Heap**: ค่าน้อยสุดอยู่บนสุด — การดำเนินการ: `insert`, `extractMin`, `peekMin`
- **Max Heap**: ค่ามากสุดอยู่บนสุด — การดำเนินการ: `insert`, `extractMax`, `peekMax`

### หลักการ Heap
- โครงสร้าง: Complete Binary Tree ที่เก็บใน Array
- Heap Property: 
  - Min Heap: parent ≤ children
  - Max Heap: parent ≥ children
- ประสิทธิภาพ: insert/remove O(log n), peek O(1)

### คำสั่งพัฒนา
```bash
dart format lib/data_structure/priority_queue_heap
dart analyze lib/data_structure/priority_queue_heap | cat
```

