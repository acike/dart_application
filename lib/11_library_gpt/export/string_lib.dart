// library string_lib;

// String utility functions

String greet2(String name) => 'Hello, $name!';

String capitalize(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1);
}

String reverse(String input) {
  return String.fromCharCodes(input.runes.toList().reversed);
}

bool isPalindrome(String input) {
  final normalized = input.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
  return normalized == String.fromCharCodes(normalized.runes.toList().reversed);
}
