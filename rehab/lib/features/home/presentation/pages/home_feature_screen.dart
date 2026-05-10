import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rehab/core/widgets/loading_widget.dart';
import 'package:rehab/features/home/presentation/cubit/home_cubit.dart';
import 'package:rehab/features/home/presentation/cubit/home_state.dart';
import 'package:rehab/features/home/presentation/widgets/home_card.dart';
import 'package:rehab/features/home/presentation/widgets/sliver_app_bar_widget.dart';
import 'package:rehab/features/sub/search/presentation/cubit/search_cubit.dart';
import 'package:rehab/features/sub/search/presentation/cubit/search_state.dart';

class HomeFeatureScreen extends HookWidget {
  const HomeFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controllerSearch = useTextEditingController();

    // final cubit = context.read<SearchCubit>();

    // useEffect(() {
    //   Timer? timer;

    //   void listener() {
    //     timer?.cancel();

    //     timer = Timer(const Duration(milliseconds: 500), () {
    //       cubit.getSearchMethod(title: controllerSearch.text);
    //     });
    //   }

    //   controllerSearch.addListener(listener);

    //   return () {
    //     controllerSearch.removeListener(listener);
    //     timer?.cancel();
    //   };
    // }, [controllerSearch]);

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is HomeErrorState) {
          return Center(child: Text(state.message));
        }

        if (state is HomeSuccessState) {
          return Scaffold(
            body: Column(
              children: [
                // SafeArea(
                //   bottom: false,
                //   child: SearchBar(controller: controllerSearch),
                // ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBarWidget(),
                      // SliverFillRemaining(
                      //   hasScrollBody: true,
                      //   child: SearchFeatureWidget(),
                      // ),
                      // SliverToBoxAdapter(child: SearchFeatureWidget()),
                      BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {
                          if (state is SearchLoadingState) {
                            return SliverToBoxAdapter(
                              child: const LoadingWidget(),
                            );
                          }

                          if (state is SearchSuccessState) {
                            if (state.homes.isEmpty) {
                              return SliverToBoxAdapter(
                                child: const Center(
                                  child: Text("No items found"),
                                ),
                              );
                            }

                            return SliverList.builder(
                              itemCount: state.homes.length,
                              itemBuilder: (context, index) {
                                final home = state.homes[index];

                                return HomeCard(home: home);
                              },
                            );
                          }

                          return SliverToBoxAdapter(
                            child: const SizedBox.shrink(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
