import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/cubit_page.dart';
import '../widgets/rhomboid_card/rhomboid_card.dart';
import '../widgets/search_bar/search_bar.dart';
import 'home_cubit.dart';
import 'home_state.dart';

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
          padding: const EdgeInsets.all(20),
          child: BlocConsumer<HomeCubit, HomeState>(
            listenWhen: (previous, current) {
              return previous.searchQuery != current.searchQuery;
            },
            listener: (context, state) {
              // TODO: implement listener
            },
            buildWhen: (previous, current) {
              return previous.showList != current.showList;
            },
            builder: (context, state) {
              if (state.isLoading) {
                return Center(
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black87,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor),
                      strokeWidth: 30,
                    ),
                  ),
                );
              }

              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: _buildShowList(context, state),
                  ),
                  SearchBar(
                    onChanged: (searchQuery) {
                      context.read<HomeCubit>().onQueryChanged(searchQuery);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildShowList(BuildContext context, HomeState state) {
    if (state.noResultFound) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PhysicalModel(
              color: Colors.black,
              shape: BoxShape.circle,
              elevation: 8,
              child: Container(
                height: 240,
                width: 240,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.cover,
                    image: AssetImage("assets/tvstatic.gif"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("No result found",
                  style: Theme.of(context).textTheme.headline6),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
        controller: state.scrollController,
        itemCount: state.showList?.length,
        itemBuilder: (context, index) {
          return RhomboidCard(tvShow: state.showList?.elementAt(index));
        });
  }
}
