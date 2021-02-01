import 'package:tvmaze_app/domain/entities/tv_show.dart';

class SearchResult {
  final double score;
  final TvShow tvShow;

  SearchResult({this.score, this.tvShow});

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      score: json['score'] as double,
      tvShow: TvShow.fromJson(json['show'] as Map<String, dynamic>),
    );
  }
}
