import 'package:dio/dio.dart';
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
      queryParams: {'api_key': 'e9ab92d15e033e7e8a7d5f2530890beb'},
    );

    final creditsResponse = await dioClient.get(
      'https://api.themoviedb.org/3/movie/$movieId/credits',
      queryParams: {'api_key': 'e9ab92d15e033e7e8a7d5f2530890beb'},
    );

    return MovieDetailModel.fromJson(
      detailResponse.data,
      creditsResponse.data['cast'],
    );
  }

  Future<TvDetailModel> getTvDetail(int tvId) async {
    final detailResponse = await dioClient.get(
      'https://api.themoviedb.org/3/tv/$tvId',
      queryParams: {'api_key': 'e9ab92d15e033e7e8a7d5f2530890beb'},
    );

    final creditsResponse = await dioClient.get(
      'https://api.themoviedb.org/3/tv/$tvId/credits',
      queryParams: {'api_key': 'e9ab92d15e033e7e8a7d5f2530890beb'},
    );

    return TvDetailModel.fromJson(
      detailResponse.data,
      creditsResponse.data['cast'],
    );
  }
}
