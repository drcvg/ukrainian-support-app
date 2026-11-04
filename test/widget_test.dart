
import 'package:flutter_test/flutter_test.dart';
import 'package:ukranian_support/app/app.dart';

void main() {
  testWidgets('La aplicación se inicia correctamente', (WidgetTester tester) async {
    await tester.pumpWidget(const UkrainianSupportApp());

    await tester.pump(const Duration(seconds: 2));
    await tester.pump();

    expect(find.byType(UkrainianSupportApp), findsOneWidget);
  });
}
