import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:leaf/main.dart';
import 'package:leaf/view/pages/home_page.dart';

void main() {
  testWidgets("Test du Wifget Leaf", (WidgetTester tester) async {
    await tester.pumpWidget(Leaf());

    //Test: materialApp présence
    expect(find.byType(Material), findsOneWidget);

    //Test: HomePage présence
    expect(find.byType(HomePage), findsOneWidget);
  });
}
