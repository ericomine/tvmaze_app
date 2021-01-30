class CountryInfo {
  final String name;
  final String code;
  final String timezone;

  CountryInfo({this.name, this.code, this.timezone});

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    return CountryInfo(
      name: json['name'] as String,
      code: json['code'] as String,
      timezone: json['timezone'] as String,
    );
  }
}
