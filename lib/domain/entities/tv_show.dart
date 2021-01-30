import 'aux/schedule.dart';
import 'aux/tv_network.dart';
import 'episode.dart';

class TVShow {
  final int id;
  final String url;
  final String name;
  final List<String> genres;
  final String status;
  final String officialSite;
  final Schedule schedule;
  final TVNetwork network;
  final String imageMedium;
  final String imageOriginal;
  final String summary;
  final List<Episode> episodes;

  TVShow(
      {this.id,
      this.url,
      this.name,
      this.genres,
      this.status,
      this.officialSite,
      this.schedule,
      this.network,
      this.imageMedium,
      this.imageOriginal,
      this.summary,
      this.episodes});

  factory TVShow.fromJson(Map<String, dynamic> json) {
    final episodes = (json['_embedded']['episodes'] as List).map((entry) {
      final entryJson = entry as Map<String, dynamic>;
      final episode = Episode.fromJson(entryJson);
      return episode;
    }).toList();

    return TVShow(
      id: json['id'] as int,
      url: json['url'] as String,
      name: json['name'] as String,
      genres: List<String>.from(json['genres'] as List),
      status: json['status'] as String,
      officialSite: json['officialSite'] as String,
      schedule: Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
      network: TVNetwork.fromJson(json['network'] as Map<String, dynamic>),
      imageMedium: json['image']['medium'] as String,
      imageOriginal: json['image']['original'] as String,
      summary: json['summary'] as String,
      episodes: episodes,
    );
  }
}
