// Captures real rendered screenshots of every page at desktop and phone
// sizes into screenshots/, so visual bugs can be seen and checked.
//
// Desktop run:   flutter test integration_test/app_test.dart -d linux
// Phone run:     PORTFOLIO_W=420 PORTFOLIO_H=900 \
//                flutter test integration_test/app_test.dart -d linux \
//                  --dart-define=PHONE=true

import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:portfolio/main.dart';

const isPhone = bool.fromEnvironment('PHONE');

Future<void> shot(WidgetTester tester, String name) async {
  final boundary = tester.renderObject<RenderRepaintBoundary>(
    find.byKey(const Key('shot')),
  );
  final image = await boundary.toImage(pixelRatio: 1.0);
  final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
  File('screenshots/$name.png')
    ..createSync(recursive: true)
    ..writeAsBytesSync(bytes!.buffer.asUint8List());
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> go(WidgetTester tester, String label) async {
    await tester.ensureVisible(find.text(label));
    await tester.pumpAndSettle();
    await tester.tap(find.text(label));
    await tester.pumpAndSettle();
  }

  // Snap every scrollable to the top so screenshots show the page as it
  // appears on arrival (short pages are centered, not scrolled).
  Future<void> atTop(WidgetTester tester) async {
    for (final s in tester.stateList<ScrollableState>(find.byType(Scrollable))) {
      s.position.jumpTo(0);
    }
    await tester.pump();
  }

  testWidgets('capture screenshots of all pages', (tester) async {
    if (isPhone) {
      // Render at a phone size regardless of the window.
      tester.view.physicalSize = const Size(420, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);
    }

    await tester.pumpWidget(
      RepaintBoundary(key: const Key('shot'), child: const PortfolioApp()),
    );
    await tester.pumpAndSettle();

    Future<void> pages() async {
      await atTop(tester);
      await shot(tester, isPhone ? 'home-phone' : 'home-desktop');
      await go(tester, 'About Me');
      await atTop(tester);
      await shot(tester, isPhone ? 'about-phone' : 'about-desktop');
      await go(tester, 'Projects');
      await atTop(tester);
      await shot(tester, isPhone ? 'projects-phone' : 'projects-desktop');
      // Bottom of the projects list and its buttons row.
      await tester.ensureVisible(find.text('Home'));
      await tester.pumpAndSettle();
      if (!isPhone) await shot(tester, 'projects-desktop-bottom');
    }

    await pages();

    if (!isPhone) {
      // Also capture the about page's bottom (buttons row).
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Projects'));
      await tester.pumpAndSettle();
      await shot(tester, 'about-desktop-bottom');
    }
  });
}
