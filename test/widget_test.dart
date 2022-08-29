import 'package:flutter_test/flutter_test.dart';
import 'package:master/main.dart';

void main() {
  testWidgets('smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    // Since you wait 1 second to start the animation and another 1.4 to complete it
    await tester.pump(Duration(seconds: 60));

    expect(find.byType(MyApp), findsOneWidget);
  });
}
