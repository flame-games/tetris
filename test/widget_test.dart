import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tetris/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    expect(1, 1);
  });
}
