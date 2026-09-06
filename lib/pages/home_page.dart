import 'package:flutter/material.dart';

/// Home page: avatar + short introduction.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Placeholder avatar. Replace with: Image.asset('assets/me.jpg')
                const CircleAvatar(
                  radius: 60,
                  child: Text('V', style: TextStyle(fontSize: 40)),
                ),
                const SizedBox(height: 16),
                Text(
                  "Hi, I'm Vivek",
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Python | JavaScript | C | Flutter',
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  "I'm a student developer who likes building useful things — "
                  'from web apps with FastAPI and React to machine learning '
                  'experiments. This is my little corner of the internet.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
