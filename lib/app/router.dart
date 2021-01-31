import 'package:auto_route/auto_route_annotations.dart';
import 'package:tvmaze_app/app/home/home_page.dart';
import 'package:tvmaze_app/app/tv_show_details/tv_show_details_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: HomePage, initial: true),
    MaterialRoute(page: TvShowDetailsPage),
  ],
)
class $Router {}
