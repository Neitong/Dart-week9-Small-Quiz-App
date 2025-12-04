import 'question.dart';
import 'question.dart';
import 'questionHistory.dart';


class Submission {
  final int Id;
  final int userId;
  final List<QuestionHistory> questionHistory;
  final double score;
  final int quizId;

  Submission({
    required this.Id,
    required this.userId,
    required this.questionHistory,
    required this.score,
    required this.quizId,

  });


}