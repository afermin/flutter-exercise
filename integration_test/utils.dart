import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> addDelay(int ms) async {
  await Future<void>.delayed(Duration(milliseconds: ms));
}

T findWidgetByKey<T>(String value) {
  final Finder finder = find.byKey(Key(value));
  return finder.evaluate().single.widget as T;
}

T findWidgetByText<T>(String value) {
  final Finder finder = find.text(value);
  return finder.evaluate().single.widget as T;
}
