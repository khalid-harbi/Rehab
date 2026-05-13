import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rehab/core/common/sub/favorites/presentation/cubit/favorites_cubit.dart';


class FavoritesFeatureWidget extends StatelessWidget {
  const FavoritesFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final _ = context.read<FavoritesCubit>();
          return Column(children: [
              
              ],
            );
        },
      ),
    );
  }
}
