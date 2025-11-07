/// การแทน Graph ด้วย Adjacency Matrix (เมทริกซ์ประชิด)
/// เหมาะกับ dense graph และการตรวจสอบ edge ที่รวดเร็ว
library;

/// คลาสสำหรับแทน Graph ด้วย Adjacency Matrix
class GraphMatrix {
  late List<List<int>> _matrix; // เมทริกซ์ 2 มิติ
  late Map<String, int> _vertexToIndex; // แปลง vertex name เป็น index
  late Map<int, String> _indexToVertex; // แปลง index เป็น vertex name
  late int _vertexCount;
  late bool _isDirected;

  /// สร้าง graph ใหม่
  /// [maxVertices] จำนวน vertices สูงสุด
  /// [isDirected] true = directed graph, false = undirected graph
  GraphMatrix({required int maxVertices, required bool isDirected}) {
    _vertexCount = 0;
    _isDirected = isDirected;
    _vertexToIndex = {};
    _indexToVertex = {};

    // สร้างเมทริกซ์ที่เต็มไปด้วย 0 (ไม่มี edge)
    _matrix = List.generate(maxVertices, (i) => List.filled(maxVertices, 0));

    print(
      '✅ สร้าง ${isDirected ? "Directed" : "Undirected"} Graph Matrix (${maxVertices}x$maxVertices)',
    );
  }

  /// เพิ่ม vertex ใหม่
  bool addVertex(String vertex) {
    if (_vertexToIndex.containsKey(vertex)) {
      print('⚠️  vertex "$vertex" มีอยู่แล้ว');
      return false;
    }

    if (_vertexCount >= _matrix.length) {
      print('❌ เกินจำนวน vertices สูงสุด');
      return false;
    }

    _vertexToIndex[vertex] = _vertexCount;
    _indexToVertex[_vertexCount] = vertex;
    _vertexCount++;

    print('✅ เพิ่ม vertex "$vertex" (index: ${_vertexCount - 1})');
    return true;
  }

  /// เพิ่ม edge ระหว่าง vertex1 และ vertex2
  /// [weight] น้ำหนักของ edge (default = 1)
  bool addEdge(String vertex1, String vertex2, {int weight = 1}) {
    if (!_vertexToIndex.containsKey(vertex1) ||
        !_vertexToIndex.containsKey(vertex2)) {
      print('❌ vertex ไม่พบในกราฟ');
      return false;
    }

    int index1 = _vertexToIndex[vertex1]!;
    int index2 = _vertexToIndex[vertex2]!;

    _matrix[index1][index2] = weight;

    if (!_isDirected) {
      // สำหรับ undirected graph ต้องเพิ่มทั้งสองทิศทาง
      _matrix[index2][index1] = weight;
    }

    String direction =
        _isDirected ? '"$vertex1" → "$vertex2"' : '"$vertex1" ↔ "$vertex2"';
    print('✅ เพิ่ม edge $direction (weight: $weight)');
    return true;
  }

  /// ลบ edge
  bool removeEdge(String vertex1, String vertex2) {
    if (!_vertexToIndex.containsKey(vertex1) ||
        !_vertexToIndex.containsKey(vertex2)) {
      print('❌ vertex ไม่พบในกราฟ');
      return false;
    }

    int index1 = _vertexToIndex[vertex1]!;
    int index2 = _vertexToIndex[vertex2]!;

    _matrix[index1][index2] = 0;

    if (!_isDirected) {
      _matrix[index2][index1] = 0;
    }

    print('✅ ลบ edge ระหว่าง "$vertex1" และ "$vertex2"');
    return true;
  }

  /// ตรวจสอบว่ามี edge หรือไม่
  bool hasEdge(String vertex1, String vertex2) {
    if (!_vertexToIndex.containsKey(vertex1) ||
        !_vertexToIndex.containsKey(vertex2)) {
      return false;
    }

    int index1 = _vertexToIndex[vertex1]!;
    int index2 = _vertexToIndex[vertex2]!;

    return _matrix[index1][index2] != 0;
  }

  /// รับน้ำหนักของ edge
  int getEdgeWeight(String vertex1, String vertex2) {
    if (!hasEdge(vertex1, vertex2)) return 0;

    int index1 = _vertexToIndex[vertex1]!;
    int index2 = _vertexToIndex[vertex2]!;

    return _matrix[index1][index2];
  }

  /// รับ neighbors ของ vertex
  List<String> getNeighbors(String vertex) {
    if (!_vertexToIndex.containsKey(vertex)) return [];

    int index = _vertexToIndex[vertex]!;
    List<String> neighbors = [];

    for (int i = 0; i < _vertexCount; i++) {
      if (_matrix[index][i] != 0) {
        neighbors.add(_indexToVertex[i]!);
      }
    }

    return neighbors;
  }

  /// คำนวณ degree ของ vertex
  int getDegree(String vertex) {
    if (!_vertexToIndex.containsKey(vertex)) return 0;

    int index = _vertexToIndex[vertex]!;
    int degree = 0;

    if (_isDirected) {
      // สำหรับ directed graph ให้ out-degree
      for (int i = 0; i < _vertexCount; i++) {
        if (_matrix[index][i] != 0) degree++;
      }
    } else {
      // สำหรับ undirected graph
      for (int i = 0; i < _vertexCount; i++) {
        if (_matrix[index][i] != 0) degree++;
      }
    }

    return degree;
  }

  /// นับจำนวน edges ทั้งหมด
  int get edgeCount {
    int count = 0;
    for (int i = 0; i < _vertexCount; i++) {
      for (int j = 0; j < _vertexCount; j++) {
        if (_matrix[i][j] != 0) count++;
      }
    }
    return _isDirected ? count : count ~/ 2;
  }

  /// รับรายชื่อ vertices ทั้งหมด
  List<String> getAllVertices() {
    return _vertexToIndex.keys.toList();
  }

  /// แสดงเมทริกซ์
  void displayMatrix() {
    print('\n📊 Adjacency Matrix:');
    print('Vertices: $_vertexCount, Edges: $edgeCount');
    print('Type: ${_isDirected ? "Directed" : "Undirected"}');

    if (_vertexCount == 0) {
      print('(Graph ว่าง)');
      return;
    }

    // แสดงหัวตาราง
    String header = '\n    ';
    for (int i = 0; i < _vertexCount; i++) {
      header += '${_indexToVertex[i]!.padLeft(3)} ';
    }
    print(header);

    // แสดงแถวและข้อมูล
    for (int i = 0; i < _vertexCount; i++) {
      String row = '${_indexToVertex[i]!.padLeft(3)} [';
      for (int j = 0; j < _vertexCount; j++) {
        row += '${_matrix[i][j].toString().padLeft(2)} ';
      }
      row += ']';
      print(row);
    }
  }

  /// แสดงข้อมูลในรูปแบบ adjacency list
  void displayAsList() {
    print('\n📋 Graph as Adjacency List:');
    for (String vertex in _vertexToIndex.keys) {
      List<String> neighbors = getNeighbors(vertex);
      String neighborStr = neighbors.isEmpty ? '(ไม่มี)' : neighbors.join(', ');
      print('$vertex → [$neighborStr] (degree: ${getDegree(vertex)})');
    }
  }
}

/// ตัวอย่างการใช้งาน
void main() {
  print('=== Adjacency Matrix Demo ===\n');

  // ทดสอบ Undirected Graph
  testUndirectedMatrix();

  print('\n${'=' * 60}\n');

  // ทดสอบ Directed Weighted Graph
  testDirectedWeightedMatrix();

  print('\n${'=' * 60}\n');

  // เปรียบเทียบ Matrix vs List
  compareMatrixVsList();
}

void testUndirectedMatrix() {
  print('🔄 Undirected Graph Matrix Demo:');

  GraphMatrix graph = GraphMatrix(maxVertices: 5, isDirected: false);

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
  graph.displayMatrix();
  graph.displayAsList();

  // ทดสอบการตรวจสอบ
  print('\n🔍 ตรวจสอบ connections:');
  print('A-B connected? ${graph.hasEdge('A', 'B')}');
  print('A-D connected? ${graph.hasEdge('A', 'D')}');
  print('B-C connected? ${graph.hasEdge('B', 'C')}');
}

void testDirectedWeightedMatrix() {
  print('➡️  Directed Weighted Graph Demo (แผนที่เมือง):');

  GraphMatrix cityMap = GraphMatrix(maxVertices: 4, isDirected: true);

  // เมืองต่างๆ
  cityMap.addVertex('Bangkok');
  cityMap.addVertex('Chiang Mai');
  cityMap.addVertex('Phuket');
  cityMap.addVertex('Pattaya');

  // เส้นทางและระยะทาง (กิโลเมตร)
  print('\n🛣️  เพิ่มเส้นทาง (ระยะทาง km):');
  cityMap.addEdge('Bangkok', 'Chiang Mai', weight: 700);
  cityMap.addEdge('Bangkok', 'Phuket', weight: 840);
  cityMap.addEdge('Bangkok', 'Pattaya', weight: 150);
  cityMap.addEdge('Chiang Mai', 'Bangkok', weight: 700);
  cityMap.addEdge('Pattaya', 'Phuket', weight: 750);

  cityMap.displayMatrix();
  cityMap.displayAsList();

  // ตรวจสอบระยะทาง
  print('\n📍 ระยะทางระหว่างเมือง:');
  print(
    'Bangkok → Chiang Mai: ${cityMap.getEdgeWeight('Bangkok', 'Chiang Mai')} km',
  );
  print('Bangkok → Phuket: ${cityMap.getEdgeWeight('Bangkok', 'Phuket')} km');
  print(
    'Phuket → Bangkok: ${cityMap.getEdgeWeight('Phuket', 'Bangkok')} km (${cityMap.hasEdge('Phuket', 'Bangkok') ? 'มี' : 'ไม่มี'}เส้นทาง)',
  );
}

void compareMatrixVsList() {
  print('⚖️  เปรียบเทียบ Adjacency Matrix vs Adjacency List:');

  print('\n📈 Adjacency Matrix:');
  print('✅ ข้อดี:');
  print('   - ตรวจสอบ edge รวดเร็ว O(1)');
  print('   - เหมาะกับ dense graph (edges เยอะ)');
  print('   - ง่ายต่อการ implement');
  print('   - เหมาะกับ weighted graph');

  print('\n❌ ข้อเสีย:');
  print('   - ใช้ memory เยอะ O(V²)');
  print('   - เสียเวลาในการหา neighbors O(V)');
  print('   - เสีย space แม้ไม่มี edge');

  print('\n📋 Adjacency List:');
  print('✅ ข้อดี:');
  print('   - ใช้ memory น้อย O(V + E)');
  print('   - เหมาะกับ sparse graph (edges น้อย)');
  print('   - หา neighbors รวดเร็ว');

  print('\n❌ ข้อเสีย:');
  print('   - ตรวจสอบ edge ช้า O(degree)');
  print('   - ซับซ้อนกว่าเล็กน้อย');

  print('\n🎯 สรุป:');
  print('   - Matrix → Dense Graph, ต้องตรวจสอบ edge บ่อย');
  print('   - List → Sparse Graph, ต้อง traverse บ่อย');
}
