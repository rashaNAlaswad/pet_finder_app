import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pet_finder_app/main.dart' as app;
import 'package:get_it/get_it.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Pet Finder App Integration Tests', () {

    setUp(() {
      GetIt.instance.reset();
    });

    group('Happy Path Tests', () {
      testWidgets('app launches and shows onboarding screen', (
        WidgetTester tester,
      ) async {
        app.main();
        await tester.pumpAndSettle();

        expect(find.text('Find Your Best Companion With Us'), findsOneWidget);
      });

      testWidgets('navigates from onboarding to home screen', (
        WidgetTester tester,
      ) async {
        app.main();
        await tester.pumpAndSettle();

        final getStartedButton = find.text('Get Started');
        expect(getStartedButton, findsOneWidget);
        await tester.tap(getStartedButton);
        await tester.pumpAndSettle();

        expect(find.text('Find Your Forever Pet'), findsOneWidget);
      });

      testWidgets('home screen displays breeds after loading', (
        WidgetTester tester,
      ) async {
        app.main();
        await tester.pumpAndSettle();

        final getStartedButton = find.text('Get Started');
        expect(getStartedButton, findsOneWidget);
        await tester.tap(getStartedButton);
        await tester.pumpAndSettle(const Duration(seconds: 5));

        expect(find.byType(Card), findsWidgets);
      });

      testWidgets('details screen displays breed information after loading', (
        WidgetTester tester,
      ) async {
        app.main();
        await tester.pumpAndSettle();

        final getStartedButton = find.text('Get Started');
        expect(getStartedButton, findsOneWidget);
        await tester.tap(getStartedButton);
        await tester.pumpAndSettle(const Duration(seconds: 8));

        final breedCards = find.byType(Card);
        expect(breedCards, findsWidgets);
        await tester.tap(breedCards.first);
        await tester.pumpAndSettle(const Duration(seconds: 8));

        expect(find.text('Description:'), findsOneWidget);
        expect(find.text('Origin: '), findsOneWidget);
        expect(find.text('Life Span: '), findsOneWidget);
        expect(find.text('Weight: '), findsOneWidget);
      });

      testWidgets('back button returns to home screen', (
        WidgetTester tester,
      ) async {
        app.main();
        await tester.pumpAndSettle();

        final getStartedButton = find.text('Get Started');
        expect(getStartedButton, findsOneWidget);
        await tester.tap(getStartedButton);
        await tester.pumpAndSettle(const Duration(seconds: 5));

        final breedCards = find.byType(Card);
        expect(breedCards, findsWidgets);
        await tester.tap(breedCards.first);
        await tester.pumpAndSettle(const Duration(seconds: 5));

        final backButton = find.byIcon(Icons.arrow_back_ios_rounded);
        expect(backButton, findsOneWidget);
        await tester.tap(backButton);
        await tester.pumpAndSettle();

        expect(find.text('Find Your Forever Pet'), findsOneWidget);
      });
    });

    group('Edge Case Tests', () {
      testWidgets('search functionality works', (WidgetTester tester) async {
        app.main();
        await tester.pumpAndSettle();

        final getStartedButton = find.text('Get Started');
        expect(getStartedButton, findsOneWidget);
        await tester.tap(getStartedButton);
        await tester.pumpAndSettle(const Duration(seconds: 5));

        final searchField = find.byType(TextFormField);
        expect(searchField, findsOneWidget);
        await tester.enterText(searchField, 'Labrador');
        await tester.pumpAndSettle();

        expect(find.text('Labrador'), findsWidgets);
      });

      testWidgets('pull-to-refresh reloads data', (WidgetTester tester) async {
        app.main();
        await tester.pumpAndSettle();

        final getStartedButton = find.text('Get Started');
        expect(getStartedButton, findsOneWidget);
        await tester.tap(getStartedButton);
        await tester.pumpAndSettle(const Duration(seconds: 5));

        await tester.drag(find.byType(ListView), const Offset(0, 300));
        await tester.pumpAndSettle();

        expect(find.text('Find Your Forever Pet'), findsOneWidget);
      });

      testWidgets('handles empty search results', (WidgetTester tester) async {
        app.main();
        await tester.pumpAndSettle();

        final getStartedButton = find.text('Get Started');
        expect(getStartedButton, findsOneWidget);
        await tester.tap(getStartedButton);
        await tester.pumpAndSettle(const Duration(seconds: 5));

        final searchField = find.byType(TextFormField);
        expect(searchField, findsOneWidget);
        await tester.enterText(searchField, 'NonExistentBreed');
        await tester.pumpAndSettle();

        expect(find.text('No results found'), findsOneWidget);
      });
    });
  });
}
