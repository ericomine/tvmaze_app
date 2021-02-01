import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:tvmaze_app/app/common/result.dart';
import 'package:tvmaze_app/data/api/tvmaze_api.dart';
import 'package:tvmaze_app/data/repositories/favorites_data_source.dart';
import 'package:tvmaze_app/domain/entities/tv_show.dart';

abstract class FavoritesRepository {
  Result<void> addFavorite(TvShow tvShow);
  Result<bool> checkIfIsFavorite(TvShow tvShow);
  Result<List<int>> getFavoritesIds();
  Future<Result<List<TvShow>>> getFavoritesSortedByName();
  Result<void> removeFavorite(TvShow tvShow);
}

@LazySingleton(as: FavoritesRepository)
class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesDataSource dataSource;
  final TvMazeApi api;
  final Logger logger;

  FavoritesRepositoryImpl(this.dataSource, this.api, this.logger);

  @override
  Result<void> addFavorite(TvShow tvShow) {
    try {
      dataSource.addFavorite(tvShow.id);
      return const Result.success();
    } catch (error) {
      logger.e(error);
      return const Result.error("Error occurred adding favorite.");
    }
  }

  @override
  Result<bool> checkIfIsFavorite(TvShow tvShow) {
    try {
      final result = dataSource.isFavorite(tvShow.id);
      return Result.success(value: result);
    } catch (error) {
      logger.e(error);
      return const Result.error("Error occurred checking if show is favorite.");
    }
  }

  @override
  Result<List<int>> getFavoritesIds() {
    try {
      final saved = dataSource.getFavorites();
      return Result.success(value: saved);
    } catch (error) {
      logger.e(error);
      return const Result.error("Error occurred getting favorites.");
    }
  }

  @override
  Future<Result<List<TvShow>>> getFavoritesSortedByName() async {
    try {
      final saved = dataSource.getFavorites();

      final result = <TvShow>[];
      for (final id in saved) {
        final tvShow = await api.getShow(id: id);
        result.add(tvShow);
      }

      result.sort((a, b) => a.name.compareTo(b.name));
      return Result.success(value: result);
    } catch (error) {
      logger.e(error);
      return const Result.error("Error occurred getting favorites.");
    }
  }

  @override
  Result<void> removeFavorite(TvShow tvShow) {
    try {
      dataSource.removeFavorite(tvShow.id);
      return const Result.success();
    } catch (error) {
      logger.e(error);
      return const Result.error("Error occurred adding favorite.");
    }
  }
}
