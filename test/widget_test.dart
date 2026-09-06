import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio/main.dart';

void main() {
  testWidgets('navigates between all three pages', (tester) async {
    await tester.pumpWidget(const PortfolioApp());

    // Home page shows the introduction.
    expect(find.text("Hi, I'm Vivek"), findsOneWidget);

    // Go to About.
    await tester.tap(find.text('About'));
    await tester.pumpAndSettle();
    expect(find.text('About Me'), findsOneWidget);
    expect(find.text('Python'), findsWidgets);

    // Go to Projects.
    await tester.tap(find.text('Projects'));
    await tester.pumpAndSettle();
    expect(find.text('My Projects'), findsOneWidget);
    expect(find.text('Personal Finance Management App'), findsOneWidget);
  });
}
