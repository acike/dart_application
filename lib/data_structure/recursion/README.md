# 📁 Recursion - ฟังก์ชันเรียกตัวเอง

## 🎯 หัวข้อที่เรียน (Topics Covered)

**Recursion** คือการที่ฟังก์ชันเรียกตัวเองซ้ำๆ จนกว่าจะถึงเงื่อนไขที่หยุดการเรียกตัวเอง

### ส่วนประกอบสำคัญของ Recursion
1. **Base Case** - เงื่อนไขที่ทำให้หยุดเรียกตัวเอง
2. **Recursive Case** - เงื่อนไขที่ทำให้เรียกตัวเองต่อ
3. **Stack** - โครงสร้างข้อมูลที่ใช้เก็บการเรียกฟังก์ชัน
4. **LIFO** - Last In, First Out (เข้าทีหลัง ออกก่อน)

## 📚 ไฟล์ในโฟลเดอร์นี้ (Files in this Folder)

### 1. 🟢 **recursive_examples.dart** - พื้นฐาน
**ระดับ:** ผู้เริ่มต้น (Beginner)  
**เนื้อหา:** ตัวอย่างพื้นฐาน 10 แบบ
- Factorial (การหาค่าแฟกทอเรียล)
- Fibonacci (ลำดับฟีโบนัชชี)
- Array Sum (ผลรวมของอาร์เรย์)
- Find Max (หาค่าสูงสุด)
- Reverse String (กลับข้อความ)
- GCD (หาตัวหารร่วมมาก)
- Palindrome (ตรวจสอบพาลินโดรม)
- Power (ยกกำลัง)
- Sum of Digits (ผลรวมของหลัก)
- Decimal to Binary (แปลงเลขฐาน)

### 2. 🟡 **advanced_recursive_examples.dart** - ขั้นสูง
**ระดับ:** ปานกลาง (Intermediate)  
**เนื้อหา:** ตัวอย่างที่ซับซ้อนขึ้น
- Find Min (หาค่าต่ำสุด)
- Count Characters (นับตัวอักษร)
- Prime Number Check (ตรวจสอบเลขเฉพาะ)
- LCM (หาตัวคูณร่วมน้อย)
- Decimal to Octal (แปลงเลขฐานแปด)
- Array Operations (การทำงานกับอาร์เรย์)

### 3. 🔴 **exercise_solutions.dart** - เฉลยแบบฝึกหัด
**ระดับ:** ขั้นสูง (Advanced)  
**เนื้อหา:** เฉลยแบบฝึกหัดและเทคนิคขั้นสูง
- Tail Recursion (การเรียกตัวเองแบบหาง)
- Merge Sort (การเรียงลำดับแบบผสาน)
- Permutations (การเรียงสับเปลี่ยน)
- Subsets (การหาเซ็ตย่อย)
- Binary to Decimal (แปลงจากเลขฐานสองเป็นสิบ)

### 4. 🟠 **nested_list_sum.dart** - List ซ้อนกัน
**ระดับ:** ปานกลาง (Intermediate)  
**เนื้อหา:** การทำงานกับ List ที่มี List ซ้อนอยู่ข้างใน
- Nested Data Structures (โครงสร้างข้อมูลซ้อนกัน)
- Mixed Types (ชนิดข้อมูลผสม)
- Real-world Applications (การใช้งานจริง)

### 5. 🔵 **stack_demonstration.dart** - การทำงานของ Stack
**ระดับ:** ผู้เริ่มต้น (Beginner)  
**เนื้อหา:** แสดงการทำงานของ Stack และ LIFO
- Stack Visualization (การแสดงภาพ Stack)
- LIFO Demonstration (การแสดงการทำงานแบบ LIFO)
- Step-by-step Tracing (การติดตามทีละขั้นตอน)

## 🚀 วิธีการเรียนแบบเป็นระบบ (Learning Path)

### ขั้นที่ 1: เริ่มต้น
1. อ่าน README นี้ให้เข้าใจ
2. เริ่มจาก `stack_demonstration.dart` เพื่อเข้าใจแนวคิด
3. ลองรัน `recursive_examples.dart` ดูตัวอย่างพื้นฐาน

### ขั้นที่ 2: พัฒนา
4. ศึกษา `nested_list_sum.dart` สำหรับการทำงานกับข้อมูลซับซ้อน
5. ลองแก้ปัญหาใน `advanced_recursive_examples.dart`

### ขั้นที่ 3: เชี่ยวชาญ
6. ดูเฉลยใน `exercise_solutions.dart`
7. ลองเขียนโปรแกรมของตัวเองโดยใช้ความรู้ที่ได้

## 🏃‍♂️ วิธีการรันไฟล์ (How to Run)

```bash
# รันไฟล์พื้นฐาน
dart lib/data_structure/recursion/recursive_examples.dart

# รันการแสดงการทำงานของ Stack
dart lib/data_structure/recursion/stack_demonstration.dart

# รันตัวอย่างขั้นสูง
dart lib/data_structure/recursion/advanced_recursive_examples.dart

# รันตัวอย่าง Nested List
dart lib/data_structure/recursion/nested_list_sum.dart

# รันเฉลยแบบฝึกหัด
dart lib/data_structure/recursion/exercise_solutions.dart
```

## 🎯 จุดสำคัญที่ต้องจำ (Key Points to Remember)

### ✅ ข้อดีของ Recursion
- โค้ดสั้น อ่านง่าย
- เหมาะสำหรับปัญหาที่มีโครงสร้างแบบซ้ำ
- แก้ปัญหาซับซ้อนได้ง่าย

### ⚠️ ข้อควรระวัง
- ใช้หน่วยความจำมาก (Stack)
- อาจช้ากว่า Iterative
- เสี่ยง Stack Overflow

### 🔑 กฎทอง (Golden Rules)
1. **ต้องมี Base Case เสมอ** - มิฉะนั้นจะวนไปเรื่อยๆ
2. **ลดขนาดปัญหาในทุกครั้ง** - เพื่อให้เข้าใกล้ Base Case
3. **ทดสอบด้วยข้อมูลขนาดเล็กก่อน** - n=0, 1, 2

## 🧠 เคล็ดลับการเขียน (Writing Tips)

### การคิดแนวทางแก้ปัญหา
1. **คิด Base Case ก่อน** - เมื่อไหร่ควรหยุด?
2. **คิด Recursive Case** - ทำอย่างไรให้ปัญหาเล็กลง?
3. **ทดสอบด้วยตัวอย่างง่ายๆ** - ลากด้วยมือก่อน

### การ Debug
- ใส่ `print()` เพื่อดูการเรียกฟังก์ชัน
- ใช้ parameter เพิ่มเติมเพื่อติดตาม depth
- วาดภาพ Stack ในกระดาษ

## 🎮 แบบฝึกหัดเพิ่มเติม (Extra Exercises)

หลังจากเรียนจบแล้ว ลองเขียนฟังก์ชัน recursive สำหรับ:

1. **หา Length ของ String** (ไม่ใช้ .length)
2. **หา Product ของตัวเลขใน Array**
3. **ตรวจสอบว่า Array เรียงลำดับหรือไม่**
4. **หาจำนวน Vowels ใน String**
5. **แปลง Decimal เป็น Hexadecimal**

## 🌟 ข้อความจากอาจารย์

การเรียน Recursion เหมือนการเรียนขี่จักรยาน - ตอนแรกอาจงง แต่เมื่อเข้าใจแล้วจะใช้ได้ตลอดชีวิต! 

Remember: **Every expert was once a beginner** 💪

---
**Happy Coding!** 🚀 