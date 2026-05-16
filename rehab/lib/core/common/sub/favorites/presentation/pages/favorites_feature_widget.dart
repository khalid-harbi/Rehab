import 'package:rehab/core/exports/app_exports.dart';

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
