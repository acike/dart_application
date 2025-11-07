/// ตัวอย่างการใช้งาน Graph ทั้งหมด
/// รวมตัวอย่างจากทุกไฟล์ในโฟลเดอร์ graph
library;

import 'graph_basic.dart' as basic;
import 'adjacency_list.dart';
import 'adjacency_matrix.dart';
import 'graph_traversal.dart';
import 'graph_algorithms.dart';

/// เมนูหลักสำหรับเลือกตัวอย่าง
void main() {
  print(
    '🚀 ยินดีต้อนรับสู่ Graph Demo - การเดินทางสู่การเป็น Dev ที่แข็งแกร่งที่สุดในโลก!',
  );
  print('=' * 80);

  runAllDemos();
}

/// รันตัวอย่างทั้งหมด
void runAllDemos() {
  print('\n📚 1. พื้นฐาน Graph');
  print('=' * 50);
  basic.main();

  print('\n📋 2. Adjacency List Demo');
  print('=' * 50);
  demonstrateAdjacencyList();

  print('\n📊 3. Adjacency Matrix Demo');
  print('=' * 50);
  demonstrateAdjacencyMatrix();

  print('\n🔍 4. Graph Traversal Demo');
  print('=' * 50);
  demonstrateTraversal();

  print('\n🧮 5. Graph Algorithms Demo');
  print('=' * 50);
  demonstrateAlgorithms();

  print('\n🎓 6. Real-World Applications');
  print('=' * 50);
  demonstrateRealWorldApps();

  print('\n🎯 สรุปและขั้นตอนต่อไป');
  print('=' * 50);
  provideSummaryAndNextSteps();
}

/// ตัวอย่าง Adjacency List
void demonstrateAdjacencyList() {
  print('🏗️  สร้าง Social Network ด้วย Adjacency List:');

  UndirectedGraph socialNet = UndirectedGraph();

  // เพิ่มเพื่อนๆ
  for (var person in ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve']) {
    socialNet.addVertex(person);
  }

  // เพิ่มความสัมพันธ์
  socialNet.addEdge('Alice', 'Bob');
  socialNet.addEdge('Alice', 'Charlie');
  socialNet.addEdge('Bob', 'Diana');
  socialNet.addEdge('Charlie', 'Eve');
  socialNet.addEdge('Diana', 'Eve');

  socialNet.display();

  print('\n👥 วิเคราะห์ Social Network:');
  print('Alice มีเพื่อน: ${socialNet.getNeighbors('Alice').join(', ')}');
  print('Diana มีเพื่อน: ${socialNet.getNeighbors('Diana').join(', ')}');
  print(
    'Alice และ Eve เป็นเพื่อนกันหรือไม่? ${socialNet.hasEdge('Alice', 'Eve') ? 'ใช่' : 'ไม่'}',
  );
}

/// ตัวอย่าง Adjacency Matrix
void demonstrateAdjacencyMatrix() {
  print('🗺️  สร้างแผนที่เมืองด้วย Adjacency Matrix:');

  GraphMatrix cityMap = GraphMatrix(maxVertices: 5, isDirected: false);

  // เพิ่มเมือง
  for (var city in [
    'Bangkok',
    'Pattaya',
    'Hua Hin',
    'Kanchanaburi',
    'Ayutthaya',
  ]) {
    cityMap.addVertex(city);
  }

  // เพิ่มเส้นทางและระยะทาง
  cityMap.addEdge('Bangkok', 'Pattaya', weight: 150);
  cityMap.addEdge('Bangkok', 'Hua Hin', weight: 200);
  cityMap.addEdge('Bangkok', 'Kanchanaburi', weight: 130);
  cityMap.addEdge('Bangkok', 'Ayutthaya', weight: 80);
  cityMap.addEdge('Pattaya', 'Hua Hin', weight: 170);

  cityMap.displayMatrix();

  print('\n🚗 ข้อมูลการเดินทาง:');
  print('Bangkok → Pattaya: ${cityMap.getEdgeWeight('Bangkok', 'Pattaya')} km');
  print('Bangkok → Hua Hin: ${cityMap.getEdgeWeight('Bangkok', 'Hua Hin')} km');
  print(
    'Ayutthaya → Pattaya เชื่อมต่อกันหรือไม่? ${cityMap.hasEdge('Ayutthaya', 'Pattaya') ? 'ใช่' : 'ไม่'}',
  );
}

/// ตัวอย่าง Graph Traversal
void demonstrateTraversal() {
  print('🎮 สร้างแผนที่เกมและท่องเกม:');

  UndirectedGraph gameMap = UndirectedGraph();

  // พื้นที่ในเกม
  for (var area in [
    'Village',
    'Forest',
    'Cave',
    'Mountain',
    'Castle',
    'Lake',
  ]) {
    gameMap.addVertex(area);
  }

  // เส้นทางเชื่อมต่อ
  gameMap.addEdge('Village', 'Forest');
  gameMap.addEdge('Village', 'Lake');
  gameMap.addEdge('Forest', 'Cave');
  gameMap.addEdge('Forest', 'Mountain');
  gameMap.addEdge('Cave', 'Castle');
  gameMap.addEdge('Mountain', 'Castle');

  gameMap.display();

  GraphTraversal gameTraversal = GraphTraversal(gameMap);

  print('\n🚶‍♂️ การสำรวจแบบ BFS (กว้างก่อน):');
  gameTraversal.bfs('Village');

  print('\n🏃‍♂️ การสำรวจแบบ DFS (ลึกก่อน):');
  gameTraversal.dfs('Village');

  print('\n🎯 หาเส้นทางจาก Village ไป Castle:');
  gameTraversal.findPath('Village', 'Castle');
}

/// ตัวอย่าง Graph Algorithms
void demonstrateAlgorithms() {
  print('🌐 สร้างเครือข่ายอินเทอร์เน็ต:');

  WeightedGraph internetNetwork = WeightedGraph();

  // เซิร์ฟเวอร์และความเร็วการเชื่อมต่อ (ms)
  internetNetwork.addEdge('Thailand', 'Singapore', 30);
  internetNetwork.addEdge('Thailand', 'Japan', 80);
  internetNetwork.addEdge('Singapore', 'Australia', 100);
  internetNetwork.addEdge('Singapore', 'India', 70);
  internetNetwork.addEdge('Japan', 'Korea', 20);
  internetNetwork.addEdge('Japan', 'USA', 150);
  internetNetwork.addEdge('Australia', 'New Zealand', 40);
  internetNetwork.addEdge('India', 'Middle East', 60);
  internetNetwork.addEdge('USA', 'Europe', 120);
  internetNetwork.addEdge('Middle East', 'Europe', 50);

  internetNetwork.display();

  print('\n⚡ หาเส้นทางเร็วที่สุดจาก Thailand:');
  GraphAlgorithms.dijkstra(internetNetwork, 'Thailand');

  print('\n🌍 หาเส้นทางเร็วที่สุด Thailand → Europe:');
  GraphAlgorithms.shortestPath(internetNetwork, 'Thailand', 'Europe');

  print('\n🔗 สร้าง Minimum Spanning Tree (เครือข่ายที่มีต้นทุนต่ำสุด):');
  GraphAlgorithms.kruskalMST(internetNetwork);
}

/// ตัวอย่างการใช้งานในโลกจริง
void demonstrateRealWorldApps() {
  print('🌟 การใช้งาน Graph ในโลกจริง:');

  print('\n1. 🚇 ระบบขนส่งมวลชน (BTS/MRT):');
  demonstrateTransportSystem();

  print('\n2. 📱 Social Media Algorithm:');
  demonstrateSocialMediaFeatures();

  print('\n3. 🏪 E-commerce Recommendation:');
  demonstrateRecommendationSystem();
}

/// ตัวอย่างระบบขนส่ง
void demonstrateTransportSystem() {
  UndirectedGraph btsSystem = UndirectedGraph();

  // สถานี BTS
  for (var station in [
    'Siam',
    'Chitlom',
    'Ploenchit',
    'Nana',
    'Asok',
    'Phromphong',
    'Thong Lo',
  ]) {
    btsSystem.addVertex(station);
  }

  // เส้นทางรถไฟฟ้า
  btsSystem.addEdge('Siam', 'Chitlom');
  btsSystem.addEdge('Chitlom', 'Ploenchit');
  btsSystem.addEdge('Ploenchit', 'Nana');
  btsSystem.addEdge('Nana', 'Asok');
  btsSystem.addEdge('Asok', 'Phromphong');
  btsSystem.addEdge('Phromphong', 'Thong Lo');
  btsSystem.addEdge('Siam', 'Asok'); // interchange

  GraphTraversal btsTraversal = GraphTraversal(btsSystem);

  print('🚇 หาเส้นทางจาก Chitlom ไป Thong Lo:');
  List<String>? route = btsTraversal.findPath('Chitlom', 'Thong Lo');
  if (route != null) {
    print('   เส้นทางแนะนำ: ${route.join(' → ')}');
    print('   จำนวนสถานี: ${route.length - 1} สถานี');
  }
}

/// ตัวอย่าง Social Media
void demonstrateSocialMediaFeatures() {
  DirectedGraph socialMedia = DirectedGraph();

  // ผู้ใช้
  for (var user in ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve', 'Frank']) {
    socialMedia.addVertex(user);
  }

  // การติดตาม (directed)
  socialMedia.addEdge('Alice', 'Bob'); // Alice ติดตาม Bob
  socialMedia.addEdge('Alice', 'Charlie');
  socialMedia.addEdge('Bob', 'Alice'); // Bob ติดตาม Alice กลับ
  socialMedia.addEdge('Bob', 'Diana');
  socialMedia.addEdge('Charlie', 'Eve');
  socialMedia.addEdge('Diana', 'Frank');
  socialMedia.addEdge('Eve', 'Frank');
  socialMedia.addEdge('Frank', 'Alice');

  socialMedia.display();

  print('\n📊 วิเคราะห์ Influencer:');
  print(
    'Alice มี ${socialMedia.getInDegree('Alice')} followers และติดตาม ${socialMedia.getOutDegree('Alice')} คน',
  );
  print(
    'Bob มี ${socialMedia.getInDegree('Bob')} followers และติดตาม ${socialMedia.getOutDegree('Bob')} คน',
  );
  print(
    'Frank มี ${socialMedia.getInDegree('Frank')} followers และติดตาม ${socialMedia.getOutDegree('Frank')} คน',
  );
}

/// ตัวอย่างระบบแนะนำสินค้า
void demonstrateRecommendationSystem() {
  UndirectedGraph productGraph = UndirectedGraph();

  // สินค้า
  for (var product in [
    'iPhone',
    'AirPods',
    'MacBook',
    'iPad',
    'Watch',
    'Cable',
    'Case',
  ]) {
    productGraph.addVertex(product);
  }

  // ความเกี่ยวข้องของสินค้า (คนที่ซื้อ A มักซื้อ B ด้วย)
  productGraph.addEdge('iPhone', 'AirPods');
  productGraph.addEdge('iPhone', 'Case');
  productGraph.addEdge('iPhone', 'Cable');
  productGraph.addEdge('MacBook', 'iPad');
  productGraph.addEdge('MacBook', 'Cable');
  productGraph.addEdge('iPad', 'AirPods');
  productGraph.addEdge('Watch', 'iPhone');
  productGraph.addEdge('AirPods', 'Case');

  print('🛒 ลูกค้าซื้อ iPhone:');
  List<String> recommendations = productGraph.getNeighbors('iPhone');
  print('   สินค้าแนะนำ: ${recommendations.join(', ')}');

  print('\n🔍 ลูกค้าซื้อ MacBook:');
  recommendations = productGraph.getNeighbors('MacBook');
  print('   สินค้าแนะนำ: ${recommendations.join(', ')}');

  // หาสินค้าที่เกี่ยวข้องผ่าน 2 ขั้น
  print('\n🎯 สินค้าที่เกี่ยวข้องกับ iPhone ผ่าน 2 ขั้น:');
  Set<String> secondLevel = {};
  for (String related in productGraph.getNeighbors('iPhone')) {
    for (String indirect in productGraph.getNeighbors(related)) {
      if (indirect != 'iPhone' &&
          !productGraph.getNeighbors('iPhone').contains(indirect)) {
        secondLevel.add(indirect);
      }
    }
  }
  print('   สินค้าแนะนำเพิ่มเติม: ${secondLevel.join(', ')}');
}

/// สรุปและขั้นตอนต่อไป
void provideSummaryAndNextSteps() {
  print('🎓 สรุปสิ่งที่เราได้เรียนรู้:');
  print('───────────────────────────────');

  print('\n📚 1. พื้นฐาน Graph:');
  print('   ✅ Graph vs Tree');
  print('   ✅ Directed vs Undirected Graph');
  print('   ✅ Weighted Graph');

  print('\n💾 2. การแทน Graph:');
  print('   ✅ Adjacency List (เหมาะกับ sparse graph)');
  print('   ✅ Adjacency Matrix (เหมาะกับ dense graph)');

  print('\n🔍 3. การท่องกราฟ:');
  print('   ✅ BFS (Breadth-First Search) - กว้างก่อน');
  print('   ✅ DFS (Depth-First Search) - ลึกก่อน');
  print('   ✅ Path Finding - หาเส้นทาง');
  print('   ✅ Connected Components - กลุ่มที่เชื่อมต่อ');

  print('\n🧮 4. อัลกอริทึมขั้นสูง:');
  print('   ✅ Dijkstra - หาเส้นทางสั้นที่สุด');
  print('   ✅ Kruskal\'s MST - Minimum Spanning Tree');
  print('   ✅ Prim\'s MST - อีกวิธีหา MST');

  print('\n🌟 5. การใช้งานจริง:');
  print('   ✅ Social Networks (Facebook, Twitter)');
  print('   ✅ Navigation Systems (Google Maps)');
  print('   ✅ Recommendation Systems (E-commerce)');
  print('   ✅ Network Infrastructure (Internet)');

  print('\n🚀 ขั้นตอนต่อไปในการเป็น Dev ที่แข็งแกร่ง:');
  print('───────────────────────────────────────────');

  print('\n🔥 หัวข้อขั้นสูงที่ควรเรียนต่อ:');
  print('   📈 Dynamic Programming');
  print('   🧩 Advanced Graph Algorithms (Floyd-Warshall, Bellman-Ford)');
  print('   🌐 Network Flow (Max Flow, Min Cut)');
  print('   🤖 AI/ML Algorithms');
  print('   ⚡ Parallel & Distributed Computing');

  print('\n💡 โปรเจคแนะนำเพื่อฝึกฝน:');
  print('   🗺️  สร้างแอพหาเส้นทาง (เหมือน Google Maps)');
  print('   📱 สร้าง Social Network mini');
  print('   🛒 สร้างระบบแนะนำสินค้า');
  print('   🎮 สร้าง AI สำหรับเกม (Pathfinding)');
  print('   🌐 วิเคราะห์เครือข่าย (Network Analysis)');

  print('\n🏆 เทคนิคการเรียนรู้:');
  print('   📝 ฝึกแก้โจทย์ใน LeetCode, HackerRank');
  print('   🧠 ทำความเข้าใจ Time/Space Complexity');
  print('   🔄 ฝึกการ optimize algorithms');
  print('   🤝 ศึกษา real-world case studies');
  print('   💪 สร้างโปรเจคจริงเพื่อฝึกประสบการณ์');

  print('\n🎯 Goal: การเป็น World-Class Developer!');
  print('   🌟 เข้าใจ Data Structures & Algorithms อย่างลึกซึ้ง');
  print('   🌟 สามารถแก้ปัญหาซับซ้อนได้อย่างมีประสิทธิภาพ');
  print('   🌟 ออกแบบระบบขนาดใหญ่ได้');
  print('   🌟 เขียนโค้ดที่ clean, maintainable และ scalable');

  print('\n✨ คุณอยู่ในเส้นทางที่ถูกต้องแล้ว! Keep coding! 💪');
}
