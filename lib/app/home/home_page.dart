import 'package:flutter/material.dart';

import '../../domain/entities/tv_show.dart';
import '../widgets/rhomboid_card/rhomboid_card.dart';
import '../widgets/search_bar/search_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      RhomboidCard(tvShow: _tempTVShow),
                      RhomboidCard(tvShow: _tempTVShow),
                      RhomboidCard(tvShow: _tempTVShow),
                    ],
                  ),
                ),
              ),
              SearchBar(),
            ],
          ),
        ),
      ),
    );
  }
}

final _tempTVShow = TVShow(
    name: "Under the Dome",
    imageMedium:
        "http://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg",
    imageOriginal:
        "http://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg",
    summary:
        "<p><b>Under the Dome</b> is the story of a small town that is suddenly and inexplicably sealed off from the rest of the world by an enormous transparent dome. The town's inhabitants must deal with surviving the post-apocalyptic conditions while searching for answers about the dome, where it came from and if and when it will go away.</p>");
