# 📁 Data Structures & Algorithms - โครงสร้างข้อมูลและอัลกอริธึม

## 🎯 ภาพรวม (Overview)

โฟลเดอร์นี้ประกอบด้วยความรู้เกี่ยวกับ **Data Structures** และ **Algorithms** ที่จำเป็นสำหรับการเขียนโปรแกรม โดยจัดแบ่งเป็นหัวข้อต่างๆ เพื่อให้เรียนรู้ได้อย่างเป็นระบบ

## 📚 โครงสร้างโฟลเดอร์ (Folder Structure)

```
lib/data_structure/
├── 📁 recursion/           # ฟังก์ชันเรียกตัวเอง (Recursion)
│   ├── recursive_examples.dart
│   ├── advanced_recursive_examples.dart
│   ├── exercise_solutions.dart
│   ├── nested_list_sum.dart
│   ├── stack_demonstration.dart
│   └── README.md
│
├── 📄 README.md            # ไฟล์นี้
│
└── 📁 [หัวข้ือื่นๆ จะเพิ่มในอนาคต]
    ├── 📁 sorting/         # อัลกอริธึมการเรียงลำดับ
    ├── 📁 searching/       # อัลกอริธึมการค้นหา
    ├── 📁 trees/           # โครงสร้างข้อมูลแบบต้นไม้
    ├── 📁 graphs/          # โครงสร้างข้อมูลแบบกราฟ
    └── 📁 dynamic_programming/  # การโปรแกรมแบบไดนามิก
```

## 🗂️ หัวข้อที่มีในปัจจุบัน (Available Topics)

### 1. 🔄 **Recursion** - ฟังก์ชันเรียกตัวเอง
**ตำแหน่ง:** `lib/data_structure/recursion/`  
**ระดับ:** ผู้เริ่มต้น → ขั้นสูง  
**เนื้อหา:**
- พื้นฐาน Recursion และ Stack
- ตัวอย่างพื้นฐาน (Factorial, Fibonacci, etc.)
- ตัวอย่างขั้นสูง (Merge Sort, Permutations)
- การทำงานกับ Nested Data Structures
- เฉลยแบบฝึกหัดและเทคนิคขั้นสูง

**ไฟล์สำคัญ:**
- `recursive_examples.dart` - ตัวอย่างพื้นฐาน 10 แบบ
- `stack_demonstration.dart` - การแสดงการทำงานของ Stack
- `nested_list_sum.dart` - การทำงานกับ List ซ้อนกัน
- `advanced_recursive_examples.dart` - ตัวอย่างขั้นสูง
- `exercise_solutions.dart` - เฉลยแบบฝึกหัดและเทคนิคขั้นสูง

**วิธีเริ่มต้น:**
```bash
# เริ่มจากการเข้าใจ Stack และ LIFO
dart lib/data_structure/recursion/stack_demonstration.dart

# จากนั้นลองตัวอย่างพื้นฐาน
dart lib/data_structure/recursion/recursive_examples.dart
```

## 🚀 วิธีการเรียนแบบเป็นระบบ (Learning Path)

### ขั้นที่ 1: Fundamentals (พื้นฐาน)
1. **Recursion** - เริ่มจากการเข้าใจฟังก์ชันเรียกตัวเอง
   - เรียนรู้ Base Case และ Recursive Case
   - เข้าใจการทำงานของ Stack และ LIFO
   - ฝึกด้วยตัวอย่างพื้นฐาน

### ขั้นที่ 2: Intermediate (ปานกลาง)
2. **Advanced Recursion** - เทคนิคขั้นสูง
   - Tail Recursion
   - การทำงานกับ Nested Data Structures
   - Divide and Conquer

### ขั้นที่ 3: Advanced (ขั้นสูง)
3. **Algorithm Design** - การออกแบบอัลกอริธึม
   - Dynamic Programming
   - Backtracking
   - Tree and Graph Algorithms

## 🎯 หัวข้อที่จะเพิ่มในอนาคต (Coming Soon)

### 📊 **Sorting Algorithms** - อัลกอริธึมการเรียงลำดับ
- Bubble Sort, Selection Sort, Insertion Sort
- Merge Sort, Quick Sort, Heap Sort
- การเปรียบเทียบประสิทธิภาพ

### 🔍 **Searching Algorithms** - อัลกอริธึมการค้นหา
- Linear Search, Binary Search
- Hash Tables และ Hash Functions
- การค้นหาในโครงสร้างข้อมูลต่างๆ

### 🌳 **Tree Data Structures** - โครงสร้างข้อมูลแบบต้นไม้
- Binary Trees, Binary Search Trees
- AVL Trees, Red-Black Trees
- Tree Traversal (Preorder, Inorder, Postorder)

### 🕸️ **Graph Algorithms** - อัลกอริธึมกราฟ
- Graph Representation
- BFS (Breadth-First Search)
- DFS (Depth-First Search)
- Shortest Path Algorithms

### ⚡ **Dynamic Programming** - การโปรแกรมแบบไดนามิก
- Memoization
- Tabulation
- การแก้ปัญหาแบบ Bottom-up และ Top-down

## 🛠️ เครื่องมือที่ใช้ (Tools Used)

- **Language:** Dart
- **IDE:** Any text editor or IDE that supports Dart
- **Running:** Dart CLI (`dart filename.dart`)

## 📖 คำแนะนำการเรียน (Study Tips)

### ✅ วิธีเรียนที่ดี
1. **อ่าน README ในแต่ละโฟลเดอร์ก่อน** - เพื่อเข้าใจภาพรวม
2. **รันโค้ดจริง** - อย่าแค่อ่าน ต้องลองรัน
3. **วาดภาพประกอบ** - ช่วยให้เข้าใจได้ง่ายขึ้น
4. **ลองแก้โจทย์เอง** - ก่อนดูเฉลย
5. **สร้างโปรเจ็คเล็กๆ** - นำความรู้ไปใช้จริง

### ⚠️ สิ่งที่ควรหลีกเลี่ยง
- อย่าท่องจำแต่ไม่เข้าใจ
- อย่าข้ามขั้นตอนพื้นฐาน
- อย่าเปรียบเทียบตัวเองกับคนอื่น
- อย่าเรียนหลายอย่างพร้อมกัน

## 🎮 แบบฝึกหัดท้าทาย (Challenge Exercises)

เมื่อเรียนจบแต่ละหัวข้อแล้ว ลองท้าทายตัวเองด้วย:

1. **เขียนโปรแกรมเกม Tic-Tac-Toe** ด้วย Recursion
2. **สร้าง Calculator** ที่ประเมินนิพจน์ทางคณิตศาสตร์
3. **เขียนโปรแกรมจัดการไฟล์** ในโฟลเดอร์ซ้อนกัน
4. **สร้าง Family Tree** ด้วยโครงสร้างข้อมูลแบบต้นไม้
5. **เขียนโปรแกรมหาเส้นทาง** ใน Map

## 🌟 ข้อความจากอาจารย์

การเรียน Data Structures & Algorithms เป็นการลงทุนที่คุ้มค่าที่สุดสำหรับโปรแกรมเมอร์ 

**จำไว้ว่า:**
- ความเข้าใจสำคัญกว่าความเร็ว
- การฝึกฝนสม่ำเสมอสำคัญกว่าการเรียนแบบเร่งรีบ
- การแก้ปัญหาด้วยตัวเองจะสร้างทักษะที่แท้จริง

**"The best way to learn programming is by writing programs."** 💻

---

**Happy Learning!** 🎓✨

## 📞 ติดต่อและช่วยเหลือ

หากมีคำถามหรือต้องการความช่วยเหลือ:
- อ่าน README ในแต่ละโฟลเดอร์เพิ่มเติม
- ลองรันโค้ดและดู output
- ศึกษาจาก comments ในไฟล์
- ฝึกฝนด้วยแบบฝึกหัดเพิ่มเติม 