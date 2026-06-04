import 'package:flutter_test/flutter_test.dart';
import 'package:dani_dds/dani_dds.dart';

void main() {
  test('dani_dds exposes the default skin + design tokens', () {
    // GeminiSkin is the default skin (const, zero-arg constructor).
    const skin = GeminiSkin();
    expect(skin, isNotNull);
    expect(DaniDesignTokens.surfaceLight, isNotNull);
  });
}
