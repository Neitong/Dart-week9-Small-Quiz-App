import 'package:my_app/model/quiz.dart';

import 'submission.dart';

class QuizHistory {
  final List<Submission> submissions;
  final List<Quiz> quiz = [];

  QuizHistory({List<Submission>? submissions})
      : submissions = submissions ?? [];

  void addSubmission(Submission submission) {
    submission.finish();
    submissions.add(submission);
  }

  List<Submission> getAllSubmissions() {
    return List.unmodifiable(submissions);
  }

  List<Submission> getSubmissionsByPlayer(String playerName) {
    return submissions
        .where((submission) => submission.playerName == playerName)
        .toList();
  }

  int get bestScore {
    if (submissions.isEmpty) return 0;
    return submissions.map((s) => s.calculateScore(quiz.first)).reduce((a, b) => a > b ? a : b); 
  }

  Map<String, dynamic> toJson() {
    return {
      'submissions': submissions.map((s) => s.toJson()).toList(),
    };
  }

  factory QuizHistory.fromJson(Map<String, dynamic> json) {
    return QuizHistory(
      submissions: (json['submissions'] as List)
          .map((s) => Submission.fromJson(s as Map<String, dynamic>))
          .toList(),
    );
  }
}