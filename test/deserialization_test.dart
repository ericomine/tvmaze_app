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
    test(
      'Should get TVShow.name from JSON deserialization',
      () async {
        final tvShow = await realApi.getShow(1);
        expect(tvShow.name, equals("Under the Dome"));
      },
    );
  });
}
