import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvmaze_app/app/router.gr.dart';
import 'package:tvmaze_app/app/widgets/big_progress_indicator.dart';
import 'package:tvmaze_app/app/widgets/tv_static_warning.dart';

import '../common/cubit_page.dart';
import 'favorites_cubit.dart';
import 'favorites_state.dart';

class FavoritesPage extends CubitPage<FavoritesCubit> {
  @override
  void onInit(BuildContext context, FavoritesCubit cubit) {
    super.onInit(context, cubit);
    cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Favorite Shows")),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
              if (state.isLoading) {
                return BigProgressIndicator();
              }

              if (state.favorites.isEmpty) {
                return const TvStaticWarning(message: "No favorite shows");
              }

              return ListView.builder(
                itemCount: state.favorites.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: const Icon(Icons.favorite),
                      title: Text(state.favorites[index].name),
                      onTap: () async {
                        await ExtendedNavigator.root.push(
                            Routes.tvShowDetailsPage,
                            arguments: TvShowDetailsPageArguments(
                                tvShowId: state.favorites[index].id,
                                tvShow: state.favorites[index]));
                        context.read<FavoritesCubit>().checkUpdates();
                      },
                      trailing: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => context
                            .read<FavoritesCubit>()
                            .removeFavorite(state.favorites[index].id),
                      ));
                },
              );
            },
          ),
        ));
  }
}
