import '../../app/common/string_x.dart';
import 'aux/schedule.dart';
import 'aux/tv_network.dart';
import 'episode.dart';

class TVShow {
  final int id;
  final String url;
  final String name;
  final List<String> genres;
  final String status;
  final String premiered;
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
      this.premiered,
      this.officialSite,
      this.schedule,
      this.network,
      this.imageMedium,
      this.imageOriginal,
      this.summary,
      this.episodes});

  factory TVShow.fromJson(Map<String, dynamic> json) {
    final hasEmbeddedEpisodes =
        (json['_embedded'] as Map)?.containsKey('episodes') ?? false;
    final hasMediumImage =
        (json['image'] as Map)?.containsKey('medium') ?? false;
    final hasOriginalImage =
        (json['image'] as Map)?.containsKey('original') ?? false;

    final episodes = hasEmbeddedEpisodes
        ? (json['_embedded']['episodes'] as List).map((entry) {
            final entryJson = entry as Map<String, dynamic>;
            final episode = Episode.fromJson(entryJson);
            return episode;
          }).toList()
        : <Episode>[];
    final imageMedium =
        hasMediumImage ? json['image']['medium'] as String : null;
    final imageOriginal =
        hasOriginalImage ? json['image']['original'] as String : null;

    return TVShow(
      id: json['id'] as int,
      url: json['url'] as String,
      name: json['name'] as String,
      genres: List<String>.from((json['genres'] as List) ?? []),
      status: json['status'] as String,
      premiered: json['premiered'] as String,
      officialSite: json['officialSite'] as String,
      schedule: Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
      network: TVNetwork.fromJson(json['network'] as Map<String, dynamic>),
      imageMedium: imageMedium,
      imageOriginal: imageOriginal,
      summary: (json['summary'] as String)?.removeHtmlTags(),
      episodes: episodes,
    );
  }
}
