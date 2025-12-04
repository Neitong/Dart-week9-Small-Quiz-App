import 'question.dart';

class Quiz {
  final int _id;
  final String _title;
  final List<Question> _questions;

  Quiz(this._id, this._title, this._questions);
}