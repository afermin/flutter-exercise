import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:nubank_exercise/app/screens/home/home_widgets_keys.dart';
import 'package:nubank_exercise/app/screens/home/state_management/home_cubit.dart';
import 'package:nubank_exercise/app/screens/home/state_management/home_state.dart';
import 'package:nubank_exercise/app/screens/home/widgets/link_list.dart';
import 'package:nubank_exercise/di/init_di.dart';
import 'package:nubank_exercise/main.dart';

import '../test/app/utils.dart';

class FakeHomeState extends Fake implements HomeState {}

@GenerateNiceMocks([MockSpec<HomeCubit>()])
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  setUpAll(() => configureDependencies());

  group(
    'end-to-end test',
    () {
      testWidgets(
        'Given a MyApp widget'
        'Then links field in LinkList widget should not have any item',
        (WidgetTester tester) async {
          await tester.pumpWidget(const MyApp());
          await tester.pumpAndSettle();

          LinkList linkList = findWidgetByKey(HomeWidgetsKeys.linkList);
          expect(linkList.links.length, 0);
        },
      );

      testWidgets(
        'Given a MyApp widget'
        'When introducing a valid url'
        'Then links field in LinkList widget should have one item with '
        'the same valid url set',
        (WidgetTester tester) async {
          String urlInput = 'google.com';

          await tester.pumpWidget(const MyApp());
          await tester.pumpAndSettle();

          await tester.enterText(
            find.byKey(HomeWidgetsKeys.linkTextField),
            urlInput,
          );
          await tester.tap(find.byType(IconButton));
          await addDelay(100);
          expect(
            find.byKey(HomeWidgetsKeys.submitProgressIndicator),
            findsOneWidget,
          );
          await addDelay(3000);

          LinkList linkList = findWidgetByKey(HomeWidgetsKeys.linkList);

          expect(find.byKey(HomeWidgetsKeys.submitLinkButton), findsOneWidget);
          expect(linkList.links.length, 1);
          expect(linkList.links[0].self, urlInput);
        },
      );

      testWidgets(
        'Given a MyApp widget'
        'When introducing an invalid url'
        'Then links field in LinkList widget should not have any item',
        (WidgetTester tester) async {
          String urlInput = 'google';

          await tester.pumpWidget(const MyApp());
          await tester.pumpAndSettle();

          await tester.enterText(
            find.byKey(HomeWidgetsKeys.linkTextField),
            urlInput,
          );
          await tester.tap(find.byType(IconButton));
          await addDelay(100);
          LinkList linkList = findWidgetByKey(HomeWidgetsKeys.linkList);
          Finder errorWidget = find.text('Enter a valid link');

          expect(linkList.links.length, 0);
          expect(errorWidget, findsOneWidget);
        },
      );
    },
  );
}
