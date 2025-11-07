/// 🤔 Sort + Binary Search vs Linear Search
/// ข้อมูลไม่เรียง: เสียเวลา sort ก่อนดีกว่าไหม?
library;

import 'dart:math';

void main() {
  print('=== 🤔 Sort + Binary Search vs Linear Search ===\n');

  // 1. เปรียบเทียบ time complexity
  print('⏱️ 1. Time Complexity Analysis');
  timeComplexityAnalysis();

  // 2. คำนวณจำนวน operations
  print('\n🧮 2. Operations Count Comparison');
  operationsComparison();

  // 3. เมื่อไหร่ควรใช้อะไร
  print('\n🎯 3. When to Use What?');
  whenToUseWhat();

  // 4. ตัวอย่างจริง
  print('\n�� 4. Real-world Examples');
  realWorldExamples();

  // 5. สรุปคำแนะนำ
  print('\n💡 5. Recommendations');
  recommendations();
}

// ==================== Time Complexity Analysis ====================

void timeComplexityAnalysis() {
  print('  📊 Time Complexity Comparison:');
  print('');

  print('  🔍 Linear Search (on unsorted data):');
  print('    • Time: O(n)');
  print('    • Space: O(1)');
  print('    • Preprocessing: None');
  print('    • Total: O(n)');
  print('');

  print('  🔄 Sort + Binary Search:');
  print('    • Sort time: O(n log n)');
  print('    • Binary search: O(log n)');
  print('    • Space: O(1) for in-place sort');
  print('    • Total: O(n log n) + O(log n) = O(n log n)');
  print('');

  print('  🎯 Analysis:');
  print('    • Single search: Linear O(n) < Sort+Binary O(n log n)');
  print('    • Multiple searches: Depends on number of searches');
  print('');

  print('  🔢 Break-even point calculation:');
  print('    • Let k = number of searches');
  print('    • Linear: k × O(n)');
  print('    • Sort+Binary: O(n log n) + k × O(log n)');
  print('    • Break-even when: k × n = n log n + k × log n');
  print('    • Solving: k × (n - log n) = n log n');
  print('    • k = n log n / (n - log n)');
}

// ==================== Operations Comparison ====================

void operationsComparison() {
  print('  🧮 Operations Count for n = 100,000:');
  print('');

  int n = 100000;
  double logN = log(n) / log(2);
  int binarySearchOps = logN.ceil();

  // Sorting operations (assuming efficient sort like QuickSort/MergeSort)
  int sortOps = (n * logN).round();

  print('  📊 Basic Operations:');
  print('    • Array size (n): ${n.toString().padLeft(10)}');
  print('    • log₂(n): ${logN.toStringAsFixed(2).padLeft(10)}');
  print('    • Linear search: ${n.toString().padLeft(10)} operations');
  print(
    '    • Binary search: ${binarySearchOps.toString().padLeft(10)} operations',
  );
  print(
    '    • Sorting (n log n): ${sortOps.toString().padLeft(10)} operations',
  );
  print('');

  print('  🔍 Comparison by Number of Searches:');
  print('  Searches | Linear Total | Sort+Binary Total | Winner');
  print('  ---------|--------------|-------------------|--------');

  List<int> searchCounts = [1, 5, 10, 20, 50, 100, 200, 500];

  for (int searches in searchCounts) {
    int linearTotal = searches * n;
    int sortBinaryTotal = sortOps + (searches * binarySearchOps);
    String winner = linearTotal < sortBinaryTotal ? 'Linear' : 'Sort+Binary';

    print(
      '  ${searches.toString().padLeft(8)} | ${linearTotal.toString().padLeft(12)} | ${sortBinaryTotal.toString().padLeft(17)} | $winner',
    );
  }

  // Calculate break-even point
  double breakEven = sortOps / (n - binarySearchOps);
  print('');
  print('  🎯 Break-even point: ${breakEven.toStringAsFixed(1)} searches');
  print('    • < ${breakEven.toStringAsFixed(1)} searches: Use Linear Search');
  print(
    '    • > ${breakEven.toStringAsFixed(1)} searches: Use Sort + Binary Search',
  );
}

// ==================== When to Use What ====================

void whenToUseWhat() {
  print('  🎯 Decision Matrix:');
  print('');

  print('  📝 Use Linear Search when:');
  print('    ✅ Data is unsorted');
  print('    ✅ Only 1-2 searches needed');
  print('    ✅ Data changes frequently');
  print('    ✅ Memory is limited');
  print('    ✅ Simple implementation needed');
  print('    ✅ Small datasets (< 1000 items)');
  print('');

  print('  🔄 Use Sort + Binary Search when:');
  print('    ✅ Multiple searches needed (> 17 searches for 100k items)');
  print('    ✅ Data doesn\'t change often');
  print('    ✅ Performance is critical');
  print('    ✅ Large datasets');
  print('    ✅ Can afford preprocessing time');
  print('');

  print('  🚀 Use Pre-sorted Data Structure when:');
  print('    ✅ Frequent insertions AND searches');
  print('    ✅ Use TreeSet, SortedList, or similar');
  print('    ✅ Insertion: O(log n), Search: O(log n)');
}

// ==================== Real-world Examples ====================

void realWorldExamples() {
  print('  🧪 Real-world Scenarios:');
  print('');

  print('  📚 Scenario 1: Phone Book App');
  print('    • 100,000 contacts');
  print('    • User searches 1-2 names per session');
  print('    • Contacts change frequently');
  print('    • 🏆 Winner: Linear Search');
  print('    • Reason: Few searches, data changes often');
  print('');

  print('  �� Scenario 2: E-commerce Product Search');
  print('    • 100,000 products');
  print('    • User searches 10-50 products per session');
  print('    • Product list updated daily');
  print('    • 🏆 Winner: Sort + Binary Search');
  print('    • Reason: Many searches, data stable during session');
  print('');

  print('  🎮 Scenario 3: Game Leaderboard');
  print('    • 100,000 players');
  print('    • Find player rank 100+ times per minute');
  print('    • Scores update continuously');
  print('    • 🏆 Winner: Sorted Data Structure (TreeSet)');
  print('    • Reason: Frequent inserts AND searches');
  print('');

  print('  📊 Scenario 4: Log File Analysis');
  print('    • 100,000 log entries');
  print('    • Search for specific timestamps 1000+ times');
  print('    • Data is read-only');
  print('    • 🏆 Winner: Sort + Binary Search');
  print('    • Reason: Many searches, no data changes');
}

// ==================== Recommendations ====================

void recommendations() {
  print('  💡 Smart Recommendations:');
  print('');

  print('  🔢 By Number of Searches (for 100k items):');
  print('    • 1-17 searches: Linear Search');
  print('    • 18+ searches: Sort + Binary Search');
  print('');

  print('  📈 By Data Size:');
  print('    • < 100 items: Always Linear (simple & fast enough)');
  print('    • 100-10,000 items: Consider break-even point');
  print('    • > 10,000 items: Usually Sort + Binary if multiple searches');
  print('');

  print('  🔄 By Data Mutability:');
  print('    • Frequently changing: Linear Search');
  print('    • Stable/Read-only: Sort + Binary Search');
  print('    • Mixed: Use sorted data structure');
  print('');

  print('  ⚡ Performance Tips:');
  print('    • Pre-sort data if possible');
  print('    • Use built-in sort (highly optimized)');
  print('    • Consider caching sorted results');
  print('    • Profile your specific use case');
  print('');

  print('  🎯 Final Answer for 100k unsorted data:');
  print('    • 1 search: Linear Search (100k ops vs 1.6M ops)');
  print('    • 20+ searches: Sort + Binary Search wins');
  print('    • Break-even: ~17 searches');

  calculateSpecificExample();
}

void calculateSpecificExample() {
  print('');
  print('  🧮 Specific Example (100,000 items):');

  int n = 100000;
  double logN = log(n) / log(2);
  int binaryOps = logN.ceil();
  int sortOps = (n * logN).round();

  print('    Single search:');
  print('      Linear: ${n.toString().padLeft(10)} operations');
  print(
    '      Sort+Binary: ${(sortOps + binaryOps).toString().padLeft(10)} operations',
  );
  print('      Winner: Linear (${(sortOps + binaryOps) ~/ n}x faster)');
  print('');

  int searches = 20;
  int linearTotal = searches * n;
  int sortBinaryTotal = sortOps + (searches * binaryOps);

  print('    $searches searches:');
  print('      Linear: ${linearTotal.toString().padLeft(10)} operations');
  print(
    '      Sort+Binary: ${sortBinaryTotal.toString().padLeft(10)} operations',
  );
  String winner = linearTotal < sortBinaryTotal ? 'Linear' : 'Sort+Binary';
  double ratio =
      linearTotal < sortBinaryTotal
          ? sortBinaryTotal / linearTotal
          : linearTotal / sortBinaryTotal;
  print('      Winner: $winner (${ratio.toStringAsFixed(1)}x faster)');
}
