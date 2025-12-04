import 'package:flutter/material.dart';
import '../../model/question.dart';
import '../../model/submission.dart';
import '../widgets/question_card.dart';
import '../widgets/app_button.dart';
import '../widgets/title_screen.dart';
 
class QuestionScreen extends StatefulWidget {
  final Question question;
  final int questionIndex;
  final int totalQuestions;
  final Submission submission;
  final VoidCallback onNext;

  const QuestionScreen({
    Key? key,
    required this.question,
    required this.questionIndex,
    required this.totalQuestions,
    required this.submission,
    required this.onNext,
  }) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    final previous = widget.submission.getAnswerForQuestion(widget.question.id);
    selectedIndex = previous?.selectedIndex;
  }

  void _selectChoice(int index) {
    setState(() => selectedIndex = index);
    widget.submission.answerQuestion(widget.question.id, index);
  }

  bool get canProceed => selectedIndex != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            QuestionCard(
              question: widget.question.text,
              currentIndex: widget.questionIndex,
              total: widget.totalQuestions,
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: widget.question.choices.length,
                itemBuilder: (ctx, i) {
                  final isCorrect = i == widget.question.correctIndex;
                  final isSelected = selectedIndex == i;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: ChoiceTile(
                      text: widget.question.choices[i],
                      isSelected: isSelected,
                      showResult: false,
                      isCorrect: isCorrect,
                      onTap: () => _selectChoice(i),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            AppButton(
              label: widget.questionIndex == widget.totalQuestions - 1 ? 'Finish Quiz' : 'Next Question',
              onPressed: canProceed ? widget.onNext : null,
              backgroundColor: canProceed ? Colors.deepPurple : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
 