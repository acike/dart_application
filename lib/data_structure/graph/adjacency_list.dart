/// การแทน Graph ด้วย Adjacency List (รายการประชิด)
/// วิธีนี้ใช้ memory น้อยและเหมาะกับ sparse graph
library;

/// คลาสสำหรับแทน Graph แบบ Undirected ด้วย Adjacency List
class UndirectedGraph {
  // ใช้ Map เพื่อเก็บ adjacency list
  // Key = vertex, Value = List ของ vertices ที่เชื่อมต่อ
  final Map<String, List<String>> _adjacencyList = {};

  /// เพิ่ม vertex ใหม่ลงใน graph
  void addVertex(String vertex) {
    // ถ้า vertex ยังไม่มี ให้สร้าง list ว่างสำหรับเก็บ neighbors
    if (!_adjacencyList.containsKey(vertex)) {
      _adjacencyList[vertex] = [];
      print('✅ เพิ่ม vertex "$vertex" สำเร็จ');
    } else {
      print('⚠️  vertex "$vertex" มีอยู่แล้ว');
    }
  }

  /// เพิ่ม edge ระหว่าง vertex1 และ vertex2
  void addEdge(String vertex1, String vertex2) {
    // ตรวจสอบว่า vertex ทั้งสองมีอยู่จริง
    if (!_adjacencyList.containsKey(vertex1)) {
      print('❌ vertex "$vertex1" ไม่พบ - เพิ่มอัตโนมัติ');
      addVertex(vertex1);
    }
    if (!_adjacencyList.containsKey(vertex2)) {
      print('❌ vertex "$vertex2" ไม่พบ - เพิ่มอัตโนมัติ');
      addVertex(vertex2);
    }

    // เพิ่ม edge ทั้งสองทิศทาง (เพราะเป็น undirected graph)
    _adjacencyList[vertex1]!.add(vertex2);
    _adjacencyList[vertex2]!.add(vertex1);

    print('✅ เพิ่ม edge ระหว่าง "$vertex1" และ "$vertex2" สำเร็จ');
  }

  /// ลบ edge ระหว่าง vertex1 และ vertex2
  void removeEdge(String vertex1, String vertex2) {
    if (_adjacencyList.containsKey(vertex1) &&
        _adjacencyList.containsKey(vertex2)) {
      _adjacencyList[vertex1]!.remove(vertex2);
      _adjacencyList[vertex2]!.remove(vertex1);
      print('✅ ลบ edge ระหว่าง "$vertex1" และ "$vertex2" สำเร็จ');
    } else {
      print('❌ ไม่พบ vertex หนึ่งหรือทั้งสอง');
    }
  }

  /// ลบ vertex และ edges ทั้งหมดที่เชื่อมต่อ
  void removeVertex(String vertex) {
    if (!_adjacencyList.containsKey(vertex)) {
      print('❌ vertex "$vertex" ไม่พบ');
      return;
    }

    // ลบ edges ทั้งหมดที่เชื่อมกับ vertex นี้
    for (String neighbor in _adjacencyList[vertex]!) {
      _adjacencyList[neighbor]!.remove(vertex);
    }

    // ลบ vertex ออกจาก graph
    _adjacencyList.remove(vertex);
    print('✅ ลบ vertex "$vertex" และ edges ที่เกี่ยวข้องสำเร็จ');
  }

  /// ตรวจสอบว่ามี edge ระหว่าง vertex1 และ vertex2 หรือไม่
  bool hasEdge(String vertex1, String vertex2) {
    if (_adjacencyList.containsKey(vertex1)) {
      return _adjacencyList[vertex1]!.contains(vertex2);
    }
    return false;
  }

  /// รับ neighbors ของ vertex
  List<String> getNeighbors(String vertex) {
    return _adjacencyList[vertex] ?? [];
  }

  /// รับ vertices ทั้งหมดใน graph
  List<String> getAllVertices() {
    return _adjacencyList.keys.toList();
  }

  /// นับจำนวน vertices
  int get vertexCount => _adjacencyList.length;

  /// นับจำนวน edges
  int get edgeCount {
    int total = 0;
    for (List<String> neighbors in _adjacencyList.values) {
      total += neighbors.length;
    }
    // หารด้วย 2 เพราะ undirected graph นับ edge ซ้ำ
    return total ~/ 2;
  }

  /// แสดง graph ในรูปแบบที่อ่านง่าย
  void display() {
    print('\n📊 Adjacency List Representation:');
    print('Vertices: $vertexCount, Edges: $edgeCount');
    print('─────────────────────────────────');

    if (_adjacencyList.isEmpty) {
      print('(Graph ว่าง)');
      return;
    }

    for (String vertex in _adjacencyList.keys) {
      String neighbors = _adjacencyList[vertex]!.join(', ');
      if (neighbors.isEmpty) neighbors = '(ไม่มี neighbors)';
      print('$vertex → [$neighbors]');
    }
  }
}

/// คลาสสำหรับแทน Graph แบบ Directed ด้วย Adjacency List
class DirectedGraph {
  final Map<String, List<String>> _adjacencyList = {};

  void addVertex(String vertex) {
    if (!_adjacencyList.containsKey(vertex)) {
      _adjacencyList[vertex] = [];
      print('✅ เพิ่ม vertex "$vertex" สำเร็จ');
    }
  }

  /// เพิ่ม directed edge จาก source ไป destination
  void addEdge(String source, String destination) {
    if (!_adjacencyList.containsKey(source)) {
      addVertex(source);
    }
    if (!_adjacencyList.containsKey(destination)) {
      addVertex(destination);
    }

    _adjacencyList[source]!.add(destination);
    print('✅ เพิ่ม directed edge: "$source" → "$destination"');
  }

  /// รับ out-degree (จำนวน edges ที่ออกจาก vertex)
  int getOutDegree(String vertex) {
    return _adjacencyList[vertex]?.length ?? 0;
  }

  /// รับ in-degree (จำนวน edges ที่เข้าสู่ vertex)
  int getInDegree(String vertex) {
    int count = 0;
    for (List<String> neighbors in _adjacencyList.values) {
      count += neighbors.where((v) => v == vertex).length;
    }
    return count;
  }

  void display() {
    print('\n📊 Directed Adjacency List:');
    print('Vertices: ${_adjacencyList.length}');
    print('─────────────────────────────');

    for (String vertex in _adjacencyList.keys) {
      String neighbors = _adjacencyList[vertex]!.join(', ');
      int inDegree = getInDegree(vertex);
      int outDegree = getOutDegree(vertex);

      if (neighbors.isEmpty) neighbors = '(ไม่มี)';
      print('$vertex → [$neighbors] (in: $inDegree, out: $outDegree)');
    }
  }
}

/// ตัวอย่างการใช้งาน
void main() {
  print('=== Adjacency List Demo ===\n');

  // ทดสอบ Undirected Graph
  testUndirectedGraph();

  print('\n${'=' * 50}\n');

  // ทดสอบ Directed Graph
  testDirectedGraph();
}

void testUndirectedGraph() {
  print('🔄 Undirected Graph Demo:');

  UndirectedGraph graph = UndirectedGraph();

  // เพิ่ม vertices
  graph.addVertex('A');
  graph.addVertex('B');
  graph.addVertex('C');
  graph.addVertex('D');

  // เพิ่ม edges
  print('\n➕ เพิ่ม edges:');
  graph.addEdge('A', 'B');
  graph.addEdge('A', 'C');
  graph.addEdge('B', 'D');
  graph.addEdge('C', 'D');

  // แสดงผล
  graph.display();

  // ทดสอบการตรวจสอบ edge
  print('\n🔍 ตรวจสอบ edges:');
  print('A-B connected? ${graph.hasEdge('A', 'B')}');
  print('A-D connected? ${graph.hasEdge('A', 'D')}');

  // ทดสอบการลบ
  print('\n➖ ลบ edge A-C:');
  graph.removeEdge('A', 'C');
  graph.display();
}

void testDirectedGraph() {
  print('➡️  Directed Graph Demo:');

  DirectedGraph graph = DirectedGraph();

  // สร้าง social network graph
  print('สร้าง Social Network (Twitter-like):');
  graph.addVertex('Alice');
  graph.addVertex('Bob');
  graph.addVertex('Charlie');
  graph.addVertex('Diana');

  // Alice follows Bob และ Charlie
  graph.addEdge('Alice', 'Bob');
  graph.addEdge('Alice', 'Charlie');

  // Bob follows Alice และ Diana
  graph.addEdge('Bob', 'Alice');
  graph.addEdge('Bob', 'Diana');

  // Charlie follows Diana
  graph.addEdge('Charlie', 'Diana');

  // Diana follows Alice
  graph.addEdge('Diana', 'Alice');

  graph.display();

  print('\n👥 Social Network Analysis:');
  print('Alice follows: ${graph._adjacencyList['Alice']}');
  print('Alice has ${graph.getInDegree('Alice')} followers');
  print('Alice follows ${graph.getOutDegree('Alice')} people');
}
