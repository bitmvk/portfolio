import 'package:flutter/material.dart';

import '../widgets/page_frame.dart';

/// About page: skills, frameworks and interests.
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const _languages = ['Python', 'JavaScript', 'C'];
  static const _frameworks = ['FastAPI', 'Flask', 'React', 'Flutter'];
  static const _interests = ['Web Apps', 'AI / ML', 'Tooling', 'UI Design'];

  Widget _heading(BuildContext context, String text) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      );

  Widget _chips(List<String> items) => Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [for (final s in items) Chip(label: Text(s))],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Me')),
      body: PageFrame(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Who I am',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            GlassCard(
              child: const Text(
                "I'm a computer science student who enjoys writing code that "
                'solves real problems. I like both web development and '
                'lower-level programming, and I am always trying out new '
                'things.',
                style: TextStyle(fontSize: 16, height: 1.5, color: Colors.white70),
              ),
            ),
            const SizedBox(height: 24),
            _heading(context, 'Languages'),
            _chips(_languages),
            const SizedBox(height: 24),
            _heading(context, 'Frameworks & Tools'),
            _chips(_frameworks),
            const SizedBox(height: 24),
            _heading(context, 'Areas of Interest'),
            _chips(_interests),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.popUntil(
                      context,
                      (route) => route.isFirst,
                    ),
                    icon: const Icon(Icons.home),
                    label: const Text('Home'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pushNamed(context, '/projects'),
                    icon: const Icon(Icons.code),
                    label: const Text('Projects'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
