/// ไฟล์แนะนำแนวคิดพื้นฐานของ Graph (กราฟ)
/// โดย Professor Dart - สำหรับนักเรียนเริ่มต้น
library;

void main() {
  print('=== ยินดีต้อนรับสู่โลกของ Graph! ===\n');

  // เริ่มต้นด้วยแนวคิดพื้นฐาน
  explainGraphBasics();

  print('\n=== ความแตกต่างระหว่าง Tree และ Graph ===');
  compareTreeAndGraph();

  print('\n=== ประเภทของ Graph ===');
  explainGraphTypes();

  print('\n=== ตัวอย่างในชีวิตจริง ===');
  realWorldExamples();
}

/// อธิบายแนวคิดพื้นฐานของ Graph
void explainGraphBasics() {
  print('Graph (กราฟ) ประกอบด้วย 2 ส่วนหลัก:');
  print('1. Vertices/Nodes (จุดยอด/โหนด) = จุดต่างๆ ในกราฟ');
  print('2. Edges (เส้นเชื่อม) = เส้นที่เชื่อมระหว่างจุดยอด');

  print('\nเปรียบเทียบกับสิ่งที่คุณรู้จัก:');
  print('- หากคิดถึง Facebook: คน = Vertices, ความเป็นเพื่อน = Edges');
  print('- หากคิดถึงแผนที่: สถานที่ = Vertices, ถนน = Edges');
  print('- หากคิดถึงเว็บไซต์: หน้าเว็บ = Vertices, ลิงก์ = Edges');
}

/// เปรียบเทียบความแตกต่างระหว่าง Tree และ Graph
void compareTreeAndGraph() {
  print('Tree (ต้นไม้):');
  print('✓ มี hierarchy (ลำดับชั้น) - parent → child');
  print('✓ ไม่มี cycle (วงจร) - ไม่สามารถวนกลับมาจุดเดิม');
  print('✓ มี root (ราก) ที่เริ่มต้น');
  print('✓ ทุก node มี parent เพียงตัวเดียว (ยกเว้น root)');

  print('\nGraph (กราฟ):');
  print('✓ ไม่จำเป็นต้องมี hierarchy');
  print('✓ อาจมี cycle ได้ - สามารถวนกลับมาจุดเดิม');
  print('✓ ไม่จำเป็นต้องมี root');
  print('✓ node หนึ่งสามารถเชื่อมกับ node อื่นได้หลายตัว');

  print('\n🤔 คิดดู: Family Tree เป็น Tree แต่ถ้าเพิ่มความสัมพันธ์');
  print('   เช่น "เพื่อน" หรือ "เพื่อนร่วมงาน" จะกลายเป็น Graph!');
}

/// อธิบายประเภทของ Graph
void explainGraphTypes() {
  print('1. Directed Graph (กราฟมีทิศทาง):');
  print('   - เส้นเชื่อมมีทิศทาง: A → B ≠ B → A');
  print('   - ตัวอย่าง: Twitter follow, ลิงก์เว็บไซต์');
  print('   - A follow B ไม่ได้หมายความว่า B follow A');

  print('\n2. Undirected Graph (กราฟไม่มีทิศทาง):');
  print('   - เส้นเชื่อมไม่มีทิศทาง: A — B = B — A');
  print('   - ตัวอย่าง: Facebook friends, ถนนสองทาง');
  print('   - A เป็นเพื่อน B หมายความว่า B เป็นเพื่อน A ด้วย');

  print('\n3. Weighted Graph (กราฟมีน้ำหนัก):');
  print('   - เส้นเชื่อมมีค่าน้ำหนัก (weight)');
  print('   - ตัวอย่าง: ระยะทาง, ค่าใช้จ่าย, เวลา');
  print('   - Google Maps: น้ำหนัก = ระยะทางหรือเวลาในการเดินทาง');
}

/// ตัวอย่างการใช้งานในชีวิตจริง
void realWorldExamples() {
  print('📱 Social Network:');
  print('   - Facebook: Undirected Graph (เพื่อนกัน)');
  print('   - Instagram: Directed Graph (follow/follower)');
  print('   - LinkedIn: Mix ของทั้งสองแบบ');

  print('\n🗺️  Navigation Apps:');
  print('   - Google Maps: Weighted Directed Graph');
  print('   - จุดยอด = สี่แยก, ร้านค้า, สถานที่');
  print('   - เส้นเชื่อม = ถนน');
  print('   - น้ำหนัก = ระยะทาง, เวลา, การจราจร');

  print('\n🌐 Internet:');
  print('   - เว็บไซต์ = Vertices');
  print('   - ลิงก์ = Directed Edges');
  print('   - PageRank ของ Google ใช้หลักการนี้!');

  print('\n🏢 Organization Chart:');
  print('   - ปกติเป็น Tree (hierarchy)');
  print('   - แต่ถ้าเพิ่ม "ทำงานร่วมกัน" จะเป็น Graph');

  print('\n🎮 Game Development:');
  print('   - State Machine: สถานะเกม = Vertices');
  print('   - การเปลี่ยนสถานะ = Edges');
  print('   - AI Pathfinding: หาเส้นทางให้ NPC');
}
