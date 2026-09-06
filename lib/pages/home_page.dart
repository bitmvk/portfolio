import 'package:flutter/material.dart';

import '../widgets/page_frame.dart';

/// Home page: avatar + short introduction + navigation buttons.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final muted = TextStyle(fontSize: 16, height: 1.5, color: Colors.white70);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('My Portfolio')),
      body: PageFrame(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Avatar placeholder (replace 'V' with a photo via Image.asset).
            const Center(
              child: CircleAvatar(
                radius: 70,
                backgroundColor: accentColor,
                child: Text(
                  'V',
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Hi, I'm Vivek",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Python · JavaScript · C · Flutter',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 20),
            GlassCard(
              child: Text(
                "I'm a student developer who likes building useful things — "
                'from web apps with FastAPI and React to machine learning '
                'experiments. Welcome to my little corner of the internet.',
                textAlign: TextAlign.center,
                style: muted,
              ),
            ),
            const SizedBox(height: 28),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/about'),
              icon: const Icon(Icons.person_outline),
              label: const Text('About Me'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/projects'),
              icon: const Icon(Icons.code),
              label: const Text('My Projects'),
            ),
          ],
        ),
      ),
    );
  }
}
