void main(List<String> args) {
  asyncGenerator().listen(print);
}

Stream<int> asyncGenerator() async* {
  final negativeStream = Stream<int>.periodic(
    const Duration(milliseconds: 500),
    (x) => -x,
  );

  for (var i = 0; i < 5; i++) {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield i;
  }
  yield* negativeStream;
}
