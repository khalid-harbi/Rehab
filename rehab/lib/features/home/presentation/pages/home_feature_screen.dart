import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rehab/features/home/presentation/cubit/home_cubit.dart';
import 'package:rehab/features/sub/search/presentation/cubit/search_cubit.dart';
import 'package:rehab/features/sub/search/presentation/pages/search_feature_widget.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<HomeCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Home Feature Screen')),
      body: BlocProvider(
        create: (context) => SearchCubit(GetIt.I.get()),
        child: SearchFeatureWidget(),
      ),
    );
  }
}
