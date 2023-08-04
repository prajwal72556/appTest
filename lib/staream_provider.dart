import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamnumberprovider =
    StreamProvider.autoDispose<int>((ref) => fetchNumbers());
Stream<int> fetchNumbers() {
  return Stream<int>.periodic(
    const Duration(seconds: 2),
    (number) => number,
  ).take(
    100,
  );
}
