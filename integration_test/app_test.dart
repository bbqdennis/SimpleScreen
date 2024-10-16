import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final screen = const MyApp();
  runApp(screen);

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (tester) async {
      // Load app widget.
      await tester.pumpWidget(screen);

      // Verify the counter starts at 0.
      expect(find.text('0'), findsOneWidget);

      // Added delay to wait for the counter to increment.
      await Future.delayed(const Duration(seconds: 2));

      // Finds the floating action button to tap on.
      final fab = find.byKey(const Key('increment'));

      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      await Future.delayed(const Duration(seconds: 2));

      // Trigger a frame.
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 2));

      // Verify the counter increments by 1.
      expect(find.text('1'), findsOneWidget);

      await Future.delayed(const Duration(seconds: 2));
    });
  });
}
