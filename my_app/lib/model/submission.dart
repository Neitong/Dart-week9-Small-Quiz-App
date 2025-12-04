import "answer.dart";
import "quiz.dart";

class Submission {
  final String? playerName;
  final DateTime createAt;
  DateTime? submittedAt;
  final List<Answer> answers = [];

  Submission({this.playerName, DateTime? createAt})
      : createAt = createAt ?? DateTime.now();

  int get currentQuestionIndex => answers.length;
  int get answerCount => answers.length;

  void finish(){
    submittedAt = DateTime.now();
  }

  void answerQuestion(int questionId, int selectedIndex){
    // answers.removeWhere((a) => a.questionId == questionId);
    answers.add(Answer(questionId: questionId, selectedChoice: selectedIndex.toString()));
  }

  Answer? getAnswerForQuestion(int questionId){
    return answers.firstWhere(
      (a) => a.questionId == questionId,
      orElse: () => Answer(questionId: questionId, selectedChoice: "-1"),
    );
  }

  int calculateScore(Quiz quiz){
    int score = 0;
    for (var answer in answers) {
      final question = quiz.questions.firstWhere((q) => q.id == answer.questionId);
      if (question.isCorrect(answer.selectedChoice)) {
        score++;
      }
    }
    return score;
  }

  Map<String, dynamic> toJson() {
    return {
      'playerName': playerName,
      'createAt': createAt.toIso8601String(),
      'submittedAt': submittedAt?.toIso8601String(),
      'answers': answers.map((a) => a.toJson()).toList(),
    };
  }

  factory Submission.fromJson(Map<String, dynamic> json) {
    final submission = Submission(
      playerName: json['playerName'] as String?,
      createAt: DateTime.parse(json['createAt'] as String),
    );
    submission.submittedAt = json['submittedAt'] != null
        ? DateTime.parse(json['submittedAt'] as String)
        : null;
    submission.answers.addAll(
      (json['answers'] as List)
          .map((a) => Answer.fromJson(a as Map<String, dynamic>)),
    );
    return submission;
  }
}