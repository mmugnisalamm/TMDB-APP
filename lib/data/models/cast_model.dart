import 'package:tmdb_app/domain/entities/cast_entity.dart';

class CastModel extends CastEntity {
  CastModel({
    required int id,
    required String name,
    required String character,
    required String job,
    required String profilePath,
  }) : super(
         id: id,
         name: name,
         character: character,
         job: job,
         profilePath: profilePath,
       );

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      character: json['character'] ?? '',
      job: json['job'] ?? '',
      profilePath: json['profile_path'] ?? '',
    );
  }
}
