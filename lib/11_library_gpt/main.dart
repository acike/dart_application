import 'package:dart_application_1/11_library_gpt/first_lib/first_lib.dart';

// import 'export/top_lib.dart' show greet2;
// import 'export/top_lib.dart' show add2;
import 'export/top_lib.dart';

// import 'package:dart_application_1/11_library_gpt/export/top_lib.dart';
void main() {
  print(add2(2, 3)); // 5
  print(greet2('Ike')); // Hello, Ike!
  helperFunction();
  helperFunction2();
}
