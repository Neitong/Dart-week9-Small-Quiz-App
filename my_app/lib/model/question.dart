import 'choice.dart';

class Question {
  final int _id;
  final String _title;
  final int _quizId;
  final List<Choice> _choice;
  
  Question(this._id, this._title, this._quizId, this._choice);
}