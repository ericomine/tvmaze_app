// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../domain/entities/episode.dart';
import '../domain/entities/tv_show.dart';
import 'auth/auth_page.dart';
import 'favorites/favorites_page.dart';
import 'home/home_page.dart';
import 'season_explorer/season_explorer_page.dart';
import 'tv_show_details/tv_show_details_page.dart';

class Routes {
  static const String authPage = '/';
  static const String favoritesPage = '/favorites-page';
  static const String homePage = '/home-page';
  static const String seasonExplorerPage = '/season-explorer-page';
  static const String tvShowDetailsPage = '/tv-show-details-page';
  static const all = <String>{
    authPage,
    favoritesPage,
    homePage,
    seasonExplorerPage,
    tvShowDetailsPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.authPage, page: AuthPage),
    RouteDef(Routes.favoritesPage, page: FavoritesPage),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.seasonExplorerPage, page: SeasonExplorerPage),
    RouteDef(Routes.tvShowDetailsPage, page: TvShowDetailsPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    AuthPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AuthPage(),
        settings: data,
      );
    },
    FavoritesPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => FavoritesPage(),
        settings: data,
      );
    },
    HomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
      );
    },
    SeasonExplorerPage: (data) {
      final args = data.getArgs<SeasonExplorerPageArguments>(
        orElse: () => SeasonExplorerPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SeasonExplorerPage(
          key: args.key,
          showName: args.showName,
          episodesPerSeason: args.episodesPerSeason,
        ),
        settings: data,
      );
    },
    TvShowDetailsPage: (data) {
      final args = data.getArgs<TvShowDetailsPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => TvShowDetailsPage(
          args.tvShowId,
          args.tvShow,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// SeasonExplorerPage arguments holder class
class SeasonExplorerPageArguments {
  final Key key;
  final String showName;
  final Map<int, List<Episode>> episodesPerSeason;
  SeasonExplorerPageArguments(
      {this.key, this.showName, this.episodesPerSeason});
}

/// TvShowDetailsPage arguments holder class
class TvShowDetailsPageArguments {
  final int tvShowId;
  final TvShow tvShow;
  TvShowDetailsPageArguments({@required this.tvShowId, @required this.tvShow});
}
