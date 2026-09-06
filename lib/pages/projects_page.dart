import 'package:flutter/material.dart';

import '../widgets/page_frame.dart';

/// One project entry: emoji icon, title, description, tech chips.
class _Project {
  const _Project(this.emoji, this.color, this.title, this.description, this.tech);

  final String emoji;
  final Color color;
  final String title;
  final String description;
  final List<String> tech;
}

/// Projects page: cards for each project.
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  static const _projects = [
    _Project(
      '💰',
      Color(0xFF34D399),
      'Personal Finance Management App',
      'Tracks income and expenses with categories and a simple monthly summary.',
      ['FastAPI', 'React'],
    ),
    _Project(
      '😊',
      Color(0xFFF472B6),
      'Emotion Detection Neural Network',
      'A CNN that classifies facial expressions like happy, sad and angry.',
      ['Python', 'TensorFlow'],
    ),
    _Project(
      '🤖',
      Color(0xFF60A5FA),
      'Python Framework for Android Apps',
      'A framework for writing Android apps in Python with a React-like API.',
      ['Python', 'Android'],
    ),
    _Project(
      '📝',
      Color(0xFFFB923C),
      'WYSIWYG Editor in PySide6',
      'A desktop what-you-see-is-what-you-get editor with formatting controls.',
      ['Python', 'PySide6'],
    ),
  ];

  Widget _projectCard(_Project p) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: p.color.withAlpha(45),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: p.color.withAlpha(110)),
                ),
                child: Center(
                  child: Text(p.emoji, style: const TextStyle(fontSize: 26)),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  p.title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            p.description,
            style: const TextStyle(
              fontSize: 15,
              height: 1.4,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final t in p.tech)
                Chip(
                  label: Text(t),
                  visualDensity: VisualDensity.compact,
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Projects')),
      body: PageFrame(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Things I have built',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            for (final p in _projects) ...[
              _projectCard(p),
              const SizedBox(height: 16),
            ],
            const SizedBox(height: 16),
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
                    onPressed: () => Navigator.pushNamed(context, '/about'),
                    icon: const Icon(Icons.person_outline),
                    label: const Text('About Me'),
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
