import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

 class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;

  const WelcomeScreen({Key? key, required this.onStart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.quiz, size: 100, color: Colors.deepPurple),
            const SizedBox(height: 40),
            const Text(
              'Quiz Challenge',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Test your knowledge with 10 fun questions!',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            AppButton(
              label: 'Start Quiz',
              onPressed: onStart,
              onTap: () {},
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}