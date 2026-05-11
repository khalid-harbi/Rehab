import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/home/presentation/cubit/home_cubit.dart';
import 'package:rehab/features/home/presentation/cubit/home_state.dart';
import 'package:rehab/features/home/presentation/widgets/home_card.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeErrorState) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is HomeSuccessState) {
              final homes = state.homes;
              return ListView.builder(
                itemCount: homes.length,
                itemBuilder: (context, index) {
                  final home = homes[index];
                  return HomeCard(home: home); 
                },
              );
            }
            return const SizedBox();
          },
        ),
    );
  }
}