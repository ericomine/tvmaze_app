import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:tvmaze_app/domain/entities/episode.dart';
import 'package:tvmaze_app/domain/entities/search_result.dart';
import 'package:tvmaze_app/domain/entities/tv_show.dart';

part 'tvmaze_api.g.dart';

@RestApi(baseUrl: "http://api.tvmaze.com/")
abstract class TvMazeApi {
  factory TvMazeApi(Dio dio, {String baseUrl}) = _TvMazeApi;

  @GET("/shows")
  Future<List<TvShow>> getShowList({@Query("page") int page});

  @GET('/search/shows')
  Future<List<SearchResult>> searchShows({@Query("q") String query});

  @GET("/shows/{id}")
  Future<TvShow> getShow({@Path("id") int id});

  @GET("/shows/{showId}/episodes")
  Future<List<Episode>> getEpisodes({@Path("showId") int showId});
}
