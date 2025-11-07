import 'binary_search_tree.dart';
import 'binary_tree.dart';
import 'tree_node.dart';

// เดโมสั้น ๆ สำหรับ BinaryTree และ BinarySearchTree
void main() {
  print('=== BinaryTree Traversal Demo ===');
  // แก้ปัญหา debugging ด้วยการลดความซับซ้อนของ type parameters
  final n1 = TreeNode<int>(value: 1);
  final n2 = TreeNode<int>(value: 2);
  final n3 = TreeNode<int>(value: 3);
  final n4 = TreeNode<int>(value: 4);
  final n5 = TreeNode<int>(value: 5);

  // สร้างโครงสร้าง
  //       1
  //      / \
  //     2   3
  //    / \
  //   4   5
  n1.left = n2;
  n2.parent = n1;
  n1.right = n3;
  n3.parent = n1;
  n2.left = n4;
  n4.parent = n2;
  n2.right = n5;
  n5.parent = n2;
  //
  final bt = BinaryTree<int>(root: n1);
  print('Preorder  : ${bt.preorder()}'); // [1, 2, 4, 5, 3]
  print('Inorder   : ${bt.inorder()}'); // [4, 2, 5, 1, 3]
  print('Postorder : ${bt.postorder()}'); // [4, 5, 2, 3, 1]
  print('LevelOrder: ${bt.levelOrder()}'); // [1, 2, 3, 4, 5]
  print('Height    : ${bt.height()}');
  print('Size      : ${bt.size()}');

  print('\n=== BinarySearchTree (BST) Demo ===');
  final bst = BinarySearchTree<int>();
  for (final int v in <int>[8, 3, 10, 1, 6, 14, 4, 7, 13]) {
    bst.insert(v);
  }
  print('Inorder (sorted): ${bst.inorder()}');

  // ทดสอบค้นหา
  print('Search 6 -> ${bst.search(6)?.value}');
  print('Min -> ${bst.minimum()?.value}, Max -> ${bst.maximum()?.value}');

  // ลบค่า แล้วพิมพ์ใหม่
  bst.delete(3);
  print('After delete(3): ${bst.inorder()}');
}
