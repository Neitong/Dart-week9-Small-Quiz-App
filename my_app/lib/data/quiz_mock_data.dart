import '../model/quiz.dart';
import '../model/question.dart';

class QuizMockData {
  static final Quiz sampleQuiz = Quiz(
    title: 'Flutter Basics Quiz',
    description: 'Test your knowledge about Flutter development',
    questions: [
      Question(
        id: 1,
        text: 'What is Flutter?',
        choices: [
          'A web framework',
          'A mobile app development framework',
          'A database',
          'A design tool',
        ],
        correctIndex: 1,
      ),
      Question(
        id: 2,
        text: 'Which programming language does Flutter use?',
        choices: [
          'Python',
          'Dart',
          'Swift',
          'Kotlin',
        ],
        correctIndex: 1,
      ),
      Question(
        id: 3,
        text: 'What is a Widget in Flutter?',
        choices: [
          'A database query',
          'The basic building block of a Flutter UI',
          'A backend service',
          'A version control system',
        ],
        correctIndex: 1,
      ),
      Question(
        id: 4,
        text: 'Which widget is used to create a scrollable list?',
        choices: [
          'Column',
          'Row',
          'ListView',
          'Container',
        ],
        correctIndex: 2,
      ),
      Question(
        id: 5,
        text: 'What does StatefulWidget do?',
        choices: [
          'It represents immutable widgets',
          'It represents widgets that can change state',
          'It manages app navigation',
          'It handles network requests',
        ],
        correctIndex: 1,
      ),
      Question(
        id: 6,
        text: 'How do you navigate between screens in Flutter?',
        choices: [
          'Using HTTP requests',
          'Using Navigator.push()',
          'Using setState()',
          'Using BuildContext',
        ],
        correctIndex: 1,
      ),
      Question(
        id: 7,
        text: 'What is the purpose of the build() method?',
        choices: [
          'To initialize the app',
          'To define the UI of a widget',
          'To handle user input',
          'To save data to database',
        ],
        correctIndex: 1,
      ),
      Question(
        id: 8,
        text: 'Which package manager is used for Flutter?',
        choices: [
          'npm',
          'pip',
          'pub',
          'gradle',
        ],
        correctIndex: 2,
      ),
      Question(
        id: 9,
        text: 'What is hot reload in Flutter?',
        choices: [
          'Restarting the entire app',
          'Quickly refreshing the code without losing state',
          'Deleting and recreating widgets',
          'Clearing the device cache',
        ],
        correctIndex: 1,
      ),
      Question(
        id: 10,
        text: 'Which widget centers its child?',
        choices: [
          'Padding',
          'Center',
          'Align',
          'Container',
        ],
        correctIndex: 1,
      ),
    ],
  );

  static List<Quiz> getAllQuizzes() {
    return [sampleQuiz];
  }

  static Quiz getQuiz(int index) {
    final quizzes = getAllQuizzes();
    if (index >= 0 && index < quizzes.length) {
      return quizzes[index];
    }
    return sampleQuiz;
  }
}
