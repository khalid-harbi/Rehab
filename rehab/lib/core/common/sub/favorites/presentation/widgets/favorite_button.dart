import 'package:rehab/core/exports/app_exports.dart';

class FavoriteButton extends HookWidget {
  final int homeId;

  const FavoriteButton({super.key, required this.homeId});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<FavoritesCubit>().checkFavorite(homeId: homeId);

      return null;
    }, [homeId]);
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        bool isFavorite = false;

        if (state is FavoritesSuccessState && state.homeId == homeId) {
          isFavorite = state.isFavorite;
        }

        return CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              context.read<FavoritesCubit>().toggleFavorite(homeId: homeId);
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite
                  ? Colors.red
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        );
      },
    );
  }
}
