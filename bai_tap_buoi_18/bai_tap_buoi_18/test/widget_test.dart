import 'package:flutter_test/flutter_test.dart';
import 'package:bai_tap_buoi_18/main.dart';

void main() {
  testWidgets('App smoke test - loads menu screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Bài Tập Widget Layout'), findsOneWidget);
  });
}
