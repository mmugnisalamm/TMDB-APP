class ReviewEntity {
  final String author;
  final String username;
  final String? avatarPath;
  final double? rating;
  final String content;
  final DateTime createdAt;
  final String url;

  ReviewEntity({
    required this.author,
    required this.username,
    this.avatarPath,
    this.rating,
    required this.content,
    required this.createdAt,
    required this.url,
  });
}
