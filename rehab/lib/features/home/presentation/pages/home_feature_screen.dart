import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/core/widgets/loading_widget.dart';
import 'package:rehab/features/home/presentation/cubit/home_cubit.dart';
import 'package:rehab/features/home/presentation/cubit/home_state.dart';
import 'package:rehab/features/home/presentation/widgets/home_card.dart';
import 'package:rehab/features/home/presentation/widgets/sliver_app_bar_widget.dart';
import 'package:rehab/features/sub/search/presentation/cubit/search_cubit.dart';
import 'package:rehab/features/sub/search/presentation/cubit/search_state.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(child: LoadingWidget());
        }

        if (state is HomeErrorState) {
          return Center(child: Text(state.message));
        }

        if (state is HomeSuccessState) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBarWidget(),
                      // BlocBuilder<HomeCubit, HomeState>(
                      //   builder: (context, state) {
                      //     return BlocBuilder<SearchCubit, SearchState>(
                      //       builder: (context, state) {
                      //         if (state is SearchLoadingState) {
                      //           return SliverToBoxAdapter(
                      //             child: const LoadingWidget(),
                      //           );
                      //         }

                      //         if (state is SearchSuccessState) {
                      //           if (state.homes.isEmpty) {
                      //             return SliverToBoxAdapter(
                      //               child: const Center(
                      //                 child: Icon(
                      //                   Icons.search_off_outlined,
                      //                   size: 60,
                      //                   color: Colors.grey,
                      //                 ),
                      //               ),
                      //             );
                      //           }

                      //           return SliverList.builder(
                      //             itemCount: state.homes.length,
                      //             itemBuilder: (context, index) {
                      //               final home = state.homes[index];
                      //               return HomeCard(home: home);
                      //             },
                      //           );
                      //         }

                      //         return SliverToBoxAdapter(
                      //           child: const SizedBox.shrink(),
                      //         );
                      //       },
                      //     );
                      //   },
                      // ),
                      BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          if (state is HomeLoadingState) {
                            return SliverToBoxAdapter(
                              child: const LoadingWidget(),
                            );
                          }

                          if (state is HomeSuccessState) {
                            if (state.homes.isEmpty) {
                              return SliverToBoxAdapter(
                                child: const Center(
                                  child: Icon(
                                    Icons.search_off_outlined,
                                    size: 60,
                                    color: Colors.grey,
                                  ),
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
