// โหนดของ Binary Tree พื้นฐาน (TreeNode)
// - เก็บค่า (value)
// - ชี้ไปยังซ้าย (left) และขวา (right)
// - ออปชัน: อ้างอิง parent เพื่อใช้คำนวณหรือเดินย้อนกลับได้ง่ายขึ้น

class TreeNode<T> {
  T value;
  TreeNode<T>? left;
  TreeNode<T>? right;
  TreeNode<T>? parent;

  TreeNode({required this.value, this.left, this.right, this.parent});

  // เป็นใบหรือไม่ (ไม่มีลูกซ้ายและขวา)
  bool get isLeaf => left == null && right == null;

  // จำนวนลูกของโหนดนี้ (0, 1, 2)
  int get degree => (left != null ? 1 : 0) + (right != null ? 1 : 0);
}
