import 'package:flutter/material.dart';
import 'package:tvmaze_app/app/tv_show_details/widgets/episode_list_view.dart';
import 'package:tvmaze_app/domain/entities/episode.dart';

class SeasonExplorerPage extends StatefulWidget {
  final String showName;
  final Map<int, List<Episode>> episodesPerSeason;

  const SeasonExplorerPage({Key key, this.showName, this.episodesPerSeason})
      : super(key: key);

  @override
  _SeasonExplorerPageState createState() => _SeasonExplorerPageState();
}

class _SeasonExplorerPageState extends State<SeasonExplorerPage> {
  int selectedSeason = 1;

  @override
  Widget build(BuildContext context) {
    final seasons = widget.episodesPerSeason.keys.toList();

    final onPrevious = selectedSeason > 1
        ? () => setState(() {
              selectedSeason -= 1;
            })
        : null;

    final onNext = selectedSeason < seasons.last
        ? () => setState(() {
              selectedSeason += 1;
            })
        : null;

    return Scaffold(
      appBar: AppBar(title: Text(widget.showName)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: onPrevious),
                Text("Season $selectedSeason",
                    style: Theme.of(context).textTheme.headline4),
                IconButton(
                    icon: const Icon(Icons.chevron_right), onPressed: onNext)
              ]),
              const SizedBox(height: 10),
              EpisodeListView(
                  season: selectedSeason,
                  episodes: widget.episodesPerSeason[selectedSeason]),
            ],
          ),
        ),
      ),
    );
  }
}
