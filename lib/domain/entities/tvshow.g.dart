// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tvshow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TVShow _$TVShowFromJson(Map<String, dynamic> json) {
  return TVShow(
    json['id'] as int,
    json['url'] as String,
    json['name'] as String,
    (json['genres'] as List)?.map((e) => e as String)?.toList(),
    json['officialSite'] as String,
    json['summary'] as String,
  );
}

Map<String, dynamic> _$TVShowToJson(TVShow instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'genres': instance.genres,
      'officialSite': instance.officialSite,
      'summary': instance.summary,
    };
