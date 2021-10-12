// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:ecommerce_design/screens/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ecommerce_design/main.dart';

void main() {
  testWidgets('Material App Testing', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Text('Item Cart Page'),
      ),
    ));

    // Find a widget that displays the letter 'H'.
    expect(find.text('Item Cart Page'), findsOneWidget);

  });
}
