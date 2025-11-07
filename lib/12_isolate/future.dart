// Future<void> main() async {
//   print('1');

//   await Future.delayed(Duration(seconds: 2), () {
//     print('2');
//   });

//   print('3');
// }
void main() {
  print('1');

  Future.delayed(Duration(seconds: 2), () {
    print('2');
  });
  Future.delayed(Duration(seconds: 1), () {
    print('DD');
  });
  print('3');
}
