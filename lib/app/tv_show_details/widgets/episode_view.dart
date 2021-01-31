import 'package:flutter/material.dart';

import '../../../domain/entities/episode.dart';

class EpisodeView extends StatelessWidget {
  final Episode episode;

  const EpisodeView({Key key, this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        "S${episode.season}E${episode.number} - ${episode.name}",
        style: Theme.of(context).textTheme.headline6,
      ),
      childrenPadding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      children: [
        _buildThumbnail(context, episode.imageOriginal ?? episode.imageMedium),
        const SizedBox(height: 15),
        Row(children: [Text("Aired on: ${episode.airdate}")]),
        Text("Summary: ${episode.summary}"),
      ],
    );
  }

  Widget _buildThumbnail(BuildContext context, String imagePath) {
    if (imagePath == null) {
      return Column(children: const [
        Icon(Icons.no_photography_outlined),
        Text("No image available."),
      ]);
    }

    return Image.network(
      episode.imageOriginal,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress != null) {
          return const LinearProgressIndicator();
        }
        return PhysicalModel(
          color: Colors.black,
          elevation: 4,
          child: child,
        );
      },
    );
  }
}
