import 'package:flutter/material.dart';
import 'package:tvmaze_app/domain/entities/episode.dart';

import 'episode_view.dart';

class EpisodeListView extends StatelessWidget {
  final int season;
  final List<Episode> episodes;

  const EpisodeListView({
    Key key,
    this.season,
    this.episodes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (episodes == null || episodes.isEmpty) {
      return Container();
    }

    final header = Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Text(
        "Season $season",
        style: Theme.of(context).textTheme.headline5,
      ),
    );

    final seasonEpisodes = episodes.where((ep) => ep.season == season).toList();
    seasonEpisodes.sort((a, b) => a.number - b.number);

    final episodeViewList =
        seasonEpisodes.map((ep) => EpisodeView(episode: ep));

    return Column(children: [header, ...episodeViewList]);
  }
}
