import 'tree_node.dart';

// Binary Search Tree (BST)
// คุณสมบัติหลัก: ค่าน้อยกว่าอยู่ซ้าย, มากกว่าหรือเท่ากับอยู่ขวา

class BinarySearchTree<T extends Comparable<Object?>> {
  TreeNode<T>? root;

  bool get isEmpty => root == null;

  // แทรกค่าใหม่ตามกฎ BST
  void insert(T value) {
    if (root == null) {
      root = TreeNode<T>(value: value);
      return;
    }
    TreeNode<T> current = root!;
    while (true) {
      if (value.compareTo(current.value) < 0) {
        // ไปทางซ้าย
        if (current.left == null) {
          current.left = TreeNode<T>(value: value, parent: current);
          return;
        }
        current = current.left!;
      } else {
        // ไปทางขวา (รวมเท่ากับ)
        if (current.right == null) {
          current.right = TreeNode<T>(value: value, parent: current);
          return;
        }
        current = current.right!;
      }
    }
  }

  // ค้นหาค่าใน BST, คืนโหนดถ้าพบ
  TreeNode<T>? search(T value) {
    TreeNode<T>? current = root;
    while (current != null) {
      final int cmp = value.compareTo(current.value);
      if (cmp == 0) return current;
      current = cmp < 0 ? current.left : current.right;
    }
    return null;
  }

  // หาค่า minimum (ซ้ายสุด)
  TreeNode<T>? minimum([TreeNode<T>? start]) {
    TreeNode<T>? node = start ?? root;
    if (node == null) return null;
    while (node!.left != null) {
      node = node.left;
    }
    return node;
  }

  // หาค่า maximum (ขวาสุด)
  TreeNode<T>? maximum([TreeNode<T>? start]) {
    TreeNode<T>? node = start ?? root;
    if (node == null) return null;
    while (node!.right != null) {
      node = node.right;
    }
    return node;
  }

  // ลบค่าออกจาก BST
  bool delete(T value) {
    final TreeNode<T>? node = search(value);
    if (node == null) return false;

    // กรณีที่ 1: เป็นใบ
    if (node.left == null && node.right == null) {
      _replaceNodeInParent(node, null);
      return true;
    }

    // กรณีที่ 2: มีลูกเดียว
    if (node.left == null && node.right != null) {
      _replaceNodeInParent(node, node.right);
      return true;
    } else if (node.left != null && node.right == null) {
      _replaceNodeInParent(node, node.left);
      return true;
    }

    // กรณีที่ 3: มีลูกสองคน → ใช้ in-order successor (ค่าต่ำสุดในขวา)
    final TreeNode<T> successor = minimum(node.right)!;
    node.value = successor.value;
    // ลบ successor ซึ่งต้องมีลูกไม่เกินหนึ่ง
    _replaceNodeInParent(successor, successor.right);
    return true;
  }

  // Inorder traversal คืนค่าเรียงจากน้อยไปมาก
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

  // ช่วยเปลี่ยนการชี้ของ parent ขณะลบโหนด
  void _replaceNodeInParent(TreeNode<T> node, TreeNode<T>? newChild) {
    if (node.parent == null) {
      root = newChild;
      if (newChild != null) newChild.parent = null;
      return;
    }
    final TreeNode<T> parent = node.parent!;
    if (parent.left == node) {
      parent.left = newChild;
    } else {
      parent.right = newChild;
    }
    if (newChild != null) newChild.parent = parent;
  }
}
