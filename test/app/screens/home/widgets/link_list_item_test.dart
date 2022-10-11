import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_exercise/app/screens/home/home_widgets_keys.dart';
import 'package:nubank_exercise/app/screens/home/widgets/link_list_item.dart';
import 'package:nubank_exercise/di/init_di.dart';
import 'package:nubank_exercise/domain/entities/link.dart';

import '../../../utils.dart';

void main() {
  setUpAll(() => configureDependencies());

  group(
    'LinkListItem scenarios',
    () {
      const Link link = Link(alias: "alias", self: "self", short: "short");

      testWidgets(
        'Given a $LinkListItem widget when a link as a parameter'
        'Then the short and self $Text should their related values',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            createTestableWidget(const LinkListItem(link)),
          );
          await tester.pump();

          Text shortText = findWidgetByKey(HomeWidgetsKeys.textShortLink);
          Text selfText = findWidgetByKey(HomeWidgetsKeys.textSelfLink);
          expect(shortText.data, "short");
          expect(selfText.data, "self");
        },
      );
    },
  );
}
