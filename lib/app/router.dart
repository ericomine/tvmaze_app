import 'package:auto_route/auto_route_annotations.dart';

import 'auth/auth_page.dart';
import 'favorites/favorites_page.dart';
import 'home/home_page.dart';
import 'tv_show_details/tv_show_details_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: AuthPage, initial: true),
    MaterialRoute(page: FavoritesPage),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: TvShowDetailsPage),
  ],
)
class $Router {}
