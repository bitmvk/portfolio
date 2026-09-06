import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio/main.dart';

void main() {
  testWidgets('navigates between all three pages with buttons', (tester) async {
    await tester.pumpWidget(const PortfolioApp());

    // Home page shows the introduction.
    expect(find.text("Hi, I'm Vivek"), findsOneWidget);

    // Button to About (scroll it into view first — it's below the fold).
    await tester.ensureVisible(find.text('About Me'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('About Me'));
    await tester.pumpAndSettle();
    expect(find.text('Frameworks & Tools'), findsOneWidget);
    expect(find.text('Python'), findsWidgets);

    // Button to Projects.
    await tester.ensureVisible(find.text('Projects'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Projects'));
    await tester.pumpAndSettle();
    expect(find.text('Personal Finance Management App'), findsOneWidget);

    // Home button pops back to the first page.
    await tester.ensureVisible(find.text('Home'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();
    expect(find.text("Hi, I'm Vivek"), findsOneWidget);
  });
}
