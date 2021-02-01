import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/cubit_page.dart';
import '../router.gr.dart';
import '../widgets/big_progress_indicator.dart';
import '../widgets/rhomboid_card/rhomboid_card.dart';
import '../widgets/search_bar/search_bar.dart';
import '../widgets/tv_static_warning.dart';
import 'home_cubit.dart';
import 'home_state.dart';
import 'widgets/home_modal_sheet.dart';

class HomePage extends CubitPage<HomeCubit> {
  @override
  void onInit(BuildContext context, HomeCubit cubit) {
    super.onInit(context, cubit);
    cubit.init();

    final scrollController = cubit.state.scrollController;
    cubit.state.scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        cubit.onEndOfScroll();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: _buildShowList(context, state),
                  ),
                  SearchBar(
                      onSearchChanged: context.read<HomeCubit>().onQueryChanged,
                      onOpenMenu: () {
                        showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                          ),
                          context: context,
                          builder: (_) {
                            return Container(
                                color: Colors.transparent,
                                child: HomeModalSheet(onTapFav: () {
                                  ExtendedNavigator.root.pop();
                                  ExtendedNavigator.root
                                      .push(Routes.favoritesPage);
                                }, onTapResetFpSettings: () {
                                  context
                                      .read<HomeCubit>()
                                      .resetFingerprintSettings();
                                  ExtendedNavigator.root
                                      .replace(Routes.authPage);
                                  ExtendedNavigator.root.popUntilRoot();
                                }));
                          },
                        );
                      }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildShowList(BuildContext context, HomeState state) {
    if (state.isLoading) {
      return BigProgressIndicator();
    }

    if (state.noResultFound) {
      return const TvStaticWarning(message: "No result found");
    }

    return ListView.builder(
        controller: state.scrollController,
        itemCount: state.showList?.length,
        itemBuilder: (context, index) {
          final tvShow = state.showList?.elementAt(index);
          return RhomboidCard(
            title: tvShow?.name,
            body: tvShow?.summary,
            imagePath: tvShow.imageOriginal ?? tvShow.imageMedium,
            topSpace: 150,
            onTap: () => ExtendedNavigator.root.push(Routes.tvShowDetailsPage,
                arguments: TvShowDetailsPageArguments(
                    tvShowId: tvShow.id, tvShow: tvShow)),
          );
        });
  }
}
