import 'package:flutter/material.dart';
import 'package:tvmaze_app/domain/entities/episode.dart';

import 'episode_tile.dart';

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

    final seasonEpisodes = episodes.where((ep) => ep.season == season).toList();
    seasonEpisodes.sort((a, b) => a.number - b.number);

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: seasonEpisodes.length,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: EpisodeTile(episode: seasonEpisodes[index]),
            ));
  }
}
