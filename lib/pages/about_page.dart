import 'package:flutter/material.dart';

/// About page: skills and areas of expertise.
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const _languages = ['Python', 'JavaScript', 'C'];
  static const _frameworks = ['FastAPI', 'Flask', 'React', 'Flutter'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('About Me', style: theme.textTheme.headlineMedium),
                const SizedBox(height: 12),
                Text(
                  "I'm a computer science student who enjoys writing code "
                  'that solves real problems. I like both web development and '
                  'lower-level programming, and I am always trying out new '
                  'things.',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                Text('Languages', style: theme.textTheme.titleLarge),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    for (final s in _languages) Chip(label: Text(s)),
                  ],
                ),
                const SizedBox(height: 24),
                Text('Frameworks & Tools', style: theme.textTheme.titleLarge),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    for (final s in _frameworks) Chip(label: Text(s)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
