import 'dart:ui';

import 'package:flutter/material.dart';

import 'clip_shadow_path.dart';
import 'rhomboid_clipper.dart';

class RhomboidCard extends StatelessWidget {
  final String title;
  final String body;
  final int bodyMaxLines;
  final String imagePath;
  final double topSpace;
  final double padding;
  final Color customColor;
  final Widget customContent;
  final void Function() onTap;

  const RhomboidCard({
    Key key,
    this.title,
    this.body,
    this.bodyMaxLines = 4,
    this.imagePath,
    this.topSpace = 10,
    this.padding = 20,
    this.customColor,
    this.customContent,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipShadowPath(
      shadow: const Shadow(
          blurRadius: 2.0, color: Colors.grey, offset: Offset(0, 4)),
      clipper: RhomboidClipper(),
      child: GestureDetector(
        onTap: onTap,
        child: _buildLayers(context, topSpace),
      ),
    );
  }

  Widget _buildLayers(BuildContext context, double topSpace) {
    if (imagePath == null) {
      return Container(
          width: MediaQuery.of(context).size.width - 2 * padding,
          color: customColor ?? Theme.of(context).primaryColor,
          child: _buildContent(context));
    }

    return Container(
        width: MediaQuery.of(context).size.width - 2 * padding,
        decoration: BoxDecoration(
            color: customColor ?? Theme.of(context).primaryColor,
            image: DecorationImage(
                image: NetworkImage(imagePath), fit: BoxFit.cover)),
        child: _buildContent(context));
  }

  Widget _buildContent(BuildContext context) {
    final hasContent = title != null || body != null || customContent != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: topSpace),
        if (hasContent)
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: customColor?.withOpacity(0.8) ??
                        Theme.of(context).primaryColor.withOpacity(0.8)),
                padding:
                    EdgeInsets.fromLTRB(padding, padding, padding, 2 * padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null && title.isNotEmpty)
                      Text(title,
                          style: Theme.of(context).textTheme.headline3,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    if (body != null && body.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Text(body,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(height: 1.4),
                            maxLines: bodyMaxLines,
                            overflow: TextOverflow.ellipsis),
                      ),
                    if (customContent != null) customContent,
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
