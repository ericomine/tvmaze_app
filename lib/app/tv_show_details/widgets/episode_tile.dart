import 'package:flutter/material.dart';
import 'package:tvmaze_app/app/tv_show_details/widgets/episode_dialog.dart';

import '../../../domain/entities/episode.dart';

class EpisodeTile extends StatelessWidget {
  final Episode episode;

  const EpisodeTile({Key key, this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListTile(
        title: Text(
          "S${episode.season}E${episode.number} - ${episode.name}",
          style: Theme.of(context).textTheme.headline6,
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () async {
          await showDialog(
              context: context, child: EpisodeDialog(episode: episode));
        },
      ),
    );
  }
}
