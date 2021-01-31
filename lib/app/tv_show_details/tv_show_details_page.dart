import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvmaze_app/app/widgets/big_progress_indicator.dart';
import 'package:tvmaze_app/app/widgets/rhomboid_card/rhomboid_card.dart';

import '../common/cubit_page.dart';
import 'tv_show_details_cubit.dart';
import 'tv_show_details_state.dart';

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
    return Scaffold(
      body: BlocBuilder<TvShowDetailsCubit, TvShowDetailsState>(
        buildWhen: (previous, current) => previous.tvShow != current.tvShow,
        builder: (context, state) {
          if (state.isLoading) {
            return BigProgressIndicator();
          }

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                brightness: Brightness.dark,
                expandedHeight: 600,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(state.tvShow?.imageOriginal,
                      fit: BoxFit.cover),
                  //title: Text(state.tvShow?.name ?? ""),
                ),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(color: Colors.red, height: 300),
                  Container(color: Colors.orange, height: 300),
                  Container(color: Colors.yellow, height: 300),
                  Container(color: Colors.green, height: 300),
                  Container(color: Colors.blue, height: 300),
                ]),
              )
            ],
          );
        },
      ),
    );
  }
}
