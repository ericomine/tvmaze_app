import 'country_info.dart';

class TVNetwork {
  final int id;
  final String name;
  final CountryInfo countryInfo;

  TVNetwork({this.id, this.name, this.countryInfo});

  factory TVNetwork.fromJson(Map<String, dynamic> json) {
    return TVNetwork(
      id: json['id'] as int,
      name: json['name'] as String,
      countryInfo:
          CountryInfo.fromJson(json['country'] as Map<String, dynamic>),
    );
  }
}
