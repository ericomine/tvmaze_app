import 'package:flutter/material.dart';

import '../../domain/entities/tv_show.dart';
import 'clip_shadow_path.dart';
import 'rhomboid_clipper.dart';

class RhomboidCard extends StatelessWidget {
  final TVShow tvShow;
  final double padding;

  const RhomboidCard({
    Key key,
    this.tvShow,
    this.padding = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ClipShadowPath(
      shadow: const Shadow(blurRadius: 4.0, offset: Offset(0, 2)),
      clipper: RhomboidClipper(),
      child: Stack(
        children: [
          SizedBox(
            height: width,
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
            height: width,
            width: width,
          ),
          Positioned(
            left: padding,
            bottom: width * 0.05 + padding,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 4 * padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tvShow?.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  Text(tvShow?.summary,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: Colors.white),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
