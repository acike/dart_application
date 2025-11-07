// Real-world use cases for Iterable in Dart

// Case 1: Processing large datasets efficiently
Iterable<String> readLargeFile(int numberOfLines) sync* {
  print('Started reading large file');
  for (int i = 1; i <= numberOfLines; i++) {
    // Simulate reading line by line instead of loading the entire file
    yield 'Line $i: This is content from a very large file';
  }
  print('Finished reading file');
}

// Case 2: Creating custom data ranges
Iterable<DateTime> dateRange(DateTime start, DateTime end) sync* {
  var current = start;
  while (current.isBefore(end) || current.isAtSameMomentAs(end)) {
    yield current;
    current = current.add(Duration(days: 1));
  }
}

// Case 3: Lazy filtering of expensive operations
Iterable<int> findPrimeNumbers(int max) sync* {
  print('Starting prime number search');
  for (int number = 2; number <= max; number++) {
    if (isPrime(number)) {
      print('Found prime: $number');
      yield number;
    }
  }
  print('Completed prime number search');
}

bool isPrime(int n) {
  // Simulate expensive computation
  if (n <= 1) return false;
  if (n <= 3) return true;
  if (n % 2 == 0 || n % 3 == 0) return false;

  int i = 5;
  while (i * i <= n) {
    if (n % i == 0 || n % (i + 2) == 0) return false;
    i += 6;
  }
  return true;
}

// Case 4: Data transformation pipeline
Iterable<Map<String, dynamic>> processUserData(
  List<Map<String, dynamic>> users,
) sync* {
  for (var user in users) {
    // Only process users with valid email
    if (user['email'] != null && user['email'].toString().contains('@')) {
      // Enrich user data
      user['isActive'] = true;
      user['lastProcessed'] = DateTime.now().toIso8601String();
      yield user;
    }
  }
}

void main() {
  // Example 1: Efficiently read large file line by line
  print('\n--- Example 1: Processing large files ---');
  final fileLines = readLargeFile(1000);
  // We can process the first 5 lines without reading the entire file
  print('First 5 lines:');
  for (var line in fileLines.take(5)) {
    print(line);
  }

  // Example 2: Working with date ranges
  print('\n--- Example 2: Date ranges ---');
  final startDate = DateTime(2023, 12, 25);
  final endDate = DateTime(2024, 1, 1);
  final holidays = dateRange(startDate, endDate);

  print('Holiday dates:');
  for (var date in holidays) {
    print(date.toString().split(' ')[0]); // Just print the date part
  }

  // Example 3: Finding prime numbers lazily
  print('\n--- Example 3: Finding first few prime numbers ---');
  final primes = findPrimeNumbers(100);
  print('First 10 prime numbers:');
  for (var prime in primes.take(10)) {
    print(prime);
  }

  // Example 4: Processing user data
  print('\n--- Example 4: Processing user data ---');
  final users = [
    {'name': 'John', 'email': 'john@example.com', 'age': 28},
    {'name': 'Sarah', 'email': null, 'age': 32},
    {'name': 'Mike', 'email': 'mike@company.org', 'age': 41},
    {'name': 'Lisa', 'email': 'invalid-email', 'age': 25},
  ];

  final processedUsers = processUserData(users).toList();
  print('Processed ${processedUsers.length} valid users:');
  for (var user in processedUsers) {
    print('${user['name']} - ${user['email']} - Active: ${user['isActive']}');
  }

  // Example 5: Benefits of lazy evaluation
  print('\n--- Example 5: Lazy evaluation benefits ---');
  // Create an iterable of 1 million numbers (this happens instantly)
  final largeIterable = Iterable.generate(1000000, (i) => i);

  // Find the first number that meets specific conditions
  // Without iterables, we'd need to process all numbers
  print('Finding first match in large dataset');
  final firstMatch =
      largeIterable
          .where((num) => num > 500000)
          .where((num) => num % 7 == 0)
          .where((num) => num % 13 == 0)
          .first;

  print('First matching number: $firstMatch');
  print(
    'Processing stopped after finding match - no need to check remaining items',
  );
}
