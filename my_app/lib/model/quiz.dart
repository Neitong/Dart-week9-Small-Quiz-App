import 'question.dart';

class Quiz {
  final String title;
  final String? description;
  final List<Question> questions;

  Quiz({required this.title, this.description, required this.questions});

  int get totalQuestions => questions.length;

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      title: json['title'] as String,
      description: json['description'] as String?,
      questions: (json['questions'] as List)
          .map((q) => Question.fromJson(q as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }
}