import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              body: _addGenresToSummary(
                  state.tvShow?.summary, state.tvShow?.genres),
              bodyMaxLines: 20,
              topSpace: 0,
            ),
            RhomboidCard(
              title: "Schedule",
              topSpace: 0,
              body: 'Watch on: ${state.tvShow?.network?.name} '
                  '\nTimezone: ${state.tvShow?.network?.countryInfo?.timezone}',
              customContent: Column(
                children: [
                  const SizedBox(height: 15.0),
                  ScheduleView(schedule: state.tvShow?.schedule),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _addGenresToSummary(String summary, List<String> genres) {
    return '$summary '
        '\n\nGenres: ${genres.join(", ")} ';
  }
}
