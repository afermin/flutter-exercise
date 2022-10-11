import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_exercise/app/screens/home/widgets/link_list.dart';
import 'package:nubank_exercise/app/screens/home/widgets/link_list_item.dart';
import 'package:nubank_exercise/di/init_di.dart';
import 'package:nubank_exercise/domain/entities/link.dart';

import '../../../utils.dart';

void main() {
  setUpAll(() => configureDependencies());

  group(
    'LinkList scenarios',
    () {
      const Link link = Link(alias: "alias", self: "self", short: "short");

      testWidgets(
        'Given a $LinkList widget'
        'When it receives an empty list of links'
        'Then the list should be there but without items',
        (WidgetTester tester) async {
          await tester.pumpWidget(createTestableWidget(const LinkList([])));
          await tester.pump();

          Finder finder = find.byType(LinkListItem);
          expect(finder, findsNothing);
        },
      );

      testWidgets(
        'Given a $LinkList widget'
        'When it receives list of one link'
        'Then the list should with one item',
        (WidgetTester tester) async {
          await tester.pumpWidget(createTestableWidget(const LinkList([link])));
          await tester.pump();

          Finder finder = find.byType(LinkListItem);
          expect(finder, findsOneWidget);
        },
      );

      testWidgets(
        'Given a $LinkList widget'
        'When it receives list of four links'
        'Then the list should with four items',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            createTestableWidget(const LinkList([link, link, link, link])),
          );
          await tester.pump();

          Finder finder = find.byType(LinkListItem);
          expect(finder, findsNWidgets(4));
        },
      );
    },
  );
}
