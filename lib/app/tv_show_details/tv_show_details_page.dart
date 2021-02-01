import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/tv_show.dart';
import '../common/cubit_page.dart';
import '../router.gr.dart';
import '../widgets/big_progress_indicator.dart';
import '../widgets/rhomboid_card/rhomboid_card.dart';
import '../widgets/tv_static_warning.dart';
import 'tv_show_details_cubit.dart';
import 'tv_show_details_state.dart';
import 'widgets/count_card.dart';
import 'widgets/schedule_view.dart';

class TvShowDetailsPage extends CubitPage<TvShowDetailsCubit> {
  final int tvShowId;
  final TvShow tvShow;

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
      builder: (context, state) {
        if (state.errorMessage != null) {
          return TvStaticWarning(message: state.errorMessage);
        }

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
              topSpace: 600,
            ),
            RhomboidCard(
              title: "Summary",
              body: andExtrasToSummary(state.tvShow?.summary, state.tvShow),
              bodyMaxLines: 20,
            ),
            _buildScheduleCard(state.tvShow),
            _buildEpisodesCard(context, state),
          ],
        ),
      ),
    );
  }

  String andExtrasToSummary(String summary, TvShow tvShow) {
    return '$summary '
        '\n\nGenres: ${tvShow.genres.join(", ")} '
        '\nYear: ${tvShow.premiered.substring(0, 4)} ';
  }

  Widget _buildScheduleCard(TvShow tvShow) {
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

  Widget _buildEpisodesCard(BuildContext context, TvShowDetailsState state) {
    if (state.isLoadingEpisodes) {
      return const RhomboidCard(
          title: "Episodes", customContent: LinearProgressIndicator());
    }

    if (state.episodesPerSeason.isEmpty) {
      return const RhomboidCard(
          title: "Episodes", body: "No information about episodes");
    }

    final totalEpisodes = state.episodesPerSeason.values
        .fold<int>(0, (acc, list) => acc + list.length);

    final content = Column(children: [
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CountCard(counter: state.episodesPerSeason.length, title: "Seasons"),
          CountCard(counter: totalEpisodes, title: "Episodes"),
        ],
      ),
      const SizedBox(height: 20),
      ListTile(
          title: const Text("View detailed episodes information"),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => ExtendedNavigator.root.push(Routes.seasonExplorerPage,
              arguments: SeasonExplorerPageArguments(
                  episodesPerSeason: state.episodesPerSeason,
                  showName: state.tvShow.name)))
    ]);

    return RhomboidCard(title: "Episodes", customContent: content);
  }
}
