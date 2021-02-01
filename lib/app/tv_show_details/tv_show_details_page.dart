import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvmaze_app/app/tv_show_details/widgets/season_explorer.dart';

import '../../domain/entities/tv_show.dart';
import '../common/cubit_page.dart';
import '../widgets/big_progress_indicator.dart';
import '../widgets/rhomboid_card/rhomboid_card.dart';
import 'tv_show_details_cubit.dart';
import 'tv_show_details_state.dart';
import 'widgets/schedule_view.dart';

class TvShowDetailsPage extends CubitPage<TvShowDetailsCubit> {
  final int tvShowId;
  final TVShow tvShow;

  TvShowDetailsPage(this.tvShowId, this.tvShow);

  @override
  void onInit(BuildContext context, TvShowDetailsCubit cubit) {
    super.onInit(context, cubit);
    cubit.init(tvShowId: tvShowId, tvShow: tvShow);
    cubit.loadEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowDetailsCubit, TvShowDetailsState>(
      buildWhen: (previous, current) =>
          previous.tvShow != current.tvShow ||
          previous.episodesPerSeason != current.episodesPerSeason ||
          previous.isFavorite != current.isFavorite,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.tvShow?.name ?? ""),
            actions: [
              IconButton(
                tooltip: "Add to favorites",
                icon: state.isFavorite
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_outline),
                onPressed: context.read<TvShowDetailsCubit>().toggleFavorite,
              )
            ],
          ),
          body: SafeArea(
            child: _buildBody(context, state),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, TvShowDetailsState state) {
    if (state.isLoadingShow) {
      return BigProgressIndicator();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        controller: state.scrollController,
        child: Column(
          children: [
            RhomboidCard(
              imagePath: state.tvShow.imageOriginal ?? state.tvShow.imageMedium,
              filterImage: false,
              topSpace: 400,
            ),
            RhomboidCard(
              title: "Summary",
              body: andExtrasToSummary(state.tvShow?.summary, state.tvShow),
              bodyMaxLines: 20,
            ),
            _buildScheduleCard(state.tvShow),
            RhomboidCard(
              title: "Episodes",
              customContent: _buildEpisodesList(context, state),
            ),
          ],
        ),
      ),
    );
  }

  String andExtrasToSummary(String summary, TVShow tvShow) {
    return '$summary '
        '\n\nGenres: ${tvShow.genres.join(", ")} '
        '\nYear: ${tvShow.premiered.substring(0, 4)} ';
  }

  Widget _buildScheduleCard(TVShow tvShow) {
    if (tvShow?.status == 'Ended') {
      return const RhomboidCard(
        title: "Schedule",
        body: 'This show is not currently being broadcasted.',
      );
    }

    return RhomboidCard(
      title: "Schedule",
      body: 'Watch on: ${tvShow?.network?.name} '
          '\nTimezone: ${tvShow?.network?.countryInfo?.timezone}',
      customContent: Column(
        children: [
          const SizedBox(height: 15.0),
          ScheduleView(schedule: tvShow?.schedule),
        ],
      ),
    );
  }

  Widget _buildEpisodesList(BuildContext context, TvShowDetailsState state) {
    if (state.isLoadingEpisodes) {
      return const LinearProgressIndicator();
    }

    if (state.episodesPerSeason.isEmpty) {
      return const Text("No episodes to show");
    }

    return SeasonExplorer(episodesPerSeason: state.episodesPerSeason);
  }
}
