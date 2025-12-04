import 'package:flutter/material.dart';
import '../model/quiz.dart';
import 'screens/welcome_screen.dart';
// import 'screens/question_screen.dart';
// import 'screens/result_screen.dart';

enum Screen { welcome, question, result }
 
class QuizApp extends StatefulWidget {
  const QuizApp( {super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Screen screen = Screen.welcome;
  late Quiz quiz;
  Map<int, String> submission = {};

  int currentIndex = 0;

  void startQuiz() {
    submission = {};
    currentIndex = 0;
    setState(() => screen = Screen.question);
  }

  void answerSelected(String answer) {
    submission[currentIndex] = answer;
  }

  void nextQuestion(){
    if(currentIndex < quiz.questions.length - 1){
      setState(() => currentIndex++);
    } else {
      setState(() => screen = Screen.result);
    }
  }

  void restartQuiz(){
    setState(() => screen = Screen.welcome);
  }

  

  @override
  Widget build(BuildContext context) {
    return WelcomeScreen(onStart: startQuiz);
  }
}