class Review {
  final int id;
  final String name;
  final String comment;
  final int rating;
  final bool isOwn;
  final String? avatarPath;

  Review({
    required this.id,
    required this.name,
    required this.comment,
    required this.rating,
    required this.isOwn,
    this.avatarPath,
  });

  Review copyWith({
    int? id,
    String? name,
    String? comment,
    int? rating,
    bool? isOwn,
    String? avatarPath,
  }) {
    return Review(
      id: id ?? this.id,
      name: name ?? this.name,
      comment: comment ?? this.comment,
      rating: rating ?? this.rating,
      isOwn: isOwn ?? this.isOwn,
      avatarPath: avatarPath ?? this.avatarPath,
    );
  }
}
