import '../../app/common/string_x.dart';

class Episode {
  final int id;
  final String url;
  final String name;
  final int season;
  final int number;
  final String type;
  final String airdate;
  final String airtime;
  final String airstamp;
  final int runtime;
  final String imageMedium;
  final String imageOriginal;
  final String summary;

  Episode({
    this.id,
    this.url,
    this.name,
    this.season,
    this.number,
    this.type,
    this.airdate,
    this.airtime,
    this.airstamp,
    this.runtime,
    this.imageMedium,
    this.imageOriginal,
    this.summary,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    final hasMediumImage =
        (json['image'] as Map)?.containsKey('medium') ?? false;
    final hasOriginalImage =
        (json['image'] as Map)?.containsKey('original') ?? false;

    final imageMedium =
        hasMediumImage ? json['image']['medium'] as String : null;
    final imageOriginal =
        hasOriginalImage ? json['image']['original'] as String : null;

    return Episode(
      id: json['id'] as int,
      url: json['url'] as String,
      name: json['name'] as String,
      season: json['season'] as int,
      number: json['number'] as int,
      type: json['type'] as String,
      airdate: json['airdate'] as String,
      airtime: json['airtime'] as String,
      airstamp: json['airstamp'] as String,
      runtime: json['runtime'] as int,
      imageMedium: imageMedium,
      imageOriginal: imageOriginal,
      summary: (json['summary'] as String)?.removeHtmlTags(),
    );
  }
}
