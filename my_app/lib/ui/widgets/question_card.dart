// lib/ui/widgets/question_card.dart
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final int currentIndex;
  final int total;

  const QuestionCard({
    Key? key,
    required this.question,
    required this.currentIndex,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              'Question ${currentIndex + 1} / $total',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            Text(
              question,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}