// void main() {
//   print("A");
//   Future(() {
//     print("B");
//     Future(() => print("C"));
//     Future(() => print("D"));
//     Future(() => print("E"));
//     print("F");
//   });
//   print("G");
// }
void main() {
  print("A");
  Future(() async {
    print("B");
    Future(() => print("C"));
    Future.microtask(() => print("D"));
    await Future(() => print("E"));
    print("F");
  });
  print("G");
}

// void main() {
//   print("A");
//   Future(() async {
//     print("B");
//     Future(() => print("C"));
//     await Future(() => print("D"));
//     Future(() => print("E"));
//     print("F");
//   });
//   print("G");
// }
