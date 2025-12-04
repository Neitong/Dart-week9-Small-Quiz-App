// lib/ui/screens/result_screen.dart
import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../../model/submission.dart';
import '../widgets/score_circle.dart';
import '../widgets/app_button.dart';
import '../widgets/title_screen.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final Submission submission;
  final VoidCallback onRestart;

  const ResultScreen({
    Key? key,
    required this.quiz,
    required this.submission,
    required this.onRestart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    submission.finish();
    final score = submission.calculateScore(quiz);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text('Quiz Complete!', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            ScoreCircle(score: score, total: quiz.questions.length),
            const SizedBox(height: 40),
            const Text('Review your answers:', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (ctx, i) {
                  final q = quiz.questions[i];
                  final playerAnswer = submission.getAnswerForQuestion(q.id);
                  final selected = playerAnswer?.selectedIndex ?? -1;
                  final isCorrect = selected == q.correctIndex;

                  return Card(
                    child: ListTile(
                      title: Text(q.text, style: const TextStyle(fontWeight: FontWeight.w500)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ChoiceTile(
                            text: q.choices[selected],
                            isSelected: true,
                            showResult: true,
                            isCorrect: isCorrect,
                            onTap: () {},
                          ),
                          if (!isCorrect)
                            Text('Correct: ${q.correctChoice}', style: const TextStyle(color: Colors.green)),
                        ],
                      ),
                      trailing: Icon(isCorrect ? Icons.check_circle : Icons.cancel,
                          color: isCorrect ? Colors.green : Colors.red),
                    ),
                  );
                },
              ),
            ),
            AppButton(label: 'Play Again', onPressed: onRestart),
          ],
        ),
      ),
    );
  }
}