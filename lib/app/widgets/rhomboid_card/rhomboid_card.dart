import 'package:flutter/material.dart';

import 'clip_shadow_path.dart';
import 'rhomboid_clipper.dart';

class RhomboidCard extends StatelessWidget {
  final String title;
  final String body;
  final int bodyMaxLines;
  final String imagePath;
  final bool filterImage;
  final double topSpace;
  final double padding;
  final Widget customContent;
  final void Function() onTap;

  const RhomboidCard({
    Key key,
    this.title,
    this.body,
    this.bodyMaxLines = 5,
    this.imagePath,
    this.filterImage = true,
    this.topSpace = 120,
    this.padding = 20,
    this.customContent,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipShadowPath(
      shadow: const Shadow(
        blurRadius: 2.0,
        color: Colors.grey,
        offset: Offset(0, 4),
      ),
      clipper: RhomboidClipper(),
      child: GestureDetector(
        onTap: onTap,
        child: _buildContent(context, topSpace),
      ),
    );
  }

  Widget _buildContent(BuildContext context, double topSpace) {
    return Container(
      width: MediaQuery.of(context).size.width - 2 * padding,
      decoration: BoxDecoration(
        image: imagePath != null
            ? DecorationImage(
                image: NetworkImage(imagePath),
                colorFilter: filterImage
                    ? ColorFilter.mode(
                        Theme.of(context).primaryColor.withOpacity(0.2),
                        BlendMode.modulate)
                    : null,
                fit: BoxFit.cover)
            : null,
        color: Theme.of(context).primaryColor,
      ),
      padding: EdgeInsets.fromLTRB(padding, 2 * padding, padding, 2 * padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: topSpace),
          Text(title ?? "",
              style: Theme.of(context).textTheme.headline3,
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
          const SizedBox(height: 8.0),
          if (body?.isNotEmpty ?? false)
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
    );
  }
}
