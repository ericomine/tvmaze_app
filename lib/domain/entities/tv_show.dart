import 'aux/schedule.dart';
import 'aux/tv_network.dart';

// Required for app
// Name
// Poster
// Days and time during which the series airs
// Genres
// Summary
// List of episodes separated by season

class TVShow {
  final int id;
  final String url;
  final String name;
  final List<String> genres;
  final String officialSite;
  final Schedule schedule; // TODO: required
  final TVNetwork network; // TODO: not required, but really makes sense to show
  final String imageMedium;
  final String imageOriginal; // TODO: required
  final String summary;
  // final String _embedded;

  TVShow({
    this.id,
    this.url,
    this.name,
    this.genres,
    this.officialSite,
    this.schedule,
    this.network,
    this.imageMedium,
    this.imageOriginal,
    this.summary,
    // this._embedded,
  });

  factory TVShow.fromJson(Map<String, dynamic> json) {
    final result = TVShow(
      id: json['id'] as int,
      url: json['url'] as String,
      name: json['name'] as String,
      genres: List<String>.from(json['genres'] as List),
      officialSite: json['officialSite'] as String,
      schedule: Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
      network: TVNetwork.fromJson(json['network'] as Map<String, dynamic>),
      imageMedium: json['image']['medium'] as String,
      imageOriginal: json['image']['original'] as String,
      summary: json['summary'] as String,
    );
    return result;
  }
}
