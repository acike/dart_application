int badFactorial(int n) {
  return n * badFactorial(n - 1); // ไม่มีเงื่อนไขหยุด!
}

void main() {
  // print(badFactorial(3));
  // print(fibonacci(3));

  print(fibonacciIterative(1));
  print(fibonacciIterative(2));
  print(fibonacciIterative(3));
  print(fibonacciIterative(4));
  print(fibonacciIterative(5));
  print(fibonacciIterative(6));
  print(fibonacciIterative(7));
  print(fibonacciIterative(8));
}

// ❌ Recursion: O(n) space
int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2); // แย่มาก O(2^n) time!
}

// ✅ Iteration: O(1) space, O(n) time
int fibonacciIterative(int n) {
  if (n <= 1) return n;
  int prev = 0, curr = 1;
  for (int i = 2; i <= n; i++) {
    int next = prev + curr;
    prev = curr;
    curr = next;
  }
  return curr;
}
