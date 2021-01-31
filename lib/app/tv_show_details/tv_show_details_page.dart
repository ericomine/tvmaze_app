import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/tv_show.dart';

import '../common/cubit_page.dart';
import '../widgets/big_progress_indicator.dart';
import '../widgets/rhomboid_card/rhomboid_card.dart';
import 'tv_show_details_cubit.dart';
import 'tv_show_details_state.dart';
import 'widgets/schedule_view.dart';

class TvShowDetailsPage extends CubitPage<TvShowDetailsCubit> {
  final int tvShowId;

  TvShowDetailsPage(this.tvShowId);

  @override
  void onInit(BuildContext context, TvShowDetailsCubit cubit) {
    super.onInit(context, cubit);
    cubit.init(tvShowId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowDetailsCubit, TvShowDetailsState>(
      buildWhen: (previous, current) => previous.tvShow != current.tvShow,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.tvShow?.name ?? ""),
          ),
          body: SafeArea(
            child: _buildBody(context, state),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, TvShowDetailsState state) {
    if (state.isLoading) {
      return BigProgressIndicator();
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            RhomboidCard(
              imagePath: state.tvShow?.imageOriginal,
              filterImage: false,
              topSpace: 400,
            ),
            RhomboidCard(
              title: "Summary",
              body: andExtrasToSummary(state.tvShow?.summary, state.tvShow),
              bodyMaxLines: 20,
              topSpace: 0,
            ),
            _buildScheduleCard(state.tvShow),
            const RhomboidCard(
              title: "Episodes",
              topSpace: 0,
            )
          ],
        ),
      ),
    );
  }

  String andExtrasToSummary(String summary, TVShow tvShow) {
    return '$summary '
        '\n\nGenres: ${tvShow.genres.join(", ")} '
        '\n\nYear: ${tvShow.premiered.substring(0, 4)} ';
  }

  Widget _buildScheduleCard(TVShow tvShow) {
    if (tvShow?.status == 'Ended') {
      return const RhomboidCard(
        title: "Schedule",
        topSpace: 0,
        body: 'This show is not currently being broadcasted.',
      );
    }

    return RhomboidCard(
      title: "Schedule",
      topSpace: 0,
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
}
