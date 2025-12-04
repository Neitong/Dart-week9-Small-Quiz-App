class Answer {
  final int questionId;
  final String selectedChoice; // -1 if no choice selected

  Answer({required this.questionId, required this.selectedChoice});

  int? get selectedIndex {
    if (selectedChoice == "-1") return null;
    return int.tryParse(selectedChoice);
  }

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      questionId: json['questionId'] as int,
      selectedChoice: json['selectedChoice'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questionId': questionId,
      'selectedChoice': selectedChoice,
    };
  }
}