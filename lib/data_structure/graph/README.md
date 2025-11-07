# Graph (กราฟ) พื้นฐานใน Dart

## Graph คืออะไร? 
Graph เป็น Data Structure ที่ประกอบด้วย Vertices (จุดยอด) และ Edges (เส้นเชื่อม) ที่เชื่อมต่อระหว่างจุดยอดเหล่านั้น

## ความแตกต่างระหว่าง Tree และ Graph:
- **Tree**: มี hierarchy (ลำดับชั้น), ไม่มี cycle (วงจร), มี parent-child relationship
- **Graph**: ไม่จำเป็นต้องมี hierarchy, อาจมี cycle ได้, relationship แบบ flexible

## ประเภทของ Graph:
1. **Directed Graph (กราฟมีทิศทาง)**: เส้นเชื่อมมีทิศทาง (A → B ≠ B → A)
2. **Undirected Graph (กราฟไม่มีทิศทาง)**: เส้นเชื่อมไม่มีทิศทาง (A — B = B — A)
3. **Weighted Graph (กราฟมีน้ำหนัก)**: เส้นเชื่อมมีค่าน้ำหนัก (ระยะทาง, ค่าใช้จ่าย)

## ตัวอย่างในชีวิตจริง:
- **Social Network**: Facebook friends (undirected), Twitter follow (directed)
- **Google Maps**: สถานที่และถนน (weighted - ระยะทาง/เวลา)
- **Family Tree**: ความสัมพันธ์ในครอบครัว
- **Web Pages**: เว็บไซต์และลิงก์ระหว่างกัน

## ไฟล์ที่เกี่ยวข้อง:
- `graph_basic.dart` - แนวคิดพื้นฐานและตัวอย่าง
- `adjacency_list.dart` - การแทนกราฟด้วย Adjacency List
- `adjacency_matrix.dart` - การแทนกราฟด้วย Adjacency Matrix  
- `graph_traversal.dart` - การท่องกราฟ (BFS, DFS)
- `graph_algorithms.dart` - อัลกอริทึมสำคัญ (Shortest Path, MST)
- `graph_demo.dart` - ตัวอย่างการใช้งาน

## วิธีรันเดโม:
```bash
dart run lib/data_structure/graph/graph_demo.dart
```

## คำศัพท์สำคัญ:
- **Vertex/Node (จุดยอด/โหนด)**: จุดในกราฟ
- **Edge (เส้นเชื่อม)**: เส้นที่เชื่อมระหว่างจุดยอด
- **Degree (ดีกรี)**: จำนวนเส้นเชื่อมที่เชื่อมกับจุดยอด
- **Path (เส้นทาง)**: ลำดับของจุดยอดที่เชื่อมต่อกัน
- **Cycle (วงจร)**: เส้นทางที่เริ่มและจบที่จุดเดียวกัน
- **Connected Graph**: กราฟที่ทุกจุดยอดเชื่อมต่อกันได้
