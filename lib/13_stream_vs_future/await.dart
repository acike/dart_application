import 'dart:async';

Future main(List<String> arguments) async {
  late final int a;

  print('Start');
  // await Future(() => 2).then((value) => a = value);

  a = await Future(() => 1);

  print(a);

  print('End');
}

//both are the same result but second one is idiom style
