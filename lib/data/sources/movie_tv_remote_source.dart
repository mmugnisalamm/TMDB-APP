import 'package:dio/dio.dart';
import 'package:tmdb_app/data/models/review_model.dart';
import '../models/list_movie_tv_model.dart';
import '../models/tv_detail_model.dart';
import '../services/dio_client.dart';

import '../models/movie_detail_model.dart';

class MovieTvRemoteSource {
  final DioClient dioClient;

  MovieTvRemoteSource(this.dioClient);

  Future<List<ListMovieTvModel>> getMovieTVTrendingAll() async {
    try {
      final response = await dioClient.get(
        '/trending/all/day',
        queryParams: {
          'api_key': 'e9ab92d15e033e7e8a7d5f2530890beb',
          'language': 'id-ID',
        },
      );

      if (response.statusCode == 200) {
        final List results = response.data['results'];
        return ListMovieTvModel.fromJsonList(results);
      } else {
        throw Exception('Failed to fetch trending');
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    final detailResponse = await dioClient.get(
      'https://api.themoviedb.org/3/movie/$movieId',
      queryParams: {
        'api_key': 'e9ab92d15e033e7e8a7d5f2530890beb',
        'language': 'id-ID',
      },
    );

    final creditsResponse = await dioClient.get(
      'https://api.themoviedb.org/3/movie/$movieId/credits',
      queryParams: {
        'api_key': 'e9ab92d15e033e7e8a7d5f2530890beb',
        'language': 'id-ID',
      },
    );

    return MovieDetailModel.fromJson(
      detailResponse.data,
      creditsResponse.data['cast'],
    );
  }

  Future<TvDetailModel> getTvDetail(int tvId) async {
    final detailResponse = await dioClient.get(
      'https://api.themoviedb.org/3/tv/$tvId',
      queryParams: {
        'api_key': 'e9ab92d15e033e7e8a7d5f2530890beb',
        'language': 'id-ID',
      },
    );

    final creditsResponse = await dioClient.get(
      'https://api.themoviedb.org/3/tv/$tvId/credits',
      queryParams: {
        'api_key': 'e9ab92d15e033e7e8a7d5f2530890beb',
        'language': 'id-ID',
      },
    );

    return TvDetailModel.fromJson(
      detailResponse.data,
      creditsResponse.data['cast'],
    );
  }

  Future<String?> getMovieCertification(int movieId) async {
    try {
      final response = await dioClient.get(
        'https://api.themoviedb.org/3/movie/$movieId/release_dates',
        queryParams: {
          'api_key': "e9ab92d15e033e7e8a7d5f2530890beb",
          'language': 'id-ID',
        },
      );

      final results = response.data['results'] as List;
      final indonesiaData = results.firstWhere(
        (item) => item['iso_3166_1'] == 'ID',
        orElse: () => null,
      );

      if (indonesiaData != null) {
        final releaseDates = indonesiaData['release_dates'] as List;
        if (releaseDates.isNotEmpty) {
          // ambil certification contoh: "13+", "R", "PG-13", dll
          final certification = releaseDates[0]['certification'];
          return certification;
        }
      }

      // fallback ke US kalau tidak ada rating Indonesia
      final usData = results.firstWhere(
        (item) => item['iso_3166_1'] == 'US',
        orElse: () => null,
      );
      if (usData != null) {
        final releaseDates = usData['release_dates'] as List;
        if (releaseDates.isNotEmpty) {
          return releaseDates[0]['certification'];
        }
      }

      return null;
    } catch (e) {
      print('Error getMovieCertification: $e');
      return null;
    }
  }

  Future<List<ReviewModel>> getMovieReviews(int movieId) async {
    try {
      final response = await dioClient.get(
        'https://api.themoviedb.org/3/movie/$movieId/reviews',
        queryParams: {
          'api_key': 'e9ab92d15e033e7e8a7d5f2530890beb',
          'language': 'id-ID',
          'page': 1,
        },
      );

      if (response.statusCode == 200) {
        final List results = response.data['results'];
        print("HASIL RESULT REVIEW $results");
        return ReviewModel.fromJsonList(results);
      } else {
        throw Exception('Failed to fetch reviews');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}
