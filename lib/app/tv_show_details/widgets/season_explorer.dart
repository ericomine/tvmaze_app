import 'package:flutter/material.dart';
import 'package:tvmaze_app/app/tv_show_details/widgets/episode_list_view.dart';
import '../../../domain/entities/episode.dart';

class SeasonExplorer extends StatefulWidget {
  final Map<int, List<Episode>> episodesPerSeason;

  const SeasonExplorer({Key key, this.episodesPerSeason}) : super(key: key);

  @override
  _SeasonExplorerState createState() => _SeasonExplorerState();
}

class _SeasonExplorerState extends State<SeasonExplorer> {
  final pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    final seasons = widget.episodesPerSeason.keys;

    return PageView.builder(
      controller: pageController,
      itemCount: seasons.length,
      itemBuilder: (context, index) => EpisodeListView(
        season: index + 1,
        episodes: widget.episodesPerSeason[index + 1],
      ),
    );
  }
}
