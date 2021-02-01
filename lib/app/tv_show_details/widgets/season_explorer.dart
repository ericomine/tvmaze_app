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
  int selectedSeason = 1;

  @override
  Widget build(BuildContext context) {
    final seasons = widget.episodesPerSeason.keys.toList();

    final onPrevious = selectedSeason > 1
        ? () => setState(() {
              selectedSeason -= 1;
            })
        : null;

    final onNext = selectedSeason <= seasons.last
        ? () => setState(() {
              selectedSeason += 1;
            })
        : null;

    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
              icon: const Icon(Icons.chevron_left), onPressed: onPrevious),
          Text("Season $selectedSeason",
              style: Theme.of(context).textTheme.headline5),
          IconButton(icon: const Icon(Icons.chevron_right), onPressed: onNext)
        ]),
        EpisodeListView(
            season: selectedSeason,
            episodes: widget.episodesPerSeason[selectedSeason]),
      ],
    );
  }
}
