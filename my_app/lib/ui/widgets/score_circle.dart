// lib/ui/widgets/score_circle.dart
import 'package:flutter/material.dart';

class ScoreCircle extends StatelessWidget {
  final int score;
  final int total;

  const ScoreCircle({Key? key, required this.score, required this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double percentage = total > 0 ? score / total : 0;

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 140,
              height: 140,
              child: CircularProgressIndicator(
                value: percentage,
                strokeWidth: 12,
                backgroundColor: Colors.grey.shade300,
                color: percentage >= 0.7 ? Colors.green : (percentage >= 0.4 ? Colors.orange : Colors.red),
              ),
            ),
            Column(
              children: [
                Text(
                  '$score',
                  style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
                Text('/$total', style: const TextStyle(fontSize: 20)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          percentage >= 0.7 ? 'Great Job!' : (percentage >= 0.4 ? 'Not Bad!' : 'Keep Practicing!'),
          style: TextStyle(fontSize: 20, color: Colors.grey[700]),
        ),
      ],
    );
  }
}