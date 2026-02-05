// Comment model
class Comment {
  final String id;
  final String username;
  final String text;
  final String timestamp;
  final int likes;
  final String avatarUrl;
  final int replyCount;
  final List<Comment>? replies;

  Comment({
    required this.id,
    required this.username,
    required this.text,
    required this.timestamp,
    required this.likes,
    required this.avatarUrl,
    this.replyCount = 0,
    this.replies,
  });
}
