// การสร้างโครงสร้างกราฟสำหรับใช้แสดงตัวอย่าง BFS และ DFS
class Graph {
  // แต่ละ node จะเก็บรายการเพื่อนบ้านที่เชื่อมต่อกัน
  Map<String, List<String>> adjList = {};

  // เพิ่ม node ใหม่ในกราฟ
  void addNode(String node) {
    if (!adjList.containsKey(node)) {
      adjList[node] = [];
    }
  }

  // เพิ่ม edge ระหว่าง node
  void addEdge(String src, String dest) {
    // เพิ่ม node ถ้ายังไม่มี
    addNode(src);
    addNode(dest);

    // เพิ่มความเชื่อมโยงระหว่าง node
    adjList[src]!.add(dest);
    // สำหรับกราฟไม่มีทิศทาง ให้เพิ่มเส้นเชื่อมทั้งสองทาง
    // adjList[dest]!.add(src);
  }

  // แสดงโครงสร้างกราฟ
  void printGraph() {
    adjList.forEach((node, neighbors) {
      print('$node -> ${neighbors.join(', ')}');
    });
  }

  // BFS - Breadth First Search (การค้นหาแบบกว้างก่อน)
  List<String> bfs(String startNode) {
    List<String> result = []; // เก็บลำดับการเข้าถึง node
    Set<String> visited = {}; // เก็บ node ที่เยี่ยมชมแล้ว
    List<String> queue = []; // คิวสำหรับ BFS

    // เริ่มต้นด้วย node แรก
    visited.add(startNode);
    queue.add(startNode);

    print('เริ่มการค้นหาแบบ BFS จาก node $startNode');

    while (queue.isNotEmpty) {
      // นำ node ออกจากคิวตามหลัก FIFO (First In First Out)
      String currentNode = queue.removeAt(0);
      result.add(currentNode);

      print('กำลังเยี่ยมชม node: $currentNode');

      // เยี่ยมชมเพื่อนบ้านทั้งหมดของ node ปัจจุบัน
      for (String neighbor in adjList[currentNode]!) {
        if (!visited.contains(neighbor)) {
          print(
            '  พบ node เพื่อนบ้านที่ยังไม่เคยเยี่ยมชม: $neighbor, เพิ่มเข้าคิว',
          );
          visited.add(neighbor);
          queue.add(neighbor);
        } else {
          print('  node เพื่อนบ้าน: $neighbor เคยเยี่ยมชมแล้ว, ข้ามไป');
        }
      }

      print('สถานะคิวปัจจุบัน: $queue');
      print('-------------------');
    }

    return result;
  }

  // DFS - Depth First Search (การค้นหาแบบลึกก่อน) - แบบ Recursive
  List<String> dfs(String startNode) {
    List<String> result = [];
    Set<String> visited = {};

    print('เริ่มการค้นหาแบบ DFS จาก node $startNode');

    // ฟังก์ชันเรียกซ้ำสำหรับ DFS
    void dfsRecursive(String node) {
      // ทำเครื่องหมายว่าเยี่ยมชม node นี้แล้ว
      visited.add(node);
      result.add(node);

      print('กำลังเยี่ยมชม node: $node');

      // เยี่ยมชมเพื่อนบ้านแต่ละตัวแบบลึกก่อน
      for (String neighbor in adjList[node]!) {
        if (!visited.contains(neighbor)) {
          print(
            '  เจอ node เพื่อนบ้านที่ยังไม่เคยเยี่ยมชม: $neighbor, ดำเนินการลงลึกต่อ',
          );
          dfsRecursive(neighbor);
        } else {
          print('  node เพื่อนบ้าน: $neighbor เคยเยี่ยมชมแล้ว, ข้ามไป');
        }
      }

      print('กลับจาก node: $node');
      print('-------------------');
    }

    // เริ่มต้น DFS
    dfsRecursive(startNode);
    return result;
  }

  // DFS แบบใช้ Stack (ไม่ใช้การเรียกซ้ำ)
  List<String> dfsIterative(String startNode) {
    List<String> result = [];
    Set<String> visited = {};
    List<String> stack = []; // ใช้ stack สำหรับ DFS แบบ iterative

    // เริ่มต้นด้วย node แรก
    stack.add(startNode);

    print('เริ่มการค้นหาแบบ DFS แบบ Iterative จาก node $startNode');

    while (stack.isNotEmpty) {
      // นำ node ออกจาก stack ตามหลัก LIFO (Last In First Out)
      String currentNode = stack.removeLast();

      // ข้ามถ้าเคยเยี่ยมชมแล้ว
      if (visited.contains(currentNode)) {
        continue;
      }

      // ทำเครื่องหมายว่าเยี่ยมชมแล้ว
      visited.add(currentNode);
      result.add(currentNode);

      print('กำลังเยี่ยมชม node: $currentNode');

      // เพิ่มเพื่อนบ้านเข้า stack (เพิ่มในลำดับย้อนกลับเพื่อให้ได้ลำดับการเยี่ยมชมที่ถูกต้อง)
      List<String> neighbors = adjList[currentNode]!;
      for (int i = neighbors.length - 1; i >= 0; i--) {
        String neighbor = neighbors[i];
        if (!visited.contains(neighbor)) {
          print('  เพิ่ม node เพื่อนบ้าน: $neighbor เข้า stack');
          stack.add(neighbor);
        } else {
          print('  node เพื่อนบ้าน: $neighbor เคยเยี่ยมชมแล้ว, ข้ามไป');
        }
      }

      print('สถานะ stack ปัจจุบัน: $stack');
      print('-------------------');
    }

    return result;
  }
}

// ฟังก์ชันหลักสำหรับการทดสอบ
void main() {
  // สร้างกราฟตามตัวอย่าง:
  //       A
  //     /   \
  //    B     C
  //   / \   / \
  //  D   E F   G

  Graph graph = Graph();

  // สร้างความเชื่อมโยงระหว่าง node ต่างๆ
  graph.addEdge('A', 'B');
  graph.addEdge('A', 'C');
  graph.addEdge('B', 'D');
  graph.addEdge('B', 'E');
  graph.addEdge('C', 'F');
  graph.addEdge('C', 'G');

  print('โครงสร้างกราฟ:');
  graph.printGraph();
  print('\n');

  // ทดสอบ BFS
  print('========== BFS ==========');
  List<String> bfsResult = graph.bfs('A');
  print('ผลลัพธ์ BFS: ${bfsResult.join(' -> ')}');
  print('\n');

  // ทดสอบ DFS แบบ Recursive
  print('========== DFS (Recursive) ==========');
  List<String> dfsResult = graph.dfs('A');
  print('ผลลัพธ์ DFS (Recursive): ${dfsResult.join(' -> ')}');
  print('\n');

  // ทดสอบ DFS แบบ Iterative
  print('========== DFS (Iterative) ==========');
  List<String> dfsIterativeResult = graph.dfsIterative('A');
  print('ผลลัพธ์ DFS (Iterative): ${dfsIterativeResult.join(' -> ')}');

  // ตัวอย่างเพิ่มเติม: ทดสอบกับกราฟที่มีรูปแบบซับซ้อนมากขึ้น
  print('\n\n========== ตัวอย่างเพิ่มเติม: กราฟซับซ้อน ==========');
  Graph complexGraph = Graph();

  // สร้างกราฟแบบซับซ้อนมากขึ้น
  complexGraph.addEdge('A', 'B');
  complexGraph.addEdge('A', 'C');
  complexGraph.addEdge('B', 'D');
  complexGraph.addEdge('C', 'E');
  complexGraph.addEdge('D', 'F');
  complexGraph.addEdge('E', 'F');
  complexGraph.addEdge('F', 'G');

  print('โครงสร้างกราฟซับซ้อน:');
  complexGraph.printGraph();
  print('\n');

  print('BFS จากกราฟซับซ้อน:');
  print(complexGraph.bfs('A').join(' -> '));

  print('\nDFS จากกราฟซับซ้อน:');
  print(complexGraph.dfs('A').join(' -> '));
}
