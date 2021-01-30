import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:tvmaze_app/domain/entities/episode.dart';
import 'package:tvmaze_app/domain/entities/tv_show.dart';

part 'tvmaze_api.g.dart';

@RestApi(baseUrl: "http://api.tvmaze.com/")
abstract class TVMazeApi {
  factory TVMazeApi(Dio dio, {String baseUrl}) = _TVMazeApi;

  @GET("/shows")
  Future<List<TVShow>> getShowList({@Query("page") int page});

  @GET("/search/shows")
  Future<List<TVShow>> searchShows({@Query("q") String query});

  @GET("/shows/{id}?embed=episodes")
  Future<TVShow> getShow({@Path("id") int id});

  @GET("/shows/{showId}/episodebynumber")
  Future<Episode> getEpisode({
    @Path("showId") int showId,
    @Query("season") int season,
    @Query("number") int number,
  });
}
