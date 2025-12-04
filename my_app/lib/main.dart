// main.dart
import 'package:flutter/material.dart';
import './model/quiz.dart';
import './model/submission.dart';
import './ui/screens/welcome_screen.dart';
import './ui/screens/question_screen.dart';
import './ui/screens/result_screen.dart';
// Import your quiz data (mock or JSON)
import 'data/quiz_mock_data.dart';  // You'll create this

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  late final Quiz quiz;
  late Submission submission;
  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    quiz = QuizMockData.getQuiz(1);  // Replace with JSON later
    startNewSession();
  }

  void startNewSession() {
    submission = Submission();
    _screens.clear();
    _screens.add(WelcomeScreen(onStart: _goToFirstQuestion));
    setState(() {});
  }

  void _goToFirstQuestion() {
    setState(() {
      _screens.add(_buildQuestionScreen(0));
    });
  }

  Widget _buildQuestionScreen(int index) {
    return QuestionScreen(
      question: quiz.questions[index],
      questionIndex: index,
      totalQuestions: quiz.questions.length,
      submission: submission,
      onNext: () {
        if (index + 1 < quiz.questions.length) {
          setState(() => _screens.add(_buildQuestionScreen(index + 1)));
        } else {
          setState(() => _screens.add(ResultScreen(
            quiz: quiz,
            submission: submission,
            onRestart: startNewSession,
          )));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(children: _screens),
      ),
    );
  }
}