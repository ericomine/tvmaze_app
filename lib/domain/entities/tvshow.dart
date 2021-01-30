import 'package:json_annotation/json_annotation.dart';

part 'tvshow.g.dart';

// Required for app
// Name
// Poster
// Days and time during which the series airs
// Genres
// Summary
// List of episodes separated by season

@JsonSerializable()
class TVShow {
  final int id;
  final String url;
  final String name;
  final List<String> genres;
  final String officialSite;
  // final Schedule schedule; // TODO: required
  // final Network network; // TODO: not required, but really makes sense to show
  // final String image; // TODO: required
  final String summary;
  // final String _embedded;

  TVShow(
    this.id,
    this.url,
    this.name,
    this.genres,
    this.officialSite,
    // this.schedule,
    // this.network,
    // this.image,
    this.summary,
    // this._embedded,
  );

  factory TVShow.fromJson(Map<String, dynamic> json) => _$TVShowFromJson(json);
  Map<String, dynamic> toJson() => _$TVShowToJson(this);
}
