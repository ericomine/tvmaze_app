import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_app/app/widgets/rhomboid_card/rhomboid_card.dart';
import '../../../domain/entities/episode.dart';

class EpisodeDialog extends StatelessWidget {
  final Episode episode;

  const EpisodeDialog({Key key, this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.transparent,
      children: [
        RhomboidCard(
          padding: 10,
          customColor: Colors.amber,
          customContent: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  const SizedBox(width: 10),
                  Expanded(
                      child: Text(
                          "S${episode.season}E${episode.number} - ${episode.name}",
                          style: Theme.of(context).textTheme.headline5)),
                  IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: ExtendedNavigator.root.pop)
                ]),
                Center(
                    child: _buildThumbnail(
                        context, episode.imageOriginal ?? episode.imageMedium)),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Aired on: ${episode.airdate}"),
                      Text("Summary: ${episode.summary}")
                    ],
                  ),
                )
              ],
            ),
          ),
        )
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
