import 'package:flutter/material.dart';

/// A single project shown as a card.
class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.title,
    required this.description,
    required this.tech,
  });

  final String title;
  final String description;
  final List<String> tech;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.indigo, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(description, style: theme.textTheme.bodyMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                for (final t in tech)
                  Chip(
                    label: Text(t),
                    visualDensity: VisualDensity.compact,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Projects page: list of the user's projects.
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  static const _projects = [
    _ProjectCard(
      title: 'Personal Finance Management App',
      description:
          'An app to track income and expenses, with categories and a simple '
          'summary dashboard.',
      tech: ['FastAPI', 'React'],
    ),
    _ProjectCard(
      title: 'Emotion Detection Neural Network',
      description:
          'A CNN that classifies facial expressions into emotions like happy, '
          'sad and angry, trained on an image dataset.',
      tech: ['Python', 'TensorFlow'],
    ),
    _ProjectCard(
      title: 'Python Framework for Android Apps',
      description:
          'A Python framework for writing Android apps with a React-like '
          'component model.',
      tech: ['Python', 'Android'],
    ),
    _ProjectCard(
      title: 'WYSIWYG Editor in PySide6',
      description:
          'A what-you-see-is-what-you-get desktop text editor built with '
          'PySide6, with basic formatting controls.',
      tech: ['Python', 'PySide6'],
    ),
  ];

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
                Text('My Projects', style: theme.textTheme.headlineMedium),
                const SizedBox(height: 16),
                for (final p in _projects) ...[
                  p,
                  const SizedBox(height: 16),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
