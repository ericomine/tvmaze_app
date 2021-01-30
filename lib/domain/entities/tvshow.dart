import 'package:json_annotation/json_annotation.dart';

part 'tvshow.g.dart';

@JsonSerializable()
class TVShow {
  String field;

  TVShow({this.field});

  factory TVShow.fromJson(Map<String, dynamic> json) => _$TVShowFromJson(json);
  Map<String, dynamic> toJson() => _$TVShowToJson(this);
}
