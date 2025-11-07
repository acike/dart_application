/// อัลกอริทึมขั้นสูงสำหรับ Graph
/// รวม Shortest Path, Minimum Spanning Tree, และอื่นๆ
library;

/// คลาสสำหรับ Weighted Edge
class WeightedEdge implements Comparable<WeightedEdge> {
  final String from;
  final String to;
  final int weight;

  WeightedEdge(this.from, this.to, this.weight);

  @override
  int compareTo(WeightedEdge other) => weight.compareTo(other.weight);

  @override
  String toString() => '$from → $to ($weight)';
}

/// คลาสสำหรับ Weighted Graph
class WeightedGraph {
  final Map<String, Map<String, int>> _adjacencyList = {};

  /// เพิ่ม vertex
  void addVertex(String vertex) {
    if (!_adjacencyList.containsKey(vertex)) {
      _adjacencyList[vertex] = {};
    }
  }

  /// เพิ่ม weighted edge
  void addEdge(String from, String to, int weight, {bool isDirected = false}) {
    addVertex(from);
    addVertex(to);

    _adjacencyList[from]![to] = weight;
    if (!isDirected) {
      _adjacencyList[to]![from] = weight;
    }
  }

  /// รับ neighbors พร้อม weight
  Map<String, int> getNeighbors(String vertex) {
    return _adjacencyList[vertex] ?? {};
  }

  /// รับ vertices ทั้งหมด
  List<String> getAllVertices() {
    return _adjacencyList.keys.toList();
  }

  /// รับ edges ทั้งหมด
  List<WeightedEdge> getAllEdges({bool isDirected = false}) {
    List<WeightedEdge> edges = [];
    Set<String> processed = {};

    for (String from in _adjacencyList.keys) {
      for (String to in _adjacencyList[from]!.keys) {
        int weight = _adjacencyList[from]![to]!;

        if (isDirected || !processed.contains('$to-$from')) {
          edges.add(WeightedEdge(from, to, weight));
          if (!isDirected) {
            processed.add('$from-$to');
          }
        }
      }
    }

    return edges;
  }

  /// แสดงกราฟ
  void display() {
    print('\n📊 Weighted Graph:');
    for (String vertex in _adjacencyList.keys) {
      List<String> connections = [];
      for (String neighbor in _adjacencyList[vertex]!.keys) {
        int weight = _adjacencyList[vertex]![neighbor]!;
        connections.add('$neighbor($weight)');
      }
      String connectionsStr =
          connections.isEmpty ? '(ไม่มี)' : connections.join(', ');
      print('$vertex → [$connectionsStr]');
    }
  }
}

/// คลาสสำหรับอัลกอริทึม Graph
class GraphAlgorithms {
  /// Dijkstra's Algorithm - หาเส้นทางสั้นที่สุดจากจุดเริ่มต้นไปทุกจุด
  static Map<String, int> dijkstra(WeightedGraph graph, String start) {
    print('\n🎯 Dijkstra\'s Algorithm จาก "$start":');

    Map<String, int> distances = {};
    Map<String, String?> previous = {};
    PriorityQueue<_DistanceNode> pq = PriorityQueue<_DistanceNode>();

    // กำหนดระยะทางเริ่มต้น
    for (String vertex in graph.getAllVertices()) {
      distances[vertex] = vertex == start ? 0 : double.maxFinite.toInt();
      previous[vertex] = null;
      pq.add(_DistanceNode(vertex, distances[vertex]!));
    }

    while (pq.isNotEmpty) {
      _DistanceNode current = pq.removeFirst();
      String currentVertex = current.vertex;
      int currentDistance = current.distance;

      print('🔍 ตรวจสอบ: $currentVertex (ระยะทาง: $currentDistance)');

      if (currentDistance > distances[currentVertex]!) continue;

      // ตรวจสอบ neighbors
      Map<String, int> neighbors = graph.getNeighbors(currentVertex);
      for (String neighbor in neighbors.keys) {
        int weight = neighbors[neighbor]!;
        int newDistance = currentDistance + weight;

        if (newDistance < distances[neighbor]!) {
          distances[neighbor] = newDistance;
          previous[neighbor] = currentVertex;
          pq.add(_DistanceNode(neighbor, newDistance));
          print('   📍 อัปเดต $neighbor: $newDistance (ผ่าน $currentVertex)');
        }
      }
    }

    print('\n✅ ระยะทางสั้นที่สุดจาก "$start":');
    for (String vertex in distances.keys) {
      if (vertex != start) {
        print('   $start → $vertex: ${distances[vertex]}');
      }
    }

    return distances;
  }

  /// หาเส้นทางสั้นที่สุดระหว่าง 2 จุด
  static List<String>? shortestPath(
    WeightedGraph graph,
    String start,
    String end,
  ) {
    print('\n🛣️  หาเส้นทางสั้นที่สุด: $start → $end');

    Map<String, int> distances = {};
    Map<String, String?> previous = {};
    PriorityQueue<_DistanceNode> pq = PriorityQueue<_DistanceNode>();

    // กำหนดระยะทางเริ่มต้น
    for (String vertex in graph.getAllVertices()) {
      distances[vertex] = vertex == start ? 0 : double.maxFinite.toInt();
      previous[vertex] = null;
      pq.add(_DistanceNode(vertex, distances[vertex]!));
    }

    while (pq.isNotEmpty) {
      _DistanceNode current = pq.removeFirst();
      String currentVertex = current.vertex;

      if (currentVertex == end) break; // พบเป้าหมายแล้ว

      Map<String, int> neighbors = graph.getNeighbors(currentVertex);
      for (String neighbor in neighbors.keys) {
        int weight = neighbors[neighbor]!;
        int newDistance = distances[currentVertex]! + weight;

        if (newDistance < distances[neighbor]!) {
          distances[neighbor] = newDistance;
          previous[neighbor] = currentVertex;
          pq.add(_DistanceNode(neighbor, newDistance));
        }
      }
    }

    // สร้างเส้นทาง
    if (distances[end] == double.maxFinite.toInt()) {
      print('❌ ไม่มีเส้นทางไป "$end"');
      return null;
    }

    List<String> path = [];
    String? current = end;
    while (current != null) {
      path.insert(0, current);
      current = previous[current];
    }

    print('✅ เส้นทาง: ${path.join(' → ')} (ระยะทาง: ${distances[end]})');
    return path;
  }

  /// Kruskal's Algorithm - หา Minimum Spanning Tree
  static List<WeightedEdge> kruskalMST(WeightedGraph graph) {
    print('\n🌳 Kruskal\'s MST Algorithm:');

    List<WeightedEdge> edges = graph.getAllEdges();
    edges.sort(); // เรียงตาม weight

    UnionFind uf = UnionFind(graph.getAllVertices());
    List<WeightedEdge> mst = [];
    int totalWeight = 0;

    print('🔍 ตรวจสอบ edges (เรียงตาม weight):');
    for (WeightedEdge edge in edges) {
      print('   edge: $edge');

      if (!uf.isConnected(edge.from, edge.to)) {
        uf.union(edge.from, edge.to);
        mst.add(edge);
        totalWeight += edge.weight;
        print('   ✅ เลือก edge: $edge');
      } else {
        print('   ❌ ข้าม edge: $edge (สร้าง cycle)');
      }
    }

    print('\n🌳 Minimum Spanning Tree:');
    for (WeightedEdge edge in mst) {
      print('   $edge');
    }
    print('💰 น้ำหนักรวม: $totalWeight');

    return mst;
  }

  /// Prim's Algorithm - หา Minimum Spanning Tree
  static List<WeightedEdge> primMST(WeightedGraph graph, String start) {
    print('\n🌳 Prim\'s MST Algorithm จาก "$start":');

    Set<String> visited = {start};
    List<WeightedEdge> mst = [];
    PriorityQueue<WeightedEdge> pq = PriorityQueue<WeightedEdge>();

    // เพิ่ม edges จาก start
    Map<String, int> neighbors = graph.getNeighbors(start);
    for (String neighbor in neighbors.keys) {
      pq.add(WeightedEdge(start, neighbor, neighbors[neighbor]!));
    }

    while (pq.isNotEmpty && visited.length < graph.getAllVertices().length) {
      WeightedEdge edge = pq.removeFirst();

      if (visited.contains(edge.to)) continue;

      // เพิ่ม edge ลงใน MST
      mst.add(edge);
      visited.add(edge.to);
      print('✅ เลือก edge: $edge');

      // เพิ่ม edges ใหม่จาก vertex ที่เพิ่งเข้าร่วม
      Map<String, int> newNeighbors = graph.getNeighbors(edge.to);
      for (String neighbor in newNeighbors.keys) {
        if (!visited.contains(neighbor)) {
          pq.add(WeightedEdge(edge.to, neighbor, newNeighbors[neighbor]!));
        }
      }
    }

    int totalWeight = mst.fold(0, (sum, edge) => sum + edge.weight);
    print('\n🌳 Minimum Spanning Tree:');
    for (WeightedEdge edge in mst) {
      print('   $edge');
    }
    print('💰 น้ำหนักรวม: $totalWeight');

    return mst;
  }
}

/// คลาสสำหรับ Union-Find (Disjoint Set)
class UnionFind {
  late Map<String, String> _parent;
  late Map<String, int> _rank;

  UnionFind(List<String> vertices) {
    _parent = {};
    _rank = {};

    for (String vertex in vertices) {
      _parent[vertex] = vertex;
      _rank[vertex] = 0;
    }
  }

  String find(String vertex) {
    if (_parent[vertex] != vertex) {
      _parent[vertex] = find(_parent[vertex]!); // Path compression
    }
    return _parent[vertex]!;
  }

  void union(String vertex1, String vertex2) {
    String root1 = find(vertex1);
    String root2 = find(vertex2);

    if (root1 != root2) {
      // Union by rank
      if (_rank[root1]! < _rank[root2]!) {
        _parent[root1] = root2;
      } else if (_rank[root1]! > _rank[root2]!) {
        _parent[root2] = root1;
      } else {
        _parent[root2] = root1;
        _rank[root1] = _rank[root1]! + 1;
      }
    }
  }

  bool isConnected(String vertex1, String vertex2) {
    return find(vertex1) == find(vertex2);
  }
}

/// คลาสสำหรับ Priority Queue ง่ายๆ
class PriorityQueue<T extends Comparable<T>> {
  final List<T> _heap = [];

  void add(T item) {
    _heap.add(item);
    _bubbleUp(_heap.length - 1);
  }

  T removeFirst() {
    if (_heap.isEmpty) throw StateError('Queue is empty');

    T first = _heap[0];
    T last = _heap.removeLast();

    if (_heap.isNotEmpty) {
      _heap[0] = last;
      _bubbleDown(0);
    }

    return first;
  }

  bool get isEmpty => _heap.isEmpty;
  bool get isNotEmpty => _heap.isNotEmpty;

  void _bubbleUp(int index) {
    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;
      if (_heap[index].compareTo(_heap[parentIndex]) >= 0) break;

      _swap(index, parentIndex);
      index = parentIndex;
    }
  }

  void _bubbleDown(int index) {
    while (true) {
      int leftChild = 2 * index + 1;
      int rightChild = 2 * index + 2;
      int smallest = index;

      if (leftChild < _heap.length &&
          _heap[leftChild].compareTo(_heap[smallest]) < 0) {
        smallest = leftChild;
      }

      if (rightChild < _heap.length &&
          _heap[rightChild].compareTo(_heap[smallest]) < 0) {
        smallest = rightChild;
      }

      if (smallest == index) break;

      _swap(index, smallest);
      index = smallest;
    }
  }

  void _swap(int i, int j) {
    T temp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = temp;
  }
}

/// คลาสสำหรับเก็บ vertex และ distance ใน Dijkstra
class _DistanceNode implements Comparable<_DistanceNode> {
  final String vertex;
  final int distance;

  _DistanceNode(this.vertex, this.distance);

  @override
  int compareTo(_DistanceNode other) => distance.compareTo(other.distance);
}

/// ตัวอย่างการใช้งาน
void main() {
  print('=== Graph Algorithms Demo ===\n');

  // ทดสอบ Dijkstra
  testDijkstra();

  print('\n${'=' * 60}\n');

  // ทดสอบ MST
  testMST();
}

void testDijkstra() {
  print('🎯 ทดสอบ Dijkstra\'s Algorithm:');

  WeightedGraph cityMap = WeightedGraph();

  // เพิ่มเมืองและระยะทาง
  cityMap.addEdge('Bangkok', 'Ayutthaya', 80);
  cityMap.addEdge('Bangkok', 'Kanchanaburi', 130);
  cityMap.addEdge('Ayutthaya', 'Lopburi', 60);
  cityMap.addEdge('Kanchanaburi', 'Suphanburi', 90);
  cityMap.addEdge('Lopburi', 'Suphanburi', 100);
  cityMap.addEdge('Ayutthaya', 'Saraburi', 70);
  cityMap.addEdge('Suphanburi', 'Nakhon Pathom', 80);

  cityMap.display();

  // หาระยะทางสั้นที่สุดจาก Bangkok
  GraphAlgorithms.dijkstra(cityMap, 'Bangkok');

  // หาเส้นทางสั้นที่สุดไป Nakhon Pathom
  GraphAlgorithms.shortestPath(cityMap, 'Bangkok', 'Nakhon Pathom');
}

void testMST() {
  print('🌳 ทดสอบ Minimum Spanning Tree:');

  WeightedGraph network = WeightedGraph();

  // เครือข่ายคอมพิวเตอร์และต้นทุนสาย
  network.addEdge('Server', 'PC1', 10);
  network.addEdge('Server', 'PC2', 15);
  network.addEdge('Server', 'Router', 20);
  network.addEdge('PC1', 'PC2', 35);
  network.addEdge('PC1', 'Router', 25);
  network.addEdge('PC2', 'Switch', 30);
  network.addEdge('Router', 'Switch', 40);
  network.addEdge('Router', 'Gateway', 50);
  network.addEdge('Switch', 'Gateway', 45);

  network.display();

  print('\n📊 เปรียบเทียบอัลกอริทึม MST:');

  // Kruskal's Algorithm
  List<WeightedEdge> kruskalResult = GraphAlgorithms.kruskalMST(network);

  print('\n${'-' * 40}');

  // Prim's Algorithm
  List<WeightedEdge> primResult = GraphAlgorithms.primMST(network, 'Server');

  print('\n🔍 เปรียบเทียบผลลัพธ์:');
  print('Kruskal กับ Prim ให้ผลลัพธ์เหมือนกันหรือไม่?');

  int kruskalWeight = kruskalResult.fold(0, (sum, edge) => sum + edge.weight);
  int primWeight = primResult.fold(0, (sum, edge) => sum + edge.weight);

  print('Kruskal น้ำหนักรวม: $kruskalWeight');
  print('Prim น้ำหนักรวม: $primWeight');
  print(kruskalWeight == primWeight ? '✅ เหมือนกัน!' : '❌ ต่างกัน');
}
