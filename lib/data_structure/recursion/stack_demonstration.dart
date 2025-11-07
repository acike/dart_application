// This file demonstrates exactly what the student explained about stack and LIFO!
// เรียนรู้เรื่อง Stack และ LIFO ใน Recursion

void main() {
  print('=== DEMONSTRATION OF STACK AND LIFO IN RECURSION ===\n');

  // print('Let\'s trace factorial(5) to see the stack in action!\n');

  int result = factorialWithTrace(5);
  print('\nFinal Result: 5! = $result');
  // print('\nAs you correctly explained:');
  // print('1. The stack builds up (function calls)');
  // print('2. Then returns follow LIFO rule');
  // print('3. Each level multiplies (not sums) with the result from below!');
}

// This version shows exactly what happens in the stack
int factorialWithTrace(int n, [int depth = 0]) {
  String indent = '  ' * depth; // For visual indentation

  print('$indent📥 CALL: factorial($n) - Added to stack (depth $depth)');

  // Base Case: หยุดเมื่อ n <= 1
  if (n <= 1) {
    print('$indent🛑 BASE CASE: factorial($n) = 1');
    print('$indent📤 RETURN: 1 (removing from stack)');
    return 1;
  }

  // Recursive Case: n! = n × (n-1)!
  print('$indent⏳ WAITING: factorial($n) needs factorial(${n - 1}) first...');

  // This is where the magic happens - the function waits here!
  int resultFromBelow = factorialWithTrace(n - 1, depth + 1);

  // Now we can calculate our result
  int myResult = n * resultFromBelow;
  print('$indent🔢 CALCULATE: $n × $resultFromBelow = $myResult');
  print('$indent📤 RETURN: $myResult (removing from stack)');

  return myResult;
}

// Your explanation in code form:
void demonstrateYourExplanation() {
  print('\n=== YOUR EXPLANATION IN CODE ===\n');

  print('1) It uses stack like below:');
  print('   5 × factorial(4)  ← Top of stack (last added)');
  print('   4 × factorial(3)');
  print('   3 × factorial(2)');
  print('   2 × factorial(1)');
  print('   1 × factorial(0)  ← Bottom of stack (first added)');

  print('\n2) It returns following the LIFO rule:');
  print('   factorial(0) >> 1');
  print('   factorial(1) >> 1 × 1 = 1');
  print('   factorial(2) >> 2 × 1 = 2');
  print('   factorial(3) >> 3 × 2 = 6');
  print('   factorial(4) >> 4 × 6 = 24');
  print('   factorial(5) >> 5 × 24 = 120');

  print('\n3) It doesn\'t store by summing each stack,');
  print('   but by multiplying the result from each stack!');
}

// Simple version without trace for comparison
int simpleFactorial(int n) {
  if (n <= 1) return 1;
  return n * simpleFactorial(n - 1);
}
