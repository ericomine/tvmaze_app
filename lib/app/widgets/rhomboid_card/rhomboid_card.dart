import 'package:flutter/material.dart';

import '../../../domain/entities/tv_show.dart';
import 'clip_shadow_path.dart';
import 'rhomboid_clipper.dart';

class RhomboidCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String body;
  final int bodyMaxLines;
  final double padding;
  final void Function() onTap;

  const RhomboidCard({
    Key key,
    @required this.title,
    this.body,
    this.bodyMaxLines = 5,
    this.imagePath,
    this.padding = 20.0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = width * 1.1;

    return ClipShadowPath(
      shadow: const Shadow(
        blurRadius: 2.0,
        color: Colors.grey,
        offset: Offset(0, 4),
      ),
      clipper: RhomboidClipper(),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            if (imagePath != null)
              SizedBox(
                height: height,
                width: width,
                child: Image.network(
                  imagePath,
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
                    Text(title ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(color: Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Text(body ?? "N/A",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: Colors.white, height: 1.4),
                          maxLines: bodyMaxLines,
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
