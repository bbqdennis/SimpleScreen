// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (tester) async {
      // Load app widget.
      await tester.pumpWidget(const MyApp());

      // Verify the counter starts at 0.
      expect(find.text('0'), findsOneWidget);

      // Added delay to wait for the counter to increment.
      //await Future.delayed(const Duration(seconds: 2));

      // Finds the floating action button to tap on.
      final fab = find.byKey(const Key('increment'));

      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      //await Future.delayed(const Duration(seconds: 2));

      // Trigger a frame.
      await tester.pumpAndSettle();

      //await Future.delayed(const Duration(seconds: 2));

      // Verify the counter increments by 1.
      expect(find.text('1'), findsOneWidget);

      //await Future.delayed(const Duration(seconds: 2));
    });
  });
}
