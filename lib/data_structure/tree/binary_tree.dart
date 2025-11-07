import 'tree_node.dart';

// โครงสร้าง Binary Tree ทั่วไป (ไม่ใช่ BST)
// มีเมธอดช่วยเดินต้นไม้ (traversal) และคำนวณคุณสมบัติต่างๆ

class BinaryTree<T> {
  TreeNode<T>? root;

  BinaryTree({this.root});

  // ความสูงของต้นไม้ (height): จำนวนขอบ (edges) ยาวที่สุดจาก root ไปใบ
  // ถ้าไม่มีโหนดเลย ให้เป็น -1 ตามคำนิยามทั่วไปของความสูงว่างเปล่า
  int height() => _height(root);

  int _height(TreeNode<T>? node) {
    if (node == null) return -1;
    final int leftHeight = _height(node.left);
    final int rightHeight = _height(node.right);
    return 1 + (leftHeight > rightHeight ? leftHeight : rightHeight);
  }

  // นับจำนวนโหนดทั้งหมด
  int size() => _size(root);

  int _size(TreeNode<T>? node) {
    if (node == null) return 0;
    return 1 + _size(node.left) + _size(node.right);
  }

  // Traversal แบบต่าง ๆ
  // 1) Preorder: root -> left -> right
  List<T> preorder() {
    final List<T> result = <T>[];
    void dfs(TreeNode<T>? node) {
      if (node == null) return;
      result.add(node.value);
      dfs(node.left);
      dfs(node.right);
    }

    dfs(root);
    return result;
  }

  // 2) Inorder: left -> root -> right
  List<T> inorder() {
    final List<T> result = <T>[];
    void dfs(TreeNode<T>? node) {
      if (node == null) return;
      dfs(node.left);
      result.add(node.value);
      dfs(node.right);
    }

    dfs(root);
    return result;
  }

  // 3) Postorder: left -> right -> root
  List<T> postorder() {
    final List<T> result = <T>[];
    void dfs(TreeNode<T>? node) {
      if (node == null) return;
      dfs(node.left);
      dfs(node.right);
      result.add(node.value);
    }

    dfs(root);
    return result;
  }

  // 4) Level-order (Breadth-first traversal)
  List<T> levelOrder() {
    final List<T> result = <T>[];
    final List<TreeNode<T>> queue = <TreeNode<T>>[];
    if (root != null) queue.add(root!);
    while (queue.isNotEmpty) {
      final TreeNode<T> current = queue.removeAt(0);
      result.add(current.value);
      if (current.left != null) queue.add(current.left!);
      if (current.right != null) queue.add(current.right!);
    }
    return result;
  }
}
