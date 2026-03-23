import 'package:flutter_riverpod/flutter_riverpod.dart';

/// It will be fetch by api i demonstrate the demo with the stream provider
final globalCountProvider = StreamProvider<int>((ref) async* {
  int count = 2841092;
  yield count;

  await for (final _ in Stream.periodic(const Duration(seconds: 2))) {
    count += (1 + (count % 5));
    yield count;
  }
});