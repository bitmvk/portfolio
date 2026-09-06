import 'package:flutter/material.dart';

import 'pages/about_page.dart';
import 'pages/home_page.dart';
import 'pages/projects_page.dart';
import 'widgets/page_frame.dart';

void main() => runApp(const PortfolioApp());

/// Lets us launch the app on a specific page (used for screenshots):
/// flutter run --dart-define=PAGE=about
const _page = String.fromEnvironment('PAGE', defaultValue: 'home');

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF1E1B4B),
        colorScheme: ColorScheme.fromSeed(
          seedColor: accentColor,
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1B4B),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: const StadiumBorder(),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.white54),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: const StadiumBorder(),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: const Color(0xFF453F7A),
          side: const BorderSide(color: Colors.white24),
          labelStyle: const TextStyle(color: Colors.white, fontSize: 13),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      // Navigation: a simple stack. Buttons push named routes; the AppBar
      // shows a back arrow on every page except the home page.
      routes: {
        '/about': (_) => const AboutPage(),
        '/projects': (_) => const ProjectsPage(),
      },
      home: _initialPage(),
    );
  }
}

Widget _initialPage() => switch (_page) {
      'about' => const AboutPage(),
      'projects' => const ProjectsPage(),
      _ => const HomePage(),
    };
