import 'dart:async';

void main(List<String> arguments) {
  print('Start');

  // Future(() => 1)
  //     .then(print)
  //     .onError((error, stackTrace) {
  //       print(error);
  //       print(stackTrace);
  //     })
  //     .whenComplete(() {
  //       print('whenComplete');
  //     });
  Future(() => 1).then(print);
  scheduleMicrotask(() {
    print('11');
  });
  Future(() => Future(() => 2)).then(print);

  Future.delayed(const Duration(seconds: 1), () => 3).then(print);
  Future.delayed(const Duration(seconds: 1), () => Future(() => 4)).then(print);

  Future.value(5).then(print);
  Future.value(Future(() => 6)).then(print);
  scheduleMicrotask(() {
    print('22');
  });
  Future.sync(() => 7).then(print);
  Future.sync(() => Future(() => 8)).then(print);

  Future.microtask(() => 9).then(print);
  Future.microtask(() => Future(() => 10)).then(print);

  Future(() => 11).then(print);
  Future(() => Future(() => 12)).then(print);
  scheduleMicrotask(() {
    print('33');
  });
  print('End');
  scheduleMicrotask(() {
    print('44');
  });
}

// Start
// End
// 5
// 7
// 9
// 1
// 6
// 8
// 11
// 10
// 2
// 12
// 3
// 4
