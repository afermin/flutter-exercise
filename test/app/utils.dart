import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> addDelay(int ms) async {
  await Future<void>.delayed(Duration(milliseconds: ms));
}

T findWidgetByKey<T>(Key key) {
  final Finder finder = find.byKey(key);
  return finder.evaluate().single.widget as T;
}

T findWidgetByText<T>(String value) {
  final Finder finder = find.text(value);
  return finder.evaluate().single.widget as T;
}

T findWidgetByType<T>(Type type) {
  final Finder finder = find.byType(type);
  return finder.evaluate().single.widget as T;
}

Widget createTestableWidget(Widget child) {
  return MaterialApp(
    home: child,
  );
}
