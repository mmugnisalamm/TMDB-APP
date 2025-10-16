import 'package:tmdb_app/domain/entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  ReviewModel({
    required super.author,
    required super.username,
    super.avatarPath,
    super.rating,
    required super.content,
    required super.createdAt,
    required super.url,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    final authorDetails = json['author_details'] ?? {};
    return ReviewModel(
      author: json['author'] ?? '',
      username: authorDetails['username'] ?? '',
      avatarPath: authorDetails['avatar_path'],
      rating: (authorDetails['rating'] is int)
          ? (authorDetails['rating'] as int).toDouble()
          : authorDetails['rating'],
      content: json['content'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      url: json['url'] ?? '',
    );
  }

  static List<ReviewModel> fromJsonList(List list) {
    return list.map((e) => ReviewModel.fromJson(e)).toList();
  }
}
