import 'package:flutter/material.dart';

class ComingSoonScreen extends StatelessWidget {
  final String sectionName;

  const ComingSoonScreen({super.key, required this.sectionName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.construction, size: 65, color: Colors.orange),
      const SizedBox(height: 16),
      Text(
        '$sectionName Coming Soon!',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      const Text('We are working on it. ', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}