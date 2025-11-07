import 'dart:collection';
import 'adjacency_list.dart';

/// การท่องกราฟ (Graph Traversal) ด้วย BFS และ DFS
/// ใช้สำหรับค้นหา, วิเคราะห์, และประมวลผลข้อมูลในกราฟ

/// คลาสสำหรับการท่องกราฟ
class GraphTraversal {
  final UndirectedGraph _graph;

  GraphTraversal(this._graph);

  /// Breadth-First Search (BFS) - ค้นหาแบบกว้างก่อน
  /// เหมือนการขยายออกเป็นวงกลมจากจุดเริ่มต้น
  List<String> bfs(String startVertex) {
    if (!_graph.getAllVertices().contains(startVertex)) {
      print('❌ vertex "$startVertex" ไม่พบในกราฟ');
      return [];
    }

    print('\n🔍 BFS starting from "$startVertex":');

    List<String> visited = []; // ลำดับการเยี่ยมชม
    Set<String> visitedSet = {}; // เช็คว่าเยี่ยมชมแล้วหรือยัง
    Queue<String> queue = Queue(); // คิวสำหรับ BFS

    // เริ่มต้นจาก startVertex
    queue.add(startVertex);
    visitedSet.add(startVertex);

    while (queue.isNotEmpty) {
      String current = queue.removeFirst();
      visited.add(current);
      print('🚶 เยี่ยมชม: $current');

      // เพิ่ม neighbors ทั้งหมดลงในคิว
      List<String> neighbors = _graph.getNeighbors(current);
      for (String neighbor in neighbors) {
        if (!visitedSet.contains(neighbor)) {
          queue.add(neighbor);
          visitedSet.add(neighbor);
          print('   📋 เพิ่ม "$neighbor" ลงคิว');
        }
      }

      print('   📊 คิวปัจจุบัน: ${queue.toList()}');
    }

    print('✅ BFS เสร็จสิ้น: ${visited.join(' → ')}');
    return visited;
  }

  /// Depth-First Search (DFS) - ค้นหาแบบลึกก่อน
  /// เหมือนการสำรวจทางเดินในเขาวงกต
  List<String> dfs(String startVertex) {
    if (!_graph.getAllVertices().contains(startVertex)) {
      print('❌ vertex "$startVertex" ไม่พบในกราฟ');
      return [];
    }

    print('\n🔍 DFS starting from "$startVertex":');

    List<String> visited = [];
    Set<String> visitedSet = {};

    _dfsHelper(startVertex, visited, visitedSet);

    print('✅ DFS เสร็จสิ้น: ${visited.join(' → ')}');
    return visited;
  }

  /// Helper function สำหรับ DFS (recursive)
  void _dfsHelper(String vertex, List<String> visited, Set<String> visitedSet) {
    visitedSet.add(vertex);
    visited.add(vertex);
    print('🚶 เยี่ยมชม: $vertex');

    List<String> neighbors = _graph.getNeighbors(vertex);
    for (String neighbor in neighbors) {
      if (!visitedSet.contains(neighbor)) {
        print('   🔽 ลงลึกไป "$neighbor"');
        _dfsHelper(neighbor, visited, visitedSet);
      }
    }
  }

  /// DFS แบบ iterative (ใช้ Stack แทน recursion)
  List<String> dfsIterative(String startVertex) {
    if (!_graph.getAllVertices().contains(startVertex)) {
      print('❌ vertex "$startVertex" ไม่พบในกราฟ');
      return [];
    }

    print('\n🔍 DFS Iterative starting from "$startVertex":');

    List<String> visited = [];
    Set<String> visitedSet = {};
    List<String> stack = []; // ใช้ List เป็น Stack

    stack.add(startVertex);

    while (stack.isNotEmpty) {
      String current = stack.removeLast(); // Pop จาก stack

      if (!visitedSet.contains(current)) {
        visitedSet.add(current);
        visited.add(current);
        print('🚶 เยี่ยมชม: $current');

        // เพิ่ม neighbors ลง stack (reverse order เพื่อให้ได้ผลเหมือน recursive)
        List<String> neighbors = _graph.getNeighbors(current);
        for (int i = neighbors.length - 1; i >= 0; i--) {
          String neighbor = neighbors[i];
          if (!visitedSet.contains(neighbor)) {
            stack.add(neighbor);
            print('   📚 เพิ่ม "$neighbor" ลง stack');
          }
        }

        print('   📊 stack ปัจจุบัน: $stack');
      }
    }

    print('✅ DFS Iterative เสร็จสิ้น: ${visited.join(' → ')}');
    return visited;
  }

  /// หาเส้นทางระหว่าง 2 vertices ด้วย BFS
  List<String>? findPath(String start, String end) {
    if (!_graph.getAllVertices().contains(start) ||
        !_graph.getAllVertices().contains(end)) {
      print('❌ vertex ไม่พบในกราฟ');
      return null;
    }

    if (start == end) return [start];

    print('\n🎯 หาเส้นทางจาก "$start" ไป "$end":');

    Queue<String> queue = Queue();
    Set<String> visited = {};
    Map<String, String> parent = {}; // เก็บ parent เพื่อ reconstruct path

    queue.add(start);
    visited.add(start);

    while (queue.isNotEmpty) {
      String current = queue.removeFirst();
      print('🔍 ตรวจสอบ: $current');

      if (current == end) {
        // พบเส้นทางแล้ว - reconstruct path
        List<String> path = [];
        String? node = end;

        while (node != null) {
          path.insert(0, node);
          node = parent[node];
        }

        print('✅ พบเส้นทาง: ${path.join(' → ')}');
        return path;
      }

      for (String neighbor in _graph.getNeighbors(current)) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          parent[neighbor] = current;
          queue.add(neighbor);
          print('   📍 เพิ่ม "$neighbor" (parent: $current)');
        }
      }
    }

    print('❌ ไม่พบเส้นทางจาก "$start" ไป "$end"');
    return null;
  }

  /// ตรวจสอบว่ากราฟเชื่อมต่องันหรือไม่ (Connected Graph)
  bool isConnected() {
    List<String> allVertices = _graph.getAllVertices();
    if (allVertices.isEmpty) return true;

    // ใช้ DFS จากจุดแรก
    List<String> visited = dfs(allVertices.first);

    bool connected = visited.length == allVertices.length;
    print('\n🔗 กราฟ${connected ? "เชื่อมต่อ" : "ไม่เชื่อมต่อ"}กันทั้งหมด');
    print('   เยี่ยมชมได้: ${visited.length}/${allVertices.length} vertices');

    return connected;
  }

  /// หา Connected Components (กลุ่มที่เชื่อมต่อกัน)
  List<List<String>> findConnectedComponents() {
    List<String> allVertices = _graph.getAllVertices();
    Set<String> globalVisited = {};
    List<List<String>> components = [];

    print('\n🧩 หา Connected Components:');

    for (String vertex in allVertices) {
      if (!globalVisited.contains(vertex)) {
        print('\n🔍 Component ${components.length + 1} เริ่มจาก "$vertex":');

        // DFS เพื่อหาทุก vertex ใน component นี้
        List<String> componentVertices = [];
        Set<String> componentVisited = {};
        _dfsHelper(vertex, componentVertices, componentVisited);

        components.add(componentVertices);
        globalVisited.addAll(componentVisited);

        print('   ✅ Component: ${componentVertices.join(', ')}');
      }
    }

    print('\n📊 สรุป: พบ ${components.length} connected components');
    return components;
  }
}

/// ตัวอย่างการใช้งาน
void main() {
  print('=== Graph Traversal Demo ===\n');

  // สร้างกราฟตัวอย่าง
  createAndTestTraversal();

  print('\n${'=' * 60}\n');

  // ทดสอบการหาเส้นทาง
  testPathFinding();

  print('\n${'=' * 60}\n');

  // ทดสอบ Connected Components
  testConnectedComponents();
}

void createAndTestTraversal() {
  print('🏗️  สร้างกราฟสำหรับทดสอบ:');

  UndirectedGraph graph = UndirectedGraph();

  // เพิ่ม vertices (เหมือนสถานีรถไฟฟ้า)
  for (var station in [
    'Siam',
    'Chitlom',
    'Ploenchit',
    'Nana',
    'Asok',
    'Phromphong',
  ]) {
    graph.addVertex(station);
  }

  // เพิ่ม edges (เส้นทางรถไฟฟ้า)
  graph.addEdge('Siam', 'Chitlom');
  graph.addEdge('Chitlom', 'Ploenchit');
  graph.addEdge('Ploenchit', 'Nana');
  graph.addEdge('Nana', 'Asok');
  graph.addEdge('Asok', 'Phromphong');
  graph.addEdge('Siam', 'Asok'); // สายสีน้ำเงิน

  graph.display();

  // ทดสอบ traversal
  GraphTraversal traversal = GraphTraversal(graph);

  traversal.bfs('Siam');
  traversal.dfs('Siam');
  traversal.dfsIterative('Siam');
}

void testPathFinding() {
  print('🎯 ทดสอบการหาเส้นทาง:');

  UndirectedGraph socialNetwork = UndirectedGraph();

  // เครือข่ายเพื่อน
  for (var person in ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve', 'Frank']) {
    socialNetwork.addVertex(person);
  }

  socialNetwork.addEdge('Alice', 'Bob');
  socialNetwork.addEdge('Alice', 'Charlie');
  socialNetwork.addEdge('Bob', 'Diana');
  socialNetwork.addEdge('Charlie', 'Eve');
  socialNetwork.addEdge('Diana', 'Frank');
  socialNetwork.addEdge('Eve', 'Frank');

  socialNetwork.display();

  GraphTraversal socialTraversal = GraphTraversal(socialNetwork);

  // หาเส้นทางระหว่างเพื่อน
  socialTraversal.findPath('Alice', 'Frank');
  socialTraversal.findPath('Bob', 'Eve');
  socialTraversal.findPath('Alice', 'Alice');
}

void testConnectedComponents() {
  print('🧩 ทดสอบ Connected Components:');

  UndirectedGraph separateGroups = UndirectedGraph();

  // กลุ่มที่ 1: เพื่อนๆ ในมหาวิทยาลัย
  for (var student in ['Alice', 'Bob', 'Charlie']) {
    separateGroups.addVertex(student);
  }
  separateGroups.addEdge('Alice', 'Bob');
  separateGroups.addEdge('Bob', 'Charlie');

  // กลุ่มที่ 2: เพื่อนๆ ในที่ทำงาน
  for (var worker in ['Diana', 'Eve']) {
    separateGroups.addVertex(worker);
  }
  separateGroups.addEdge('Diana', 'Eve');

  // คนโดดเดี่ยว
  separateGroups.addVertex('Frank');

  separateGroups.display();

  GraphTraversal groupTraversal = GraphTraversal(separateGroups);
  groupTraversal.isConnected();
  groupTraversal.findConnectedComponents();
}
