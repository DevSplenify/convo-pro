part of 'quiz.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [bool listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  int _currentQuestionIndex = 0;
  final Map<int, int> _selectedAnswers = {};

  int get currentQuestionIndex => _currentQuestionIndex;
  Map<int, int> get selectedAnswers => _selectedAnswers;

  // Sample quiz data
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the main purpose of practicing gratitude?',
      'options': [
        'To improve mental wellbeing',
        'To make others happy',
        'To get more things in life',
        'To avoid negative thoughts',
      ],
    },
    {
      'question': 'How often should you practice gratitude journaling?',
      'options': [
        'Once a month',
        'Only when happy',
        'Daily or regularly',
        'Never',
      ],
    },
    {
      'question': 'Which of the following is a benefit of gratitude?',
      'options': [
        'Better sleep quality',
        'More money',
        'Instant happiness',
        'Perfect relationships',
      ],
    },
    {
      'question': 'What should you focus on when practicing gratitude?',
      'options': [
        'Big achievements only',
        'Material possessions',
        'Both big and small things',
        'Other people\'s lives',
      ],
    },
    {
      'question': 'Gratitude practice is most effective when done:',
      'options': [
        'Randomly',
        'Consistently over time',
        'Only during holidays',
        'When feeling down',
      ],
    },
  ];

  int get totalQuestions => questions.length;
  double get progress => (currentQuestionIndex + 1) / totalQuestions;

  void selectAnswer(int answerIndex) {
    _selectedAnswers[_currentQuestionIndex] = answerIndex;
    notifyListeners();
  }

  int? getSelectedAnswer() {
    return _selectedAnswers[_currentQuestionIndex];
  }

  void nextQuestion() {
    if (_currentQuestionIndex < questions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      notifyListeners();
    }
  }

  bool get canGoNext => _currentQuestionIndex < questions.length - 1;
  bool get canGoPrevious => _currentQuestionIndex > 0;
  bool get isLastQuestion => _currentQuestionIndex == questions.length - 1;
  bool get hasAnsweredCurrent =>
      _selectedAnswers.containsKey(_currentQuestionIndex);
}
