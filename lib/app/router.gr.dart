// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../domain/entities/tv_show.dart';
import 'favorites/favorites_page.dart';
import 'home/home_page.dart';
import 'tv_show_details/tv_show_details_page.dart';

class Routes {
  static const String favoritesPage = '/favorites-page';
  static const String homePage = '/';
  static const String tvShowDetailsPage = '/tv-show-details-page';
  static const all = <String>{
    favoritesPage,
    homePage,
    tvShowDetailsPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.favoritesPage, page: FavoritesPage),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.tvShowDetailsPage, page: TvShowDetailsPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
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

/// TvShowDetailsPage arguments holder class
class TvShowDetailsPageArguments {
  final int tvShowId;
  final TVShow tvShow;
  TvShowDetailsPageArguments({@required this.tvShowId, @required this.tvShow});
}
