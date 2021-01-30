import 'package:flutter/material.dart';

import '../../../domain/entities/tv_show.dart';
import 'clip_shadow_path.dart';
import 'rhomboid_clipper.dart';

class RhomboidCard extends StatelessWidget {
  final TVShow tvShow;
  final double padding;
  final void Function(TVShow tvShow) onTap;

  const RhomboidCard({
    Key key,
    this.tvShow,
    this.padding = 20.0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = width * 1.1;

    return ClipShadowPath(
      shadow: const Shadow(blurRadius: 4.0, offset: Offset(0, 2)),
      clipper: RhomboidClipper(),
      child: GestureDetector(
        onTap: () {}, // TODO: Route to ShowDetailsPage
        child: Stack(
          children: [
            if (tvShow.imageOriginal != null)
              SizedBox(
                height: height,
                width: width,
                child: Image.network(
                  tvShow.imageOriginal,
                  fit: BoxFit.cover,
                ),
              ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.teal.withOpacity(1.0),
                  ])),
              height: height,
              width: width,
            ),
            Positioned(
              left: padding,
              bottom: height * 0.05 + padding,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 4 * padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tvShow?.name ?? "-",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(color: Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Text(tvShow?.summary ?? "N/A",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: Colors.white, height: 1.4),
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
