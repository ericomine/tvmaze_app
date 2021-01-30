import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart' hide test;
import 'package:tvmaze_app/data/api/tvmaze_api.dart';
import 'package:tvmaze_app/injection.dart';

void main() {
  configureInjection(Environment.dev);
  final getIt = GetIt.instance;
  final realApi = getIt.get<TVMazeApi>();

  group('Get TVShow from the API', () {
    test('Should get TVShow.name from JSON deserialization', () async {
      final tvShow = await realApi.getShow(1);
      expect(tvShow.name, equals("Under the Dome"));
    });

    test('Should get TVShow.genres from JSON deserialization', () async {
      final tvShow = await realApi.getShow(1);
      expect(tvShow.genres, equals(["Drama", "Science-Fiction", "Thriller"]));
    });

    test('Should get TVShow.network.countryInfo from JSON deserialization',
        () async {
      final tvShow = await realApi.getShow(1);
      expect(tvShow.network.name, equals("CBS"));
      expect(tvShow.network.countryInfo.name, equals("United States"));
      expect(tvShow.network.countryInfo.code, equals("US"));
      expect(tvShow.network.countryInfo.timezone, equals("America/New_York"));
    });

    test('Should get TVShow.schedule from JSON deserialization', () async {
      final tvShow = await realApi.getShow(1);
      expect(tvShow.schedule.time, equals("22:00"));
      expect(tvShow.schedule.days, equals(["Thursday"]));
    });
  });
}
