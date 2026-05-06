import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/home_details/presentation/cubit/home_details_cubit.dart';

class HomeDetailsFeatureScreen extends StatelessWidget {
  const HomeDetailsFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final _ = context.read<HomeDetailsCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('HomeDetails Feature Screen')),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
