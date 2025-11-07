List<int> showNormal(int n) {
  print('Started job (normal)');
  List<int> result = [];
  for (int i = 1; i <= n; i++) {
    print('Adding $i');
    result.add(i);
  }
  print('Ended job (normal)');
  return result;
}

Iterable<int> showGenerated(int n) sync* {
  print('Started job (generated)');
  for (int i = 1; i <= n; i++) {
    print('Yielding $i');
    yield i;
  }
  print('Ended job (generated)');
}

//create main
void main() {
  print('Started job (main)');
  final resultNormal = showNormal(4);
  print('List: $resultNormal');
  print('Done');
  print('--------------------------------');
  print('Started job (main2)');
  final resultGenerated = showGenerated(4);
  // print('List: $resultGenerated');

  print(
    'Access first: ${resultGenerated.first}',
  ); // ไม่ run ใหม่หมด ใช้ตัวแรกทันที
  print(
    'Access last: ${resultGenerated.last}',
  ); // run generator ไปจนถึงตัวสุดท้าย
  print('Done');
  var listFromIterable = showGenerated(3).toList();
  print(listFromIterable);
}
