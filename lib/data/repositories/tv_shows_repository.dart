import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:tvmaze_app/app/common/result.dart';
import 'package:tvmaze_app/data/api/tvmaze_api.dart';
import 'package:tvmaze_app/domain/entities/episode.dart';
import 'package:tvmaze_app/domain/entities/search_result.dart';
import 'package:tvmaze_app/domain/entities/tv_show.dart';

abstract class TvShowsRepository {
  Future<Result<List<Episode>>> getEpisodes(int showId);
  Future<Result<TvShow>> getShow(int id);
  Future<Result<List<TvShow>>> getShowList(int page);
  Future<Result<List<SearchResult>>> searchShows(String query);
}

@LazySingleton(as: TvShowsRepository)
class TvShowsRepositoryImpl implements TvShowsRepository {
  final TvMazeApi api;
  final Logger logger;

  TvShowsRepositoryImpl(this.api, this.logger);

  @override
  Future<Result<List<Episode>>> getEpisodes(int showId) async {
    try {
      final episodes = await api.getEpisodes(showId: showId);
      return Result.success(value: episodes);
    } catch (error) {
      logger.e(error);
      return const Result.error("Error occurred fetching episodes from API.");
    }
  }

  @override
  Future<Result<TvShow>> getShow(int id) async {
    try {
      final tvShow = await api.getShow(id: id);
      return Result.success(value: tvShow);
    } catch (error) {
      logger.e(error);
      return const Result.error("Error occurred fetching TvShow from API.");
    }
  }

  @override
  Future<Result<List<TvShow>>> getShowList(int page) async {
    try {
      final tvShows = await api.getShowList(page: page);
      return Result.success(value: tvShows);
    } catch (error) {
      logger.e(error);
      return const Result.error("Error occurred fetching TvShows from API.");
    }
  }

  @override
  Future<Result<List<SearchResult>>> searchShows(String query) async {
    try {
      final searchResult = await api.searchShows(query: query);
      return Result.success(value: searchResult);
    } catch (error) {
      logger.e(error);
      return const Result.error("Error occurred searching TvShows on API.");
    }
  }
}
