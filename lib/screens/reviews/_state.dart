part of 'reviews.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [bool listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);
}

// Sample reviews data
final List<Map<String, dynamic>> reviews = [
  {
    'name': 'Sarah Johnson',
    'avatar': 'assets/pngs/course.png',
    'rating': 5.0,
    'date': '2 days ago',
    'comment':
        'This lesson completely changed how I approach daily gratitude. The exercises are practical and easy to follow. Highly recommend!',
    'helpful': 24,
  },
  {
    'name': 'Michael Chen',
    'avatar': 'assets/pngs/course.png',
    'rating': 4.0,
    'date': '1 week ago',
    'comment':
        'Great content and well-structured. I found the gratitude journaling techniques particularly helpful for my mental health journey.',
    'helpful': 18,
  },
  {
    'name': 'Emma Wilson',
    'avatar': 'assets/pngs/course.png',
    'rating': 5.0,
    'date': '2 weeks ago',
    'comment':
        'Amazing lesson! The instructor explains everything clearly. I\'ve been practicing gratitude daily since completing this.',
    'helpful': 32,
  },
  {
    'name': 'David Martinez',
    'avatar': 'assets/pngs/course.png',
    'rating': 4.0,
    'date': '3 weeks ago',
    'comment':
        'Very informative and insightful. Would have loved more examples, but overall a solid lesson on gratitude practice.',
    'helpful': 15,
  },
  {
    'name': 'Lisa Anderson',
    'avatar': 'assets/pngs/course.png',
    'rating': 5.0,
    'date': '1 month ago',
    'comment':
        'This lesson helped me develop a consistent gratitude practice. The tips are practical and the science behind it is fascinating.',
    'helpful': 28,
  },
];
