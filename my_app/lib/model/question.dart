
class Question {
  final int id;
  final String text;
  final List<String> choices; 
  final int correctIndex; // stores the id of the correct choice

  Question({required this.id, required this.text, required this.choices, required this.correctIndex});

  String get correctChoice => choices[correctIndex];

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as int,
      text: json['text'] as String,
      choices: List<String>.from(json['choices'] as List),
      correctIndex: json['correctIndex'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'choices': choices,
      'correctIndex': correctIndex,
    };
  }

  @override
  String toString() => 'Question(id: $id, text: $text)';

  bool isCorrect(String selectedAnswer) {
    return selectedAnswer == correctIndex.toString();
  }
}