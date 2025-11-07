// ฟังก์ชันสำหรับพิมพ์แผนที่เขาวงกตออกมาดู
void printMaze(List<List<String>> maze) {
  for (var row in maze) {
    print(row.join(' ')); // .join(' ') เพื่อให้มีช่องว่างระหว่างตัวอักษร
  }
}

// ตัวแปรสำหรับนับขั้นตอนการเดิน
int stepCounter = 0;

// ฟังก์ชันแสดงการเดินแบบละเอียด
void showStep(List<List<String>> maze, int x, int y, String action) {
  stepCounter++;
  print('\n--- ขั้นตอนที่ $stepCounter: $action ---');
  print('หุ่นยนต์อยู่ที่: ($x, $y)');
  printMaze(maze);

  // หยุดรอให้ผู้ใช้กด Enter (สำหรับดูทีละขั้นตอน)
  // print('กด Enter เพื่อดูขั้นตอนถัดไป...');
  // stdin.readLineSync();
}

// ฟังก์ชันแสดงการทำงานแบบละเอียดมากขึ้น
void showDetailedStep(
  List<List<String>> maze,
  int x,
  int y,
  String action,
  String detail,
) {
  stepCounter++;
  print('\n--- ขั้นตอนที่ $stepCounter: $action ---');
  print('ตำแหน่ง: ($x, $y) | $detail');
  printMaze(maze);
}

// เวอร์ชัน debug ที่ปรับปรุงแล้ว - แสดงข้อมูลที่ชัดเจนกว่า
bool solveMazeDebugImproved(List<List<String>> maze, int x, int y) {
  print('\n🔍 เข้าสู่ solveMaze($x, $y)');

  // --- BASE CASES (เงื่อนไขการหยุด) ---

  // 1. ตรวจสอบว่าเดินออกนอกขอบเขตของแผนที่หรือไม่
  if (x < 0 || x >= maze.length || y < 0 || y >= maze[0].length) {
    print('❌ ออกนอกขอบเขต ที่ ($x, $y) → return false');
    return false;
  }

  // แสดงสถานะปัจจุบันของช่องที่จะเดิน
  String currentChar = maze[x][y];
  print('📍 ตำแหน่ง ($x, $y) มีค่า: "$currentChar"');

  // 2. ตรวจสอบว่าเดินชนกำแพง ('#') หรือทางที่เคยลองแล้ว ('.') หรือไม่
  if (maze[x][y] == '#' || maze[x][y] == '.' || maze[x][y] == '*') {
    String reason =
        maze[x][y] == '#'
            ? 'ชนกำแพง'
            : maze[x][y] == '.'
            ? 'เคยลองแล้ว (Backtracked)'
            : 'กำลังลองอยู่ (Already exploring)';
    print('❌ $reason ที่ ($x, $y) → return false');
    return false;
  }

  // 3. ตรวจสอบว่าเจอทางออก ('E') หรือไม่
  if (maze[x][y] == 'E') {
    showDetailedStep(maze, x, y, '🎉 เจอทางออกแล้ว!', 'SUCCESS!');
    print('✅ return true - เสร็จสิ้น!');
    return true;
  }

  // --- RECURSIVE CASE (ส่วนที่เรียกตัวเอง) ---
  print('✨ ช่องนี้เดินได้ → ทำเครื่องหมาย "*" และลองเดิน 4 ทิศทาง');

  String originalChar = maze[x][y]; // เก็บตัวอักษรเดิม
  maze[x][y] = '*';
  showDetailedStep(
    maze,
    x,
    y,
    'ทำเครื่องหมาย * ที่ ($x, $y)',
    'เปลี่ยนจาก "$originalChar" → "*"',
  );

  // ลองเดินไปใน 4 ทิศทาง แบบมีการอธิบายชัดเจน
  print('\n🧭 จะลองเดิน 4 ทิศทาง (ตามลำดับ):');
  print('   1️⃣ ลง (${x + 1}, $y)');
  print('   2️⃣ ขึ้น (${x - 1}, $y)');
  print('   3️⃣ ขวา ($x, ${y + 1})');
  print('   4️⃣ ซ้าย ($x, ${y - 1})');
  print('   ⚠️ หมายเหตุ: หากทิศทางใดเจอทางออก จะหยุดทันที!');

  // ลองเดินลง
  print('\n  1️⃣ กำลังลองเดินลงไป: ($x, $y) → (${x + 1}, $y)');
  if (solveMazeDebugImproved(maze, x + 1, y)) {
    print('✅ 🎯 เจอทางออกจากทิศทางลง! หยุดการค้นหา → return true');
    return true;
  }
  print('❌ ทิศทางลงไม่มีทางออก → ลองทิศทางถัดไป');

  // ลองเดินขึ้น
  print('\n  2️⃣ กำลังลองเดินขึ้นไป: ($x, $y) → (${x - 1}, $y)');
  if (solveMazeDebugImproved(maze, x - 1, y)) {
    print('✅ 🎯 เจอทางออกจากทิศทางขึ้น! หยุดการค้นหา → return true');
    return true;
  }
  print('❌ ทิศทางขึ้นไม่มีทางออก → ลองทิศทางถัดไป');

  // ลองเดินขวา
  print('\n  3️⃣ กำลังลองเดินขวาไป: ($x, $y) → ($x, ${y + 1})');
  if (solveMazeDebugImproved(maze, x, y + 1)) {
    print('✅ 🎯 เจอทางออกจากทิศทางขวา! หยุดการค้นหา → return true');
    return true;
  }
  print('❌ ทิศทางขวาไม่มีทางออก → ลองทิศทางถัดไป');

  // ลองเดินซ้าย
  print('\n  4️⃣ กำลังลองเดินซ้ายไป: ($x, $y) → ($x, ${y - 1})');
  if (solveMazeDebugImproved(maze, x, y - 1)) {
    print('✅ 🎯 เจอทางออกจากทิศทางซ้าย! หยุดการค้นหา → return true');
    return true;
  }
  print('❌ ทิศทางซ้ายไม่มีทางออก');

  // --- Backtracking (การย้อนรอย) ---
  print('\n🔄 ลองครบ 4 ทิศทางแล้ว ไม่มีทางไหนเจอทางออก');
  print('📝 ทำการ Backtrack: เปลี่ยน "*" → "." ที่ ($x, $y)');

  maze[x][y] = '.';
  showDetailedStep(
    maze,
    x,
    y,
    '↩️ Backtrack! ทำเครื่องหมาย . ที่ ($x, $y)',
    'ทางตัน - เปลี่ยนจาก "*" → "."',
  );

  print('❌ return false จากตำแหน่ง ($x, $y) - กลับไปลองทางอื่น');
  return false;
}

// นี่คือฟังก์ชัน Recursive ของเรา
bool solveMaze(List<List<String>> maze, int x, int y) {
  // --- BASE CASES (เงื่อนไขการหยุด) ---

  // 1. ตรวจสอบว่าเดินออกนอกขอบเขตของแผนที่หรือไม่
  if (x < 0 || x >= maze.length || y < 0 || y >= maze[0].length) {
    return false; // ออกนอกขอบเขต = ทางตัน
  }

  // 2. ตรวจสอบว่าเดินชนกำแพง ('#') หรือทางที่เคยลองแล้ว ('.') หรือไม่
  if (maze[x][y] == '#' || maze[x][y] == '.' || maze[x][y] == '*') {
    return false; // ชนกำแพง/ทางเก่า = ทางตัน
  }

  // 3. ตรวจสอบว่าเจอทางออก ('E') หรือไม่ (นี่คือ Base Case ที่ประสบความสำเร็จ!)
  if (maze[x][y] == 'E') {
    return true; // เจอทางออกแล้ว!
  }

  // --- RECURSIVE CASE (ส่วนที่เรียกตัวเอง) ---

  // ถ้าไม่ใช่ทางตันและยังไม่เจอทางออก แสดงว่าเป็นเส้นทางที่ยังไปต่อได้
  // เราจะทำเครื่องหมายว่ากำลังลองเส้นทางนี้อยู่ โดยใช้ '*'
  maze[x][y] = '*';

  // ลองเดินไปใน 4 ทิศทาง (ขึ้น, ลง, ซ้าย, ขวา)
  // ถ้าทิศทางใดทิศทางหนึ่งเจอทางออก (return true) ให้หยุดทันที

  // ลองเดินลง
  if (solveMaze(maze, x + 1, y)) {
    return true; // เจอทางออกในทิศทางลง
  }

  // ลองเดินขึ้น
  if (solveMaze(maze, x - 1, y)) {
    return true; // เจอทางออกในทิศทางขึ้น
  }

  // ลองเดินขวา
  if (solveMaze(maze, x, y + 1)) {
    return true; // เจอทางออกในทิศทางขวา
  }

  // ลองเดินซ้าย
  if (solveMaze(maze, x, y - 1)) {
    return true; // เจอทางออกในทิศทางซ้าย
  }

  // --- Backtracking (การย้อนรอย) ---
  // ถ้าลองเดินครบ 4 ทิศทางแล้วไม่มีทางไหนไปถึงทางออกได้เลย
  // แสดงว่าจุดนี้เป็น "ทางตัน" จริงๆ ให้ลบเครื่องหมาย '*' ออก
  // แล้วทำเครื่องหมายเป็นทางที่เคยลองแล้ว ('.') และคืนค่า false
  maze[x][y] = '.';
  return false;
}

void main() {
  // สร้างแผนที่เขาวงกต
  // ' ' = ทางเดิน
  // '#' = กำแพง
  // 'S' = จุดเริ่มต้น
  // 'E' = ทางออก
  List<List<String>> maze = [
    ['S', ' ', '#', '#', '#', '#'],
    ['#', ' ', ' ', ' ', ' ', '#'],
    ['#', ' ', '#', '#', ' ', '#'],
    ['#', ' ', ' ', '#', ' ', 'E'],
    ['#', '#', ' ', ' ', ' ', '#'],
    ['#', '#', '#', '#', '#', '#'],
  ];

  print('🤖 ลองดูการเดินแบบละเอียด:');
  print('================================');

  // รีเซ็ตตัวนับ
  stepCounter = 0;

  // สร้างสำเนาเขาวงกตสำหรับ debug
  List<List<String>> debugMaze =
      maze.map((row) => List<String>.from(row)).toList();

  print('เขาวงกตตอนเริ่มต้น:');
  printMaze(debugMaze);

  // หาตำแหน่งของ 'S'
  int startX = 0, startY = 0;
  for (int i = 0; i < debugMaze.length; i++) {
    for (int j = 0; j < debugMaze[i].length; j++) {
      if (debugMaze[i][j] == 'S') {
        startX = i;
        startY = j;
        break;
      }
    }
  }

  print('\n🚀 เริ่มเดินจากจุด S ที่ตำแหน่ง ($startX, $startY)');
  print('หมายเหตุ: * = กำลังลอง, . = ลองแล้วไม่ได้, E = ทางออก');

  // แก้ปัญหาแบบ debug
  bool result = solveMazeDebugImproved(debugMaze, startX, startY);

  print('\n🏁 ผลลัพธ์สุดท้าย:');
  if (result) {
    debugMaze[startX][startY] = '*'; // เปลี่ยน S เป็น * เพื่อแสดงเส้นทาง
    print('🎉 เจอทางออกแล้ว!');
  } else {
    print('😞 หาทางออกไม่เจอ');
  }

  print('\nแผนที่สุดท้าย:');
  printMaze(debugMaze);

  print('\n${'=' * 50}');
  print('💡 อธิบายสัญลักษณ์:');
  print('  * = เส้นทางที่ถูกต้อง');
  print('  . = เส้นทางที่ลองแล้วแต่เป็นทางตัน');
  print('  # = กำแพง');
  print('  E = ทางออก');
}
