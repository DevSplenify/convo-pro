part of 'quiz_completed.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [bool listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  // Sample quiz results
  final int totalQuestions = 5;
  final int correctAnswers = 4;
  final double timeSpent = 3.5; // in minutes

  double get scorePercentage => (correctAnswers / totalQuestions) * 100;

  String get performanceMessage {
    if (scorePercentage >= 80) {
      return 'Excellent work! You have a great understanding of gratitude practice.';
    } else if (scorePercentage >= 60) {
      return 'Good job! You\'re on the right track with your learning.';
    } else if (scorePercentage >= 40) {
      return 'Nice effort! Consider reviewing the lesson material again.';
    } else {
      return 'Keep practicing! Review the lesson to improve your understanding.';
    }
  }
}
