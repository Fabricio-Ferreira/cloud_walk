import 'package:cloud_walk_test/core/util/try_cast.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('tryCast function', () {
    group('should return null', () {
      test('if is null', () => expect(tryCast(null), equals(null)));
      test('if is not the correct type', () => expect(tryCast<double>('String'), equals(null)));
    });
    test('should return the var typed if is the correct type', () {
      expect(tryCast<String>('String'), isA<String>());
    });
  });
}
