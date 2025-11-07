import 'dart:async';

// void main(List<String> args) {
//   // Stream.periodic(const Duration(seconds: 1), (x) => x).listen(print);

//   // Stream.fromFutures([Future(() => 3), Future.value(2)]).listen(print);

//   // if we want to subscribe multiple times, we need to use broadcast stream
//   // final StreamController streamController = StreamController<int>.broadcast();
//   final StreamController streamController = StreamController<int>();

//   final streamSubscription = streamController.stream.listen(print);
//   // final otherStreamSubscription = streamController.stream.listen(print);
//   var value = 0;
//   Timer.periodic(const Duration(seconds: 1), (timer) {
//     if (value == 5) {
//       timer.cancel();
//       streamController.close();
//       // streamSubscription.cancel();
//       // otherStreamSubscription.cancel();
//     } else {
//       streamController.add(value++);
//     }
//   });
// }

void main(List<String> args) async {
  // Stream.periodic(const Duration(seconds: 1), (x) => x).listen(print);

  // Stream.fromFutures([Future(() => 3), Future.value(2)]).listen(print);

  // if we want to subscribe multiple times, we need to use broadcast stream
  // final StreamController streamController = StreamController<int>.broadcast();
  final StreamController streamController = StreamController<int>();

  // final streamSubscription = streamController.stream.listen(print);
  // final otherStreamSubscription = streamController.stream.listen(print);
  var value = 0;
  Timer.periodic(const Duration(seconds: 1), (timer) {
    if (value == 5) {
      timer.cancel();
      streamController.close();
      // streamSubscription.cancel();
      // otherStreamSubscription.cancel();
    } else {
      streamController.add(value++);
    }
  });
  // Timer.periodic
  var max = 0;
  await for (var value in streamController.stream) {
    print('value: $value');
    max = value > max ? value : max;
    print('max: $max');
  }
  // await streamController.stream.forEach((value) {
  //   print('value: $value');
  //   max = value > max ? value : max;
  //   print('max: $max');
  // });
  print('last max: $max');
}
