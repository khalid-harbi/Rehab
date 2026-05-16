import 'package:rehab/core/exports/app_exports.dart';

class FavoritesFeatureWidget extends StatelessWidget {
  const FavoritesFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.I<FavoritesCubit>()..getFavoriteHomesMethod(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الإعجابات'),
        ),
        body: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesHomesSuccessState) {
              if (state.homes.isEmpty) {
                return const Center(
                  child: Text('لا توجد إعجابات حالياً'),
                );
              }

              return ListView.builder(
                itemCount: state.homes.length,
                itemBuilder: (context, index) {
                  final home = state.homes[index];

                  return ListTile(
                    title: Text(home.title),
                    subtitle: Text(home.city),
                  );
                },
              );
            }

            if (state is FavoritesErrorState) {
              return Center(
                child: Text(state.message),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}