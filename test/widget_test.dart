import 'package:flutter_test/flutter_test.dart';

import 'package:reeducation/main.dart';

void main() {
  testWidgets('App renders role selection page', (WidgetTester tester) async {
    await tester.pumpWidget(const ReeducationApp());

    expect(find.text('Rééducation'), findsOneWidget);
    expect(find.text('Médecin'), findsOneWidget);
    expect(find.text('Patient'), findsOneWidget);
  });
}
